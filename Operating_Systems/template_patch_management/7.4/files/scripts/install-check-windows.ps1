#Requires -Version 5.1
#Requires -RunAsAdministrator
<#
.SYNOPSIS
    Check only (no updates are installed): installs the check script zbx-patch-windows.ps1,
    runs it by Task Scheduler every N hours and runs it once now.

.DESCRIPTION
    Zabbix (template 'APP Patch management all OS') then gets the update status of this host.
    Use it when you only want the reporting (updates are installed by WSUS, SCCM, Intune,
    another tool or by hand), or to run the check more often than your install job.

    - finds the Zabbix agent (zabbix_sender.exe and the agent config)
    - copies zbx-patch-windows.ps1 from the same folder (or downloads it from GitHub)
      to <Zabbix agent folder>\scripts
    - creates the scheduled task "Zabbix patch check" (SYSTEM) every N hours, shifted by
      a fixed per-host offset of -30..+30 min, so the hosts don't run at the same time
    - runs the check now

.PARAMETER IntervalHours
    Check interval in hours, a divisor of 24 (default 12).

.PARAMETER AgentDir
    Zabbix agent folder (default: C:\Program Files\Zabbix Agent 2, then C:\Program Files\Zabbix Agent).

.PARAMETER ZabbixServer
    Optional: Zabbix server / proxy for the check (instead of ServerActive from the agent config).

.PARAMETER HostName
    Optional: host name in Zabbix (instead of Hostname from the agent config / the computer name).

.PARAMETER NoRun
    Install only, don't run the check now.

.EXAMPLE
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File install-check-windows.ps1
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File install-check-windows.ps1 -IntervalHours 4

.NOTES
    Author : Dusan Priechodsky
    Source : https://github.com/DuprTECH/Zabbix-Patch-Management-Windows-Linux
    Contact: info@duprtech.sk
    License: MIT
#>
param(
    [ValidateSet(1, 2, 3, 4, 6, 8, 12, 24)]
    [int]$IntervalHours = 12,
    [string]$AgentDir = "",
    [string]$ZabbixServer = "",
    [string]$HostName = "",
    [switch]$NoRun
)
$ErrorActionPreference = 'Stop'
$Url      = 'https://raw.githubusercontent.com/DuprTECH/Zabbix-Patch-Management-Windows-Linux/main/scripts/zbx-patch-windows.ps1'
$TaskName = 'Zabbix patch check'

# 1. Zabbix agent
if (-not $AgentDir) {
    $AgentDir = @('C:\Program Files\Zabbix Agent 2', 'C:\Program Files\Zabbix Agent') |
        Where-Object { Test-Path (Join-Path $_ 'zabbix_sender.exe') } | Select-Object -First 1
}
if (-not $AgentDir -or -not (Test-Path (Join-Path $AgentDir 'zabbix_sender.exe'))) {
    throw "zabbix_sender.exe not found - install the Zabbix agent 2 (it includes zabbix_sender) or use -AgentDir."
}
$sender = Join-Path $AgentDir 'zabbix_sender.exe'
$conf   = Get-ChildItem $AgentDir -Filter 'zabbix_agent*.conf' | Select-Object -First 1
if (-not $conf) { throw "Zabbix agent config not found in $AgentDir" }

# 2. Check script: local copy next to this script, or download
$scripts = Join-Path $AgentDir 'scripts'
New-Item -ItemType Directory -Force $scripts | Out-Null
$dest  = Join-Path $scripts 'zbx-patch-windows.ps1'
$local = if ($PSScriptRoot) { Join-Path $PSScriptRoot 'zbx-patch-windows.ps1' } else { '' }
if ($local -and (Test-Path $local) -and ($local -ne $dest)) {
    Copy-Item $local $dest -Force
} elseif (-not ($local -and $local -eq $dest)) {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri $Url -OutFile $dest -UseBasicParsing
}
Write-Output "Installed $dest"

# 3. Scheduled task: every IntervalHours, shifted by a per-host offset of -30..+30 min
$hash   = 0; foreach ($ch in $env:COMPUTERNAME.ToCharArray()) { $hash = ($hash * 31 + [int]$ch) % 1000003 }
$offset = ($hash % 61) - 30
$arg    = "-NoProfile -ExecutionPolicy Bypass -File `"$dest`" -SenderPath `"$sender`" -ConfigPath `"$($conf.FullName)`""
if ($ZabbixServer) { $arg += " -ZabbixServer `"$ZabbixServer`"" }
if ($HostName)     { $arg += " -HostName `"$HostName`"" }
$triggers = foreach ($h in (0..23 | Where-Object { $_ % $IntervalHours -eq 0 })) {
    New-ScheduledTaskTrigger -Daily -At (Get-Date).Date.AddHours($h).AddMinutes($offset)
}
$action    = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument $arg
$principal = New-ScheduledTaskPrincipal -UserId 'SYSTEM' -LogonType ServiceAccount -RunLevel Highest
$settings  = New-ScheduledTaskSettingsSet -StartWhenAvailable -MultipleInstances IgnoreNew -ExecutionTimeLimit (New-TimeSpan -Hours 1)
Register-ScheduledTask -TaskName $TaskName -Action $action -Trigger $triggers -Principal $principal -Settings $settings -Force | Out-Null
Write-Output ("Scheduled task '{0}': every {1} h, offset {2} min" -f $TaskName, $IntervalHours, $offset)

# 4. Run the check now
if (-not $NoRun) {
    Write-Output "Running the check (the update search can take a few minutes) ..."
    $params = @{ SenderPath = $sender; ConfigPath = $conf.FullName }
    if ($ZabbixServer) { $params.ZabbixServer = $ZabbixServer }
    if ($HostName)     { $params.HostName = $HostName }
    & $dest @params
}
