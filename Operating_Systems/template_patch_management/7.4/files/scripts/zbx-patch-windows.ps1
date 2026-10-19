#Requires -Version 5.1
<#
.SYNOPSIS
    Checks pending Windows updates and sends the result to Zabbix with zabbix_sender,
    to the OS independent template 'APP Patch management all OS'.

.DESCRIPTION
    Uses the Windows Update Agent API. Sends the same keys (patch.*) as zbx-patch-linux.sh on Linux:
      patch.updates.all / security / critical / bugfix / enhancement / definition / servicepacks /
                    updaterollups / drivers / upgrades / kernel / held (hidden updates)
      patch.updates.severity.critical / important / moderate / low (MSRC severity)
      patch.updates.list, patch.history (recent update history, like a log)
      patch.reboot.required, patch.reboot.reason, patch.lastboot
      patch.lastupdate.timestamp, patch.lastupdate.patchday
      patch.os, patch.os.name, patch.os.version, patch.source, patch.source.available
      patch.service.startup, patch.autoupdate
      patch.check.timestamp, patch.check.duration, patch.check.result
    Values that don't exist on Windows (kernel) are sent as 0.

    Run it:
    - from Task Scheduler as SYSTEM, for example every 3 hours, or
    - from the Zabbix agent (item "Patch - Run update check", system.run).

.PARAMETER SenderPath
    Path to zabbix_sender.exe

.PARAMETER ConfigPath
    Zabbix agent config. zabbix_sender takes Hostname and ServerActive from it.

.PARAMETER ZabbixServer
    Optional: Zabbix server / proxy address (instead of ServerActive from the config).

.PARAMETER HostName
    Optional: host name in Zabbix (instead of Hostname from the config). When the config has no
    Hostname (for example HostnameItem=system.hostname), the computer name is used.

.PARAMETER HistoryLines
    Number of lines in the update history item (default 50).

.PARAMETER IncludeDefinitionHistory
    Include definition updates (Microsoft Defender) in the update history and in the last update
    date. They are installed several times a day, so they are left out by default.

.EXAMPLE
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File zbx-patch-windows.ps1

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
    [string]$HostName     = "",
    [int]$HistoryLines    = 50,
    [switch]$IncludeDefinitionHistory
)

$start = Get-Date

# Update classification IDs (language independent)
$Classifications = @{
    "e6cf1350-c01b-414d-a61f-263d14d133b4" = "critical"
    "0fa1201d-4330-4fa8-8ae9-b877473b6441" = "security"
    "e0789628-ce08-4437-be74-2495b842f43b" = "definition"
    "68c5b0a3-d1a6-4553-ae49-01d3a7827828" = "servicepacks"
    "28bc880e-0592-4cbf-8f95-c79b17911d5f" = "updaterollups"
    "cd5ffd1e-e932-4e3a-bf74-18bf0b1bbd83" = "bugfix"        # Updates
    "b54e7d24-7add-428f-8b75-90a396fa584f" = "enhancement"   # Feature Packs
    "ebfc1fc5-71a4-4f7b-9aca-3b9a503104a0" = "drivers"
    "3689bdc8-b205-4af4-8d4a-a63924c5e9d5" = "upgrades"      # feature updates (new Windows version)
}
$DefinitionId = "e0789628-ce08-4437-be74-2495b842f43b"

function Send-ToZabbix {
    param([string[]]$SenderArgs)
    $base = @()
    if ($ConfigPath -and (Test-Path $ConfigPath)) { $base += @("-c", $ConfigPath) }
    if ($ZabbixServer) { $base += @("-z", $ZabbixServer) }
    if ($HostName)     { $base += @("-s", $HostName) }
    & $SenderPath @base @SenderArgs
}

# Host name: zabbix_sender takes Hostname from the agent config, but it can't resolve
# HostnameItem (for example HostnameItem=system.hostname). Without Hostname in the config
# (or its Include files) send the name of system.hostname, that is the computer name.
if (-not $HostName -and $ConfigPath -and (Test-Path $ConfigPath)) {
    $confFiles = @($ConfigPath)
    foreach ($m in (Select-String -Path $ConfigPath -Pattern '^Include=(.+)$')) {
        $inc = $m.Matches[0].Groups[1].Value.Trim()
        if (Test-Path $inc -PathType Container) { $inc = Join-Path $inc '*' }
        $confFiles += @(Get-ChildItem $inc -File -ErrorAction SilentlyContinue | ForEach-Object { $_.FullName })
    }
    if (-not (Select-String -Path $confFiles -Pattern '^Hostname=' -Quiet)) { $HostName = $env:COMPUTERNAME }
}

