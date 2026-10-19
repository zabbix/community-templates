#Requires -Version 5.1
<#
.SYNOPSIS
    Checks pending Windows updates and sends the result to Zabbix with zabbix_sender.

.DESCRIPTION
    Uses the Windows Update Agent API (works with Windows Update, Microsoft Update and WSUS).
    Sends to the trapper items of template 'APP Winupdates check':
      zbx.winupdate.vbs.all / critical / security / definition / servicepacks / updaterollups
      zbx.winupdate.vbs.rebootrequired, zbx.winupdate.vbs.wsusavailability
      zbx.winupdate.vbs.datetime, zbx.winupdate.vbs.list (one pending update per line)

    Run it:
    - from the Zabbix agent (item "WU - Run update check", system.run), or
    - from Task Scheduler as SYSTEM, for example every 3 hours.

.PARAMETER SenderPath
    Path to zabbix_sender.exe

.PARAMETER ConfigPath
    Zabbix agent config. zabbix_sender takes Hostname and ServerActive from it.

.PARAMETER ZabbixServer
    Optional: Zabbix server / proxy address (instead of ServerActive from the config).

.PARAMETER HostName
    Optional: host name in Zabbix (instead of Hostname from the config).

.EXAMPLE
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File zbx-windows-updates.ps1

.NOTES
    Author : Dusan Priechodsky
    Source : https://github.com/DuprTECH/Zabbix-Patch-Management-Windows-Linux
    Contact: info@duprtech.sk
    License: MIT
#>
param(
    [string]$SenderPath   = "C:\Program Files\Zabbix Agent 2\zabbix_sender.exe",
    [string]$ConfigPath   = "C:\Program Files\Zabbix Agent 2\zabbix_agent2.conf",
    [string]$ZabbixServer = "",
    [string]$HostName     = ""
)

# Update classification IDs (language independent)
$Classifications = @{
    "e6cf1350-c01b-414d-a61f-263d14d133b4" = "critical"
    "0fa1201d-4330-4fa8-8ae9-b877473b6441" = "security"
    "e0789628-ce08-4437-be74-2495b842f43b" = "definition"
    "68c5b0a3-d1a6-4553-ae49-01d3a7827828" = "servicepacks"
    "28bc880e-0592-4cbf-8f95-c79b17911d5f" = "updaterollups"
}

function Send-ToZabbix {
    param([string[]]$SenderArgs)
    $base = @()
    if ($ConfigPath -and (Test-Path $ConfigPath)) { $base += @("-c", $ConfigPath) }
    if ($ZabbixServer) { $base += @("-z", $ZabbixServer) }
    if ($HostName)     { $base += @("-s", $HostName) }
    & $SenderPath @base @SenderArgs
}

$counts = @{ all = 0; critical = 0; security = 0; definition = 0; servicepacks = 0; updaterollups = 0 }
$list   = New-Object System.Collections.Generic.List[string]
$searchOk = 1

try {
    $session  = New-Object -ComObject Microsoft.Update.Session
    $searcher = $session.CreateUpdateSearcher()
    $result   = $searcher.Search("IsInstalled=0 and IsHidden=0 and Type='Software'")

    foreach ($u in $result.Updates) {
        $counts.all++
        $category = "other"
        foreach ($c in $u.Categories) {
            $id = "$($c.CategoryID)".ToLower()
            if ($Classifications.ContainsKey($id)) {
                $category = $Classifications[$id]
                $counts[$category]++
                break
            }
        }
        $kb = if ($u.KBArticleIDs.Count -gt 0) { "KB" + $u.KBArticleIDs.Item(0) } else { "-" }
        # Windows PowerShell 5.1 doesn't escape double quotes in native arguments, so replace them
        $list.Add((("[$category] $kb - $($u.Title)") -replace '"', "'"))
    }
} catch {
    Write-Output "Update search failed: $_"
    $searchOk = 0
}

$rebootRequired = 0
try {
    if ((New-Object -ComObject Microsoft.Update.SystemInfo).RebootRequired) { $rebootRequired = 1 }
} catch {}

$now = Get-Date -Format "yyyy-MM-ddTHH:mm:ss"

# Numbers and short values: one zabbix_sender call with an input file ("-" = host from config / -s)
$lines = @(
    "- zbx.winupdate.vbs.wsusavailability $searchOk",
    "- zbx.winupdate.vbs.rebootrequired $rebootRequired",
    "- zbx.winupdate.vbs.datetime `"$now`""
)
if ($searchOk) {
    foreach ($k in $counts.Keys) { $lines += "- zbx.winupdate.vbs.$k $($counts[$k])" }
}
$tmp = [System.IO.Path]::GetTempFileName()
try {
    [System.IO.File]::WriteAllLines($tmp, $lines, (New-Object System.Text.UTF8Encoding $false))
    Send-ToZabbix -SenderArgs @("-i", $tmp)
} finally {
    Remove-Item $tmp -ErrorAction SilentlyContinue
}

# The list of updates (multi-line text) is sent separately
if ($searchOk) {
    $text = if ($list.Count -gt 0) { $list -join "`n" } else { "No pending updates" }
    Send-ToZabbix -SenderArgs @("-k", "zbx.winupdate.vbs.list", "-o", $text)
}

Write-Output "Pending updates: $($counts.all) (critical $($counts.critical), security $($counts.security)), reboot required: $rebootRequired"
exit 0