function ConvertTo-Epoch([datetime]$Date) {
    ([DateTimeOffset]$Date.ToUniversalTime()).ToUnixTimeSeconds()
}

# Patch day, for example 2.Tue (2nd Tuesday of the month)
function Get-PatchDay([datetime]$Date) {
    "{0}.{1}" -f ([Math]::Floor(($Date.Day - 1) / 7) + 1), $Date.DayOfWeek.ToString().Substring(0, 3)
}

# Quoted value for the zabbix_sender input file
function Q([string]$Value) { '"' + ($Value -replace '\\', '\\' -replace '"', "'") + '"' }

# Windows PowerShell 5.1 doesn't escape double quotes in native arguments, so replace them
function Clean([string]$Value) { $Value -replace '"', "'" }

function Test-Definition($Entry) {
    try { foreach ($c in $Entry.Categories) { if ("$($c.CategoryID)".ToLower() -eq $DefinitionId) { return $true } } } catch {}
    return $false
}

$counts = [ordered]@{
    all = 0; security = 0; critical = 0; bugfix = 0; enhancement = 0; definition = 0; servicepacks = 0
    updaterollups = 0; drivers = 0; upgrades = 0; kernel = 0; held = 0
}
$severity = [ordered]@{ critical = 0; important = 0; moderate = 0; low = 0 }
$list     = New-Object System.Collections.Generic.List[string]
$history  = New-Object System.Collections.Generic.List[string]
$result   = "OK"
$searchOk = 1
$lastUpdate = $null

# ---------------- OS ----------------
$os = Get-CimInstance Win32_OperatingSystem
$cv = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -ErrorAction SilentlyContinue
$osVersion = "$($os.Version).$($cv.UBR)"
if ($cv.DisplayVersion) { $osVersion += " ($($cv.DisplayVersion))" }
$lastBoot = ConvertTo-Epoch $os.LastBootUpTime

# ---------------- Pending updates ----------------
try {
    $session  = New-Object -ComObject Microsoft.Update.Session
    $searcher = $session.CreateUpdateSearcher()
    $found    = $searcher.Search("IsInstalled=0 and IsHidden=0")

    foreach ($u in $found.Updates) {
        $counts.all++
        $category = "other"
        foreach ($c in $u.Categories) {
            $id = "$($c.CategoryID)".ToLower()
            if ($Classifications.ContainsKey($id)) { $category = $Classifications[$id]; break }
        }
        if ($category -eq "other" -and $u.Type -eq 2) { $category = "drivers" }
        if ($counts.Contains($category)) { $counts[$category]++ }

        $tag = "[$category]"
        $sev = "$($u.MsrcSeverity)"
        if ($sev -and $severity.Contains($sev.ToLower())) {
            $severity[$sev.ToLower()]++
            $tag += " [$sev]"
        }
        $kb = if ($u.KBArticleIDs.Count -gt 0) { "KB" + $u.KBArticleIDs.Item(0) } else { "-" }
        $list.Add((Clean "$tag $kb - $($u.Title)"))
    }

    # Hidden updates (the counterpart of held / version locked packages on Linux)
    try {
        $searcher.Online = $false
        $counts.held = $searcher.Search("IsInstalled=0 and IsHidden=1").Updates.Count
    } catch {}
} catch {
    $searchOk = 0
    $result   = "ERROR: update search failed: $($_.Exception.Message)"
}

# ---------------- Update history ----------------
try {
    if (-not $searcher) { $searcher = (New-Object -ComObject Microsoft.Update.Session).CreateUpdateSearcher() }
    $total = $searcher.GetTotalHistoryCount()
    if ($total -gt 0) {
        $ops     = @{ 1 = "Install"; 2 = "Uninstall"; 3 = "Other" }
        $results = @{ 0 = "Not started"; 1 = "In progress"; 2 = "Succeeded"; 3 = "Succeeded with errors"; 4 = "Failed"; 5 = "Aborted" }
        foreach ($e in $searcher.QueryHistory(0, [Math]::Min($total, 1000))) {
            if (-not $e.Title) { continue }
            if (-not $IncludeDefinitionHistory -and (Test-Definition $e)) { continue }
            $date = [DateTime]::SpecifyKind($e.Date, [DateTimeKind]::Utc).ToLocalTime()
            if (-not $lastUpdate -and $e.Operation -eq 1 -and $e.ResultCode -in 2, 3) { $lastUpdate = $date }
            if ($history.Count -lt $HistoryLines) {
                $history.Add((Clean ("{0:yyyy-MM-dd HH:mm}  {1}  {2}  {3}" -f $date, $ops[[int]$e.Operation], $results[[int]$e.ResultCode], $e.Title)))
            }
        }
    }
} catch {}

# Fallback (no Windows Update history, for example updates installed offline): installed hotfixes
if ($history.Count -eq 0) {
    try {
        $hotfixes = Get-HotFix | Where-Object { $_.InstalledOn } | Sort-Object InstalledOn -Descending
        foreach ($h in ($hotfixes | Select-Object -First $HistoryLines)) {
            $history.Add((Clean ("{0:yyyy-MM-dd}  Install  {1}  {2}" -f $h.InstalledOn, $h.HotFixID, $h.Description)))
        }
        if (-not $lastUpdate -and $hotfixes) { $lastUpdate = @($hotfixes)[0].InstalledOn }
    } catch {}
}

# ---------------- Reboot ----------------
$rebootRequired = 0
$reasons = @()
try {
    if ((New-Object -ComObject Microsoft.Update.SystemInfo).RebootRequired) { $reasons += "Windows Update" }
} catch {}
if (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired') {
    if ($reasons -notcontains "Windows Update") { $reasons += "Windows Update" }
}
if (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending') {
    $reasons += "Component Based Servicing"
}
if ($reasons.Count -gt 0) { $rebootRequired = 1 }
$rebootReason = if ($reasons.Count -gt 0) { "Pending: " + ($reasons -join ", ") } else { "-" }

# ---------------- Windows Update service and automatic updates ----------------
# Same values as service.info[wuauserv,startup]: 0 auto, 1 auto (delayed), 2 manual, 3 disabled, 4 unknown
$startup = 4
$svc = Get-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Services\wuauserv' -ErrorAction SilentlyContinue
switch ($svc.Start) {
    2 { $startup = if ($svc.DelayedAutostart -eq 1) { 1 } else { 0 } }
    3 { $startup = 2 }
    4 { $startup = 3 }
}
# 1 = updates are installed automatically (no policy = Windows default, or policy "Auto download and schedule the install")
$autoUpdate = 0
try {
    $level = (New-Object -ComObject Microsoft.Update.AutoUpdate).Settings.NotificationLevel
    if ($startup -ne 3 -and $level -in 0, 4) { $autoUpdate = 1 }
} catch {}

# ---------------- Send ----------------
$lines = @(
    "- patch.os Windows",
    "- patch.os.name $(Q $os.Caption.Trim())",
    "- patch.os.version $(Q $osVersion)",
    "- patch.source $(Q 'Windows Update')",
    "- patch.source.available $searchOk",
    "- patch.check.timestamp $(ConvertTo-Epoch (Get-Date))",
    "- patch.check.duration $([int]((Get-Date) - $start).TotalSeconds)",
    "- patch.check.result $(Q $result)",
    "- patch.reboot.required $rebootRequired",
    "- patch.lastboot $lastBoot",
    "- patch.service.startup $startup",
    "- patch.autoupdate $autoUpdate"
)
if ($lastUpdate) {
    $lines += "- patch.lastupdate.timestamp $(ConvertTo-Epoch $lastUpdate)"
    $lines += "- patch.lastupdate.patchday $(Get-PatchDay $lastUpdate)"
}
if ($searchOk) {
    foreach ($k in $counts.Keys)   { $lines += "- patch.updates.$k $($counts[$k])" }
    foreach ($k in $severity.Keys) { $lines += "- patch.updates.severity.$k $($severity[$k])" }
}
$tmp = [System.IO.Path]::GetTempFileName()
try {
    [System.IO.File]::WriteAllLines($tmp, [string[]]$lines, (New-Object System.Text.UTF8Encoding $false))
    Send-ToZabbix -SenderArgs @("-i", $tmp)
} finally {
    Remove-Item $tmp -ErrorAction SilentlyContinue
}

# Multi-line text values are sent separately
Send-ToZabbix -SenderArgs @("-k", "patch.reboot.reason", "-o", $rebootReason)
$text = if ($history.Count -gt 0) { $history -join "`n" } else { "No update history found" }
Send-ToZabbix -SenderArgs @("-k", "patch.history", "-o", $text)
if ($searchOk) {
    $text = if ($list.Count -gt 0) { $list -join "`n" } else { "No pending updates" }
    Send-ToZabbix -SenderArgs @("-k", "patch.updates.list", "-o", $text)
}

Write-Output "Pending updates: $($counts.all) (critical $($counts.critical), security $($counts.security)), reboot required: $rebootRequired, result: $result"
exit 0
