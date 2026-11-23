# patchbix-setup-windows.ps1 - Zabbix patch management on a Windows server without Ansible: setup, check, updates
#
# Paste the whole file into PowerShell as administrator, or run it as a file:
#   powershell.exe -NoProfile -ExecutionPolicy Bypass -File patchbix-setup-windows.ps1
# A menu asks what to do (or set $env:PATCHBIX_MODE = 'update' before):
#   1 monitor  = like ansible/check-windows.yml: checker patchbix-windows.ps1, scheduled tasks (check every
#                12 h and after a reboot, automatic update every 15 min), patch settings <Zabbix agent folder>\patchbix.conf,
#                UserParameter patch.config (host macros {$PATCH.CONF.*}), first check. Running it again updates an installed server and keeps the settings.
#   2 check    = run the update check now (pending updates -> Zabbix) and show the patch settings
#   3 update   = install updates now (security, critical, rollups, definitions,
#                updates) in the maintenance window, without EXCLUDE, reboot when needed and REBOOT="true", result to Zabbix
#   4 force    = like 3, also outside the maintenance window
#
# AUTO_UPDATE="false" in patchbix.conf (default) = the checker only checks; "true" = it installs the
# updates itself in the maintenance window (once per window, like 3).
#
# The checker patchbix-windows.ps1 is embedded (no internet needed); a copy in %TEMP% or C:\Temp wins.
# Requires the Zabbix agent 2 (zabbix_sender.exe). Docs: README.md (https://github.com/DuprTECH/PatchBix-Zabbix-Patch-Management-Windows-Linux)
#
# Author : Dusan Priechodsky
# Source : https://github.com/DuprTECH/PatchBix-Zabbix-Patch-Management-Windows-Linux
# Contact: info@duprtech.sk
# License: MIT
& {
$Mode          = "$env:PATCHBIX_MODE"     # monitor | check | update | force, empty = menu
$IntervalHours = 12
$TaskName      = 'PatchBix check'
$AutoTaskName  = 'PatchBix auto update'
#
function Ask([string]$Question, [string]$Default) {
    $a = Read-Host "$Question [$Default]"
    if ([string]::IsNullOrWhiteSpace($a)) { $Default } else { $a.Trim() }
}
#
$admin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $admin) { Write-Warning 'Run PowerShell as administrator.'; return }
$AgentDir = @('C:\Program Files\Zabbix Agent 2', 'C:\Program Files\Zabbix Agent') |
    Where-Object { Test-Path (Join-Path $_ 'zabbix_sender.exe') } | Select-Object -First 1
if (-not $AgentDir) { Write-Warning 'zabbix_sender.exe not found - install the Zabbix agent 2 first.'; return }
$ZSender   = Join-Path $AgentDir 'zabbix_sender.exe'
$AgentConf = (Get-ChildItem $AgentDir -Filter 'zabbix_agent*.conf' | Select-Object -First 1).FullName
$Check     = Join-Path $AgentDir 'scripts\patchbix-windows.ps1'
$PatchConf = Join-Path $AgentDir 'patchbix.conf'
#
# ---------------- Checker ----------------
# The checker is embedded before the menu (no internet needed); a newer copy in %TEMP% or C:\Temp is used instead
function Get-Check {
    New-Item -ItemType Directory -Force (Split-Path $Check) | Out-Null
    $tmp   = "$Check.new"
    $local = @("$env:TEMP\patchbix-windows.ps1", 'C:\Temp\patchbix-windows.ps1') | Where-Object { Test-Path $_ } | Select-Object -First 1
    $src   = if ($local) { $local } else { 'embedded' }
    try {
        if ($local) { Copy-Item $local $tmp -Force }
        else {
            # gzip + base64 -> original bytes
            $in  = New-Object IO.MemoryStream(, [Convert]::FromBase64String(($CheckB64 -replace '\s', '')))
            $gz  = New-Object IO.Compression.GZipStream($in, [IO.Compression.CompressionMode]::Decompress)
            $out = New-Object IO.MemoryStream
            $gz.CopyTo($out); $gz.Close()
            [IO.File]::WriteAllBytes($tmp, $out.ToArray())
        }
    } catch {}
    if (-not ((Test-Path $tmp) -and (Select-String -Path $tmp -Pattern 'AutoUpdate' -Quiet))) {
        Remove-Item $tmp -ErrorAction SilentlyContinue
        Write-Warning "The checker ($src) is damaged or old - copy patchbix-windows.ps1 to $env:TEMP and run again."
        return $false
    }
    Move-Item $tmp $Check -Force
    Write-Host "Checker: $Check ($src)"
    return $true
}
function Test-Checker { (Test-Path $Check) -and (Select-String -Path $Check -Pattern 'AutoUpdate' -Quiet) }
function Invoke-Check([string[]]$Extra) {
    $a = @('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', $Check, '-SenderPath', $ZSender, '-ConfigPath', $AgentConf, '-PatchConfig', $PatchConf) + $Extra
    & powershell.exe @a
}
function Get-PatchSettings {
    if (-not (Test-Checker)) { return $null }
    try { ((Invoke-Check '-ShowConfig') -join '') | ConvertFrom-Json } catch { $null }
}
function Show-PatchSettings($c) {
    $win  = if ($c.maintenance_window) { $c.maintenance_window } else { '- (any time)' }
    $open = if ($c.maintenance_active) { ' - open now' } else { '' }
    $next = if ($c.maintenance_next) { [DateTimeOffset]::FromUnixTimeSeconds([long]$c.maintenance_next).LocalDateTime.ToString('yyyy-MM-dd HH:mm') } else { '-' }
    $excl = if (@($c.exclude).Count -gt 0) { @($c.exclude) -join ', ' } else { '-' }
    Write-Host "Maintenance window: $win$open"
    if ($c.maintenance_error) { Write-Host "  ERROR: $($c.maintenance_error)" }
    Write-Host "Next window:        $next"
    Write-Host "Auto update:        $($c.auto_update)"
    Write-Host "Excluded:           $excl"
    Write-Host "Reboot allowed:     $($c.reboot_allowed)"
}
function Invoke-CheckNow {
    if (-not (Test-Checker)) { Write-Warning 'The checker is not installed (or old) - choose 1 (monitor) first.'; return }
    Write-Host '=== Patch settings'
    $c = Get-PatchSettings
    if ($c) { Show-PatchSettings $c }
    Write-Host '=== Update check (sends to Zabbix, the update search can take a few minutes)'
    Invoke-Check | Out-Host
}
#
# ---------------- 1. Monitor: checker, scheduled tasks, patch settings ----------------
function Install-Monitor {
    Write-Host '=== Update checker for Zabbix'
    if (-not (Get-Check)) { return $false }
    # A run of the checker moves the settings of an older version (zbx-patch.conf) to the PatchBix names
    Invoke-Check '-ShowConfig' | Out-Null
    $principal = New-ScheduledTaskPrincipal -UserId 'SYSTEM' -LogonType ServiceAccount -RunLevel Highest
    $arg = "-NoProfile -ExecutionPolicy Bypass -File `"$Check`" -SenderPath `"$ZSender`" -ConfigPath `"$AgentConf`""
    # Check every IntervalHours (shifted by a per-host offset of -30..+30 min) and 5 min after a reboot
    $hash = 0; foreach ($ch in $env:COMPUTERNAME.ToCharArray()) { $hash = ($hash * 31 + [int]$ch) % 1000003 }
    $offset   = ($hash % 61) - 30
    $times    = foreach ($h in (0..23 | Where-Object { $_ % $IntervalHours -eq 0 })) { (Get-Date).Date.AddHours($h).AddMinutes($offset) }
    $triggers = @($times | ForEach-Object { New-ScheduledTaskTrigger -Daily -At $_ })
    $boot = New-ScheduledTaskTrigger -AtStartup; $boot.Delay = 'PT5M'; $triggers += $boot
    Register-ScheduledTask -TaskName $TaskName -Force -Principal $principal -Trigger $triggers `
        -Action (New-ScheduledTaskAction -Execute 'powershell.exe' -Argument $arg) `
        -Settings (New-ScheduledTaskSettingsSet -StartWhenAvailable -MultipleInstances IgnoreNew -ExecutionTimeLimit (New-TimeSpan -Hours 1)) | Out-Null
    Write-Host ("Scheduled task '{0}': {1} and after a reboot" -f $TaskName, (($times | ForEach-Object { $_.ToString('HH:mm') }) -join ', '))
    # Automatic update every 15 min: installs only with AUTO_UPDATE="true", in the maintenance window, once per window
    $every15 = New-ScheduledTaskTrigger -Daily -At '00:00'
    $every15.Repetition = (New-ScheduledTaskTrigger -Once -At '00:00' -RepetitionInterval (New-TimeSpan -Minutes 15) -RepetitionDuration (New-TimeSpan -Hours 24)).Repetition
    Register-ScheduledTask -TaskName $AutoTaskName -Force -Principal $principal -Trigger $every15 `
        -Action (New-ScheduledTaskAction -Execute 'powershell.exe' -Argument "$arg -AutoUpdate") `
        -Settings (New-ScheduledTaskSettingsSet -StartWhenAvailable -MultipleInstances IgnoreNew -ExecutionTimeLimit (New-TimeSpan -Hours 4)) | Out-Null
    Write-Host "Scheduled task '$AutoTaskName': every 15 min (installs updates only with AUTO_UPDATE=`"true`")"
    Unregister-ScheduledTask -TaskName 'Zabbix patch check after reboot' -Confirm:$false -ErrorAction SilentlyContinue
    # Patch settings: only the values that are set are written, the others stay commented out
    # (nothing set = check only: no automatic updates, the defaults apply); the values already in
    # the file are kept, the file is written every time, so new comments / settings are added
    $unset = '(not set)'
    $cur = @{}
    if (Test-Path $PatchConf) {
        foreach ($l in Get-Content $PatchConf) { if ($l -match '^\s*([A-Z_]+)\s*=\s*"?([^"#]*)"?') { $cur[$Matches[1]] = $Matches[2].Trim() } }
    }
    $win  = if ($cur.ContainsKey('MAINTENANCE_WINDOW') -and $cur['MAINTENANCE_WINDOW']) { $cur['MAINTENANCE_WINDOW'] } else { $unset }
    $ex   = if ($cur.ContainsKey('EXCLUDE') -and $cur['EXCLUDE']) { $cur['EXCLUDE'] } else { $unset }
    $rb   = if ($cur.ContainsKey('REBOOT')) { $cur['REBOOT'] } else { $unset }
    $auto = if ($cur.ContainsKey('AUTO_UPDATE')) { $cur['AUTO_UPDATE'] } else { $unset }
    $keep = 'n'
    if (Test-Path $PatchConf) {
        Write-Host "Patch settings ${PatchConf}:"
        Write-Host "  MAINTENANCE_WINDOW: $win`n  AUTO_UPDATE:        $auto`n  EXCLUDE:            $ex`n  REBOOT:             $rb"
        $keep = Ask 'Keep them? (y/n)' 'y'
    }
    if ($keep -notmatch '^[Yy]') {
        Write-Host 'Enter = keep the shown value, - = not set (commented out). Automatic updates need a window and AUTO_UPDATE=true.'
        Write-Host "Maintenance window = when and which updates are installed automatically: '[<types>] <day> <HH:MM>-<HH:MM>',"
        Write-Host '  several separated by commas. Types: * = all (also without types), crit = critical (Critical Updates or'
        Write-Host '  MSRC severity Critical), sec = security, def = definitions; several joined with +. Day: 1-7 = Monday-Sunday'
        Write-Host '  (or Mon..Sun), 1-5 or Mon-Fri, Tue+Thu = Tuesday and Thursday, * = every day, 2.3 = 2nd Wednesday. Examples: * 3 03:00-05:00 = everything on Wednesday,'
        Write-Host '  crit+sec * 02:00-03:00 = critical and security updates every night, all Tue+Thu 03:00-05:00'
        $win  = Ask 'Maintenance window' $win
        $auto = Ask 'Automatic updates in the window (true/false, not set = false)' $auto
        $ex   = Ask 'Excluded updates, comma separated: KB number or a part of the title' $ex
        $rb   = Ask 'Reboot after updates when needed (true/false)' $rb
    }
    # KEY="value" when set, otherwise the commented example
    function Setting([string]$Key, [string]$Value, [string]$Example) {
        if ($Value -in $unset, '-', '') { "#$Key=`"$Example`"" } else { "$Key=`"$Value`"" }
    }
    @"
# patchbix.conf - patch management settings of this host
# Read by the checker patchbix-windows.ps1 (sent to Zabbix, template 'PatchBix - Patch management all OS')
# and by patchbix-setup-windows.ps1 (update). Written by patchbix-setup-windows.ps1 -
# you can edit it, the values are kept when the setup runs again.
# A setting that is commented out is not set: the default applies (nothing set = check only).
# The Zabbix host macros {`$PATCH.CONF.*} win over this file (patchbix-from-zbx-host-macro.cache).
#
# Maintenance window - when and which updates the checker installs itself (with AUTO_UPDATE="true").
#   "[<types>] <day> <HH:MM>-<HH:MM>", several separated by commas, local time of the host
#   types: * = all updates (also without types), crit = critical (classification Critical Updates or MSRC
#          severity Critical), sec = security, def = definitions; several joined with +, for example crit+sec
#   day: 1-7 = Monday-Sunday (or Mon..Sun), a range 1-5, * = every day, 2.3 = 2nd Wednesday of the month
#   an end lower than the start = the window ends the next day (6 22:00-04:00)
#   MAINTENANCE_WINDOW="* 3 03:00-05:00"                         = all updates every Wednesday 03:00-05:00
#   MAINTENANCE_WINDOW="crit+sec * 02:00-03:00, * 6 03:00-06:00"  = critical + security every night, all on Saturday
$(Setting 'MAINTENANCE_WINDOW' $win '* 3 03:00-05:00')
#
# Automatic updates: true = the checker installs the update types of the window itself in it (task "Zabbix
# patch auto update" every 15 min, once per window, log C:\ProgramData\patchbix\update.log); false = check
# only (default) - the windows can be set first and the automatic updates turned on later
$(Setting 'AUTO_UPDATE' $auto 'true')
#
# Updates that are not installed, separated by commas: KB number or a part of the title (default: none)
$(Setting 'EXCLUDE' $ex 'KB5034441, Preview')
#
# Reboot after updates when needed: true / false (false = the reboot is only reported to Zabbix; default: true)
$(Setting 'REBOOT' $rb 'false')
"@ | Set-Content -Path $PatchConf -Encoding ASCII
    Write-Host "Saved $PatchConf"
    # Settings from Zabbix: UserParameter patch.config (host macros {$PATCH.CONF.*} -> patchbix-from-zbx-host-macro.cache),
    # the agent is restarted only when its config changed (undone when it doesn't start)
    Write-Host '=== Zabbix agent: UserParameter patch.config (settings from the host macros)'
    Invoke-Check '-InstallAgentConfig' | Out-Host
    Invoke-CheckNow
    return $true
}
#
# ---------------- 3. / 4. Install updates now (the checker does it: -Update [-Force]) ----------------
function Install-UpdatesNow([bool]$Force) {
    if (-not (Test-Checker)) {
        Write-Host 'The update checker is not installed (or old) - installing it first.'
        if (-not (Install-Monitor)) { return }
    }
    Write-Host '=== Patch settings'
    $c = Get-PatchSettings
    if ($c) { Show-PatchSettings $c }
    if ($Force) { Invoke-Check '-Update', '-Force' | Out-Host } else { Invoke-Check '-Update' | Out-Host }
}
#
# Embedded check script: patchbix-windows.ps1 from DuprTECH/PatchBix-Zabbix-Patch-Management-Windows-Linux 5b6082b (embed-check.sh)
$CheckB64 = @'
H4sIAAAAAAACA6Q7a3fbNrLf9StwFN0VmYiMnn4ocU4c29l4Ez9qyZttHbcHIiGLNUWqJBVbif3f
78wAIEFKTttdtyeW8JgZzHsG8LML8ccySETKnH+LJA3iiA3cTu31s5o7+vn07Hx0PKox+DmYCe82
ZQsR+UF0wz4HkR/fpWy58HkGm3nksxTmUpbNBANwyzBjWcx+4ZNJcM/ugmzGvtHn33CZSFoEFVbg
+rMRA3gCgYsI9on5IgSwrHnOM2/2DgA4jD6yOY/4jZjjKh6GsLHp1mru4dHo4OL4fHx8dkpgL1Mh
CdFkXhKZbP8GN+6fH7tslBOb8rlgt2KVMmuBONznNuNwUvwM9DphEC3v3XTGgDWf8POQcDC5wlUc
cJGcl8ADb5kE2Qo+evA78DiOTpY3UzjESyaiGY88Sf9L5otpEMEiAIw7k6+BJxYc2fxSoSj/SFRJ
HIbLRYr7k+AryAw+LRc3CfcFfrwVSSQQ6UyEPrNmgQ881XKyN5KeCgADRLsGycF8EScZJzrnMQgM
+feShfEds05GFwdMb9oMMgzSrKXGZvA5TlbMSoSHB5drmBpusTC4FYwD6JsyrERM4jiDX6Sgfqs6
zNM40oMhTzMcLgHAQYnMzYK5SDM+X7TW52jA56vS3jht5Z/cCFTE+PpVGooeSYFti2xtNF4mnmBW
RQVfss+jyxF7jeIWyRu7vNzlX3kQ8kkoSsQo3XDhBAlQrffwZRYrZlptp2+vj7u+yADghgkvjqbB
TQmLhya+zik57C9BA4zjyVFp6ATl3zxcktXxjPlx1MyYuAcJo9VoFlhSN8G8EoHeIkM7a4MB4/6L
ZcSCTNqWw6ZJPGdjnt6yEWDyl6FIcPHo59H46KTFpnEC4IHIUDDUwxXrsRlwEIQWJyYINHDlgzgZ
vxWAd2F16U0cwqpYSCeqt1i6SmGJmywjG33L+f7F/snR+OiCXIZIYOeMMOAHdGAlt+aKe1HadEB8
zjeVaJEycMsQWMZvgY8f4jRDtSPPOiJl2fcysHd5riAr0ybhynWE6GyB0uLhUKOUCgf6t0ji+xXj
vg/CA5kEERyX+yyebkCD7JNUVniB5J0CeRVcMxhmRHYQacQmhvxUa9DZ5xm4qWKEzUDcUUzw812W
KXc9egzS2lNCm6kxMAUJar5YgsdUJEG4SoVfOYj0QuDYRUrITpfzCewAYkMcw4MgqLLTYqRFFjhw
joFu0K6w5zjywqUvDnMHr9AQBjVpun8dRq2TwEviNJ5mDPaSPthPUIB6oWbQl6lpQkAGzsYzsSJL
Q/5DdBK+9Nng3snGweWC0wN9pxgsl4YCMMfLjE1WTB3OJZAFXSPADlq5WBREm1LZPb34Zdz7afei
d/jJyXe5ygXsLxZgcYheOgEe3nEIvBqtSgo0NVGcVRONMpvJig8KTyatOhVZBjlKijJE9pBSalkN
88BOLlCzcBqHvpQ6fjPN05YMGOtMYRqEuDyZc3Jf1aTgZP/4dHx0un96cPTb5+PTw7PPe3UMqy8g
M2DPWbs7bLeddg/+bcHXLUYfnfYW/FvfGPTv0C5Q2HezAA6nmZ6BHjAZebSAQVezVIRTZjn74OhV
wMnAidrDjaDrV6+z1UKkb67Za1CFN+z1hw/Dk5M3jvqNzlBpTAqJCaYAPmoGmNWcp68YbR7CMUD+
mP7s4b8/yFxAVXgI6obZICoZ7QdTRf7A5jz7sDzQ6DSYwheyjgM9canAAD7MQTai0nlJvsvGU3gA
X+dmLVRt+F7YH4QNlTbtSWmCWMNVcfrfY3AF/mbxYGb74hWa0pB1nG2AcBJHzgjiClIZR64Ln1sw
NQCBt1jX7cGSLsjzs/DBv0gTVHjgS7oRiyRAIWPWeClejGdLAASfEAQpCIwk+EVpbPUHNRgTAFDc
wMslEgmAywEymhmB2b8cn/12eX64Pz7aq2fJUtQ1vKP/HHy6PITRj+8G7V6/3++02Hkivgbirr5Z
3pQNaFMu/JD18R2LlJ8F1QGTTDJte1mQhUInghdH787OxooM9qMfmRUyPkV3r9GT7eAJEecUdE8A
yxKBmS1JWKNZP/JTaLKNTFRORDERNDaPDIR0iLM19jd/7pTn83jEJpgvAbQgAVeGQsqWCSoEoMJC
KWlJJwe2ib9t7bFWRaZV1GKqypnzIMpEhOWI+1xndeKeQlOrks2rYV/651IaDgKN74rkfC3DtInc
BOM/UIdcUmoAOj1h1n6UBpDt2lK1ndEsvpP+vJJ65ePSzycBHgmALcoeHxzyv0Znp8zS+ixzmSi+
a4Ee3GeKqS1GJ0ql6cuTtEiuSqSSg0g5JLGZy05j8LdQ9oLPpTQRWZ8QY8t0XhZB+FgdswjdmM/c
VQuCoeGWtANs6VivSr1W2VUpaK9q2v+gL1W2Cc4OFRs1EtQmhoqaGYI2zVwuy3Rklc4YQsf7GOqQ
IflzhUhKnTw3YEoDX+QOg3wrqqNZ9JuJrlI2JXMorTW7S7aJ9JRMndK3SPK6zOEishEaoFYW8apK
8CneMUsWBZ0BmweRPfwTdvgxtj9UvIxxYgFORE4SFqvKJ2QzoE3uAnApqCIpS4KbGdgm5DPMglJ2
yA6GX86TGOry+SHP+BeddnxR5oHlbvloxHnC95mMQSuINhhTJFVxrJ+qDPtCoJyUThKOUUVuyv1S
LqkxQg1kOA5+A0ha0lKlp4Z0SG2DlZJTKf8qKDF96vgKtiPRur9DEQ/Z/3uKA1qFMGoopH7gYy15
K8SCyj7CopPNO10zkPe74+SJud5q8qR+GmNazCF3gQjkoSXVGdS0aNSmU8ITO6YCkxdL5pBrLcHR
fJVFLraHktiD+kkpr5/EC+omzTeVZYbn0vparkkvU6wrgVUCo5cqsKX7HLL6aynQNw+vDQ8F35RX
hk/SpN5IsyE8ilAzA55zTMbZ98b5/vjgg3twdvrelRnqY6s8aoTD6pRyM9VhabyPrkyTIVJZEYQm
MV9kKxssClkGgQiICnxKIimfBW+XofziIqpgvw1LQ+fb5N5Bqh2i2vU42Lf04MCBcgZvkSfTqgDZ
6YxHN8K3X5F3o8YeMJDFujIu7W6ptDrATAjrY7VbFqhSSq6MNyk7+wjl89HFxdkFNSBIb7DqzAsE
KU6YmwR+CnlxnTVZg71iD+yZ9LnoMxBFAoEJO3cqcZDSwlJsmLtonU+X/E4elmSmKb0c5n9mkY1O
tg78hyxmD0KOhggiWU9dgEtKjdj/weq7IPQ9nqhAbwCR4U/nAet9EUPFybGQTDYEaCMNoWaWLCgc
0040Uybcu71J4iVAk1kdV8KBM+o60dRsXckCP9LZJIZTgNFC3gAyMpzzWqFOdk+N4Q1mCnQvF1C1
+BBGoO6GCihOwCSftlfpgKhGLNWSuuaXdaZ0lTiLPkp3PG5Eho30fG2h13AC2Q6JdGeDjkx4MKAS
K0sIa7IUorbhq8JPqhGKeOhW0d0Rc++QXappQkyWFgvMB5zIsqP/7J+cfzqSFgQZX5LOBAR0cS+Y
cxqDp6czO0f3kM2gdz2Pw8BbsXerBZRyzHmPs7mJq9TWXaQdAH16Nj6SlwwQ3GfA+SE7XKbACDA7
4c1iP72VjZORbKkO2SzLFunw5csbCEXLCbB+/vJwuUjGRwcfXuorA6VTDn13TvJ7A0flXw4VevJu
I44yMEiMtNP4rQ+QMoFd11ua/QQMizCJPzke1569qWEhPLdo6gpUAtT6ulG0BmF0j9WL4Mfw5OkX
pfTyAqL7Za1nWG+VARZtw78FkGTfJV2sQjQ7hAixOq87elR7GPPg+WDS6JLJ+UFb74d8wJtdN55q
eVXQGC2bEhoNpsj0KxMyG6oMFtlgZYJyqcpYKQfayJ2NiNddRJXkwv/ZtVpDGuMe+6fInEPMU2vP
mL5aIxMtGjeyGb3pFgHM/Oef3ZMT9/Dwyo2umeVGGA6iPIKgH8xvr7DoZ44eDjKZo8nokPtMlScj
llpjRL81WXus2d1yOx23s91EclUqXGnDHB9CfRACtCVHLMWFnV1rHJSWpgDx7XcZQ8SWN+30Bm3H
a3cmTr/T9x2+1Zk63a2eD186vd6kjzGmrqsf2Qart6e80213fKff67Wd/pTvODtc7DqTne3t/nZv
stXvd2ifrp/UPtHe3tnd6u44nmjvOP1+b9uZiO2+0+3vDiY7/e6035vQvqKmUju3drzBpM17jt/h
W05/MOg5XPR3HSCix7d3uvD/jsJYXNWpvd2dibez0xZOe7DbdfreZOrsTHcHjre9O+ls73Y6/mBK
e0t3eGqzB5NTvyMcsduDzaLHnckUSO7sTKbtSWcy8Xd6tFneI+bNCS0omRbUJ4O+2Pa7fWeb+8C2
7g7QMNkeOLtwpt2tKR/s9CUNxi1kncC8Fzxbgrs/xxMpNk6mXmfqDZztDu8D+7cnzi73uNOb7PJB
u9dp93lbslFeQqqj9LZ2die+t+NMuu2B0+fTvrPj9zmIvLfb7XsDsesPFB/kjWVdH2WqaMhbhZG4
y7u/2ipqj7VG4WGOfTrNXxF4rTZdRpT2U37ijGPlQL+rnBB9uvIGV9faoe8nN+rKtDHh1Dx6a8nv
AeSdppN2MCmzxhCJHfpuzNk2+672v0AAdceDRN1cwB4LmKabXtv4DTeWVxhbtQe3iaOVrSluLVbI
bf9gZuR6S+vfFkcHboMz+KDvdIY/vqjKr3TM7nmLTZYZeiSPU74h0jj8KhRUfXvzN+51XKqNseGR
4w3MayOAbAEszPzzlAvjpV30KWgTuMMK6JYsO4N0/ebIrSF/HexhFmGSJP43VECqEVJJAZx0yVxC
88AHAaUOCHOO57JGAotVZ0R6ydbg0ghQGbHmr+q4e5b7wm40c4yENYiw/92YuycYakR61b52/wmp
9SK96ly7dHPrjpNgbtn5HjyxcRaEQB/HUIbIhAlyAamhEvq/4iAyFjefN5WSVc5N+oix8WAGxQaJ
X0J/LxPIJInpChItFUaiLFwhOkjWBNRRENePgEHO2eR3YAxi/819vwxDEsmjJL8wCRLZZiYWBBk8
1Dq112TOT8tAZNJ2c5kDD0X0dXhwdnJ+CdXDKRQRgO3RcC5AKphlNo6do0XszawrdGbYKLluYC6g
pWJd4bcxjJ9Np1BkyFl3HF9G5E15iHOWbcuhe/w2EkCzn1q2NEt510XXB6b1dN0xMMrCCwZ9N6BC
/xy4CGqWk4oyICCHfPUUnfXv7Uf3e+exzhxg5xWoz+x6OHwfxnFiWZJm2A2pR8eG0njbZi/gEzga
PXM2/SzELRxCMt+y3dFyIr2s1W6xnjrLT8sYK0Eqg/PSuuxsggjskWy5OMFPVp6/kQ6jsJr1Jt6Q
yAHmJGIRcqgZml++NFv0rzFWh6F6s45U4zYiRUecc6xxRljj4HuovGASqccXWD8tJ8DsP5BuquIj
To1mntwsMazKYlQjwr6QoSKh4NEGytdIVuRJug6rl8Wb7opbzHVdqE9Vpx2SMXFDT2yApWqMrldA
YPgZCIUKK+8SqRvkZ/kV8zJdQuK7gtqTeugaHmwpTkM+oiDOahwB0JXWH/gIJyu8moe8kkvcgxwa
nh7Ntd6AFXp8dXxo10FzPqEgLEhvxR+sFPtxVyLwIoQ1sGnMHuk/j+ziu3QCCFFiG9O1EujxnOab
I/1Q6zjKQMgBxCzgucynHgxmq5GP77rdre2tdhc+7XYGg11IlEkuT1+MP3FvbxXXYEoktLFFV2S8
ct9tDwGFlmYY0JOZxSJUafa6XF9LIhZJ7C/BPR4fvnFeY5qKCTs6tjcVwdHy/cWiIraCbQeEdL/A
iVIpmIjbwaKAjKc5/etV29ndd365/t7pPjpXX+7c6xcNxT2n8lO9wbdKzTp7bb0RmI3CMo+2foCl
biVXQ70ZwXmyjeE0QR4/MoF3hd+hPK1GE4RJ1iph/1lhrveX6t5SsEQ4zdIxmzWZEZ/RkwSV+gIv
sCdKC83+iT3UjSp1A6ayHNkgeslA1zKVA1FHZx5jf16+u1R48keWqCFppZ/KMA2Po6JlJF91rURW
zVgWPEA3DdH9rdXMaZUnalWPCEHCXPV009fc+oNVduvJ+9USHvN+cg382qRdTqPi0F+XHZ0bEqpX
rIGsemK+c13KrMzUCqDaMnmU6YoxBQApA5Fu9ARE58iECSkhdOV8KYsXhgdUqvcoTW2kNaT6Lu7J
y4Hnj628Sa+8jLqvKPVr7VcAnWOjnTr/2KCgO6iUWu7ldnvNtIMTUlGTYZZpl6bFKMO0/5IuUHVx
V7SH89cA+tnJelvaOhu12P43rD9V70M2DCGijg4OTvCak+61FBumkHHKy8kataBGaGRE9X97mjXV
Q5F9PPp5r05JUV29nGnStyb6fZksPaPHOAjsVXF9h+aKAqi2imm2iAAXgvtOTpdltuhmRcECR7qK
E/BEwr9++72aWxvKmte6Oih7SgELF4Ev6tBFUPof4+Vcxkro8lqWViIKHUS+pM+tK4gi3Pn22/UL
G77u4ZD7HIsdQOrpGsEoOlAlIWXXRQ+UOpBNLxaYToC1fjXnumX7hMk8fNWtq1/r18/tOuEpb+tc
G/gwZpQ3139twuYmbMYs80835yu+GlngM/d5A71UuZy6wsNd01qzclPBxsM+ia5wsM1aFnVJG+VC
bYs/WEhL5OqqThQSvqUET6N2P4oVZHd4LhwCoolkPU3fN+8mZGr7ht00rbY3SMFxKcxC7Fnb/8BG
cZKpkhFcLT6mYshS3BpEmUy5ZNe7IbdfNdff8TWv7Xqtoa7AxngVWd6hrkZLy5S8qNY3dzopugYg
ovlETStlCs78AR/GJsKcxDq3Ia989+XrG5XkFLTI+1gkpdBjK4of6DnSQ/shnk6V3bSLZKcDzHxG
DyxKV4RDo3FcPDU0Mlv5ckRXmevPK9SrxIDuscy3iYCNXieqmy7sWf/JS7TKwypbFTI/fio1Q0Tr
j7Z++ISq1uA5mWdRWdAGWRUOr0T6gHQ+dB7iCBgsoeiXQEznoqbWyTaSicyWotBSacv6b2wmefmz
OhhpMTIe4h62veQfEgzZ1QitZS3Gt9jVAU5U7tD1XTZgWoDrkY8bsF2CN6jyZQO+ekhX80kc0q0x
3u0bV8PIc4dtumLGlpxxz6EevWNukAT41MyLw+U8Ug/ltRoVd7i2dDmYoSdZqlqwhctIZcpZM7K9
DaYLxi51BD41rKoQyMWYQsmZ38Qr1yduzsEh20baCYhNxQCMxmuNAm1V0k3UF2xZyHlZY1RoaxIF
yjCcnOVBWjypJGoMusk81inUPgqoU+6ooMzwT8QQ018VgJ11oMrZAEzplAqQJSdlnHYTnXmqXbAB
w/KG2E6gCyevmpEp6AKk4XYeL7TGvADbRWNo4ILONRRM9KmLpisB5oE7j1t/CebBUzAftcqOlvM5
T1Y6aundRgQqLtv02wr0QEpMQ5a/k2098VAWXzrKJxspU08x7UqNf6QAFwkeVeit4vLz40Tz3qjm
KBQronSDBlbKPsyCan4JiDn0B1z1543F8/qmpkxNvs+VgyRwWZFcVsKH9v3VF+XFo7f/4qE4tmjM
P1f735+FozFKAyz+tIlqoPJrcfVYu9ydpb8EAAQuJFrIDxlHI/xrgjD4hoW5ZAbw9v+7u9bnJpIk
/91/RUejje7GUuMHzOzJ493hucMBA4MhiAvsA2EJUCBLCrWEh2P436/yVZX1aElmZu/DbcQOVnd1
PbKqsrLy8csp3DHI+2OKjlN1SstMAwWlfOPm92Q+OrcCPNx4nN3KTfASDQxYVmvZWDA53fVNCDj7
hsPDur2OzG0yKdRk++p+KW0IBR/AqOEbQ2n4h2gKfxlK6EpozEE10H+o6Jy3pFlXuB3hudmGpplv
gdYfXpkdvJq6grzjdhXrkcZIixdLLZuCI1DXag5/P5rBX7EcFnAIE/pqNISTcJ8CBEAvb77PwIvr
ZAU/zXocZAu01e/3bmU3MIzgwWIMYSKldfSqKILghvnvK3Bq9wIJmDOYZkjX300vSRs/YI5xIzCB
XQwYB2jdB+wmxC4MS3G6M5XXdoApsQ9da4lyZRMYGRRxW9boAv0FxFv7mLnEke0HztURdcX+GoHm
A1wXiiPbNXtLcocIN2TX2EIuSRBsAZ8YOsNaNDSBfwwx8dfHFfxj6A//nAxw/ZqJIt2cHd69wZdf
VxdlZxrtlanSf+73fjzr6IVOTjVTtdSBSZSdsenPnrmajg1PXWY/wl+7u5b5Qodfd8ZnxIKnelBj
MLwArz3K9vRFENUwqd1/6Xa/uoz46i5QZnUuU4ZBouxl27179gm/VILxP/vl6Qnc2nerf8pf5enw
63734FvVh7/Mv73oSadwldopvl4EDOKT7rV97G7ZyAXk8yTr1HfyI+7/ayO6TM74u29e/Z2hrzow
n3yEfU3TKs8P4flF/Pwmlj+Int/C8vHzH878xom65r90dTAt98Dudyi/D/zfF/T+1n/I7wP+bWt1
g7vmRSK1cQ3TPGuYONoF1xQxggs3YXMlr2+YsEDsMEu99SCy1U9R2wa7BRWa9OcSdBh7UWFsdo77
xiwfXA/80b589GMwx55cOFdL2ezmW2fVaV2eXu7yHZr74k8briRuhZogZqEXzrZtQlM93SDXG9aI
bX5PW7pSv4J54jun/qNveh+W5ppKy8t8jD9JZqa1ytz8nZnkT4nqeKWYw/z1vDlfNeaiNUNtx5k5
E4i0QOGjTDoI/x5l2E3TnjomzF64nv2wB7epCzOzcLId446wTw/cWZHc2t8Su8JxvDSroXeLGg8k
HDb/DVoDFt5SepGic1nkQfvCThPdIGYOIg/SS7N5iCtSDof+gdLb5xNllP1wYI8UVy0IDsdYR41m
+9vDoZl8c/UZB/t2UeMBTPMMX8FE81MYdji/nSF2i7YFSBDWIeCIDzS4zpo9uUcGNSz9o38o6uMK
CRBOQIc2CWtWLmtakGas5u/lzFbc+4BP6C0NAJ5KOSUWRqVBGA8Kx6fNZT21LkChmwQPPfCSMEIt
1jcli6QdB+2WRBuiGjDFWg5epAcubWjSzOMTU8CIodA93COg9h6l35u9UsXDGtGoSQlL/i92fexX
KUJMhXwN0xkfGGmmM0qy8UXtpD64MLYzG1OUNjrOSEOV8jPedZYRNCk2s6jXCwGlaC2oHNQJSj/5
uZuDimUX1wA+aGEclhQNbZCpaPnsMGgbeaPAPcSjEDG3ibgRb/dFi/F8KxNfYLyLTerXEBSDLV1b
xynV2UPmdBTM0tdqKrYidrMco2f6eHXSHplwSTC9oz4FvjF2y3fekyKdkUashPBHAdPyc1mgmUT+
z36bKMS+B4c3kmPNDhjQo331iC4d5pR0jxb06PBMC8CdT2Rm+BmLEEBE4BR6GV0FLunaDKpEvDlP
v9AhfqkvLLq0Mnux78Sg9z9Z3e3vnvbOrns3CSGoHDNf3ybCu6KTpmOOJzCWBLczEOnp5PK7ZB4l
mkw21ce688AKh8dWSi9riQgKtQR0wtu8c/k2z8ML/iCi8WCNFh6JDZMu2sfYYjfYZCah70VbGVrt
tpoMHVVnZmRQZCVqyG6wLSNNNK1T9qiljSOGTIMEmUYRmUYkA+NStDw9XoOj1jX4Zrff/dsVV6HE
DJpBj4JliCeKMnb+DTaIuuA5Oojm2qOBABKY8Y8S419E419sWiaLtctksXGZLP70MuFQSkOsxXYr
hNXvHmE4mNrQZeHTBfTQaHY/1kaT4to24Ze90BvEOxzsmbPGn6TQLcZGoW4yQsyPDjQHzb3ZtABH
pOEYPMv7YFUck7OJ9I8wU6gTXpsc20ZxqkhB8VZJOKuQdgztXORDMRkNPo+aGEBm9P69ua3U1BKK
CBMLJ9RprA0AlxA0qpST2AdnD/AsTx4lm9FS67YCxwvPRs/eRGXJftbK0SIshw3nb6c5+VeWdnmo
N971W5bw00fdzBzfFCzbt6PUS42clk5UD1r6m/XI89U1fn96PkOYwdsndx8+TDk5YQvs6BTuK1gF
8HHc0PvBeILdLTtv6vu/n48QuKp+Mmoas4jt/rqGeBPW+82aXR2mlQ729x2CIKSy4dCr/YPsI5io
o4DWLjfDAau0gcTB7nIwXjoCug0/wD1buGhLWDBhwCU8o5hLfPuAiuWGETw7uQuwPdMhTIJhCvDa
uT5yIffgrUTmqf8VPUVRqdY94UpdOFzhROQTkMx7z8iuTL7+uBgKP5a0yHq32YX6MbgZwsFMJpaT
5ReIDUE0Q1pkgacvrEje/3o9fkMXUTP6O0B4K7w21sT3aPSlLDSHQX1TKJNmXoTgEWI+iGk+AuND
aK5lkxH4nuOMGF9TPj1BQMVsr3cgPmcOvQLrMouN/M4ycCy+HLioqGrnmvXw9F3Y+qY3w3ED0IHD
brYPkJrOsHUAPyHoMTvkzxyOZje7CW934xemrVstTnE/8PPEV+YGD13vZn+nIcRFfOuAcwcpMWDJ
SvtIJFEfwJt61phDjol6nMmze/hACYfO5cLTc3B9ZPyHv0lPZeb6pmO7h57+QprKI/DRMqnPUXb7
orJ9jeQS7PgACEg3f9Uxv/OGzrZnt6wpVddBgyc1h+1tJ3ztuhJV0Zyfi0aEiAJwdpu69XfXrR8T
3TJVru2Xex91DFvtylO+5zqO0m8FFigjjIAYHyBEGqiIN7jqIxcEfcy6SLkqCv7CgapQulY30NjZ
vMqKKBq8sNRgtZ53SVOrjEq5e6hdu3mvDZAp05OpeLz9InDQMYflb5nvz1ClPvPxoDLf9yP1gQag
4h0ETZVX8s9BdxTrPdO5cErYHGqyD+BsN5JMqh/iqofjjFxh+PYfesQ4Bz3fMYb2ulIHXFj1qBLP
UyRArU+nDALIMqnAySaRg55D5PGkldIeOfYAQu9gJ6u4bqpl7vkzawbqiyPxZuWlqqAHffHTd5Tu
PR9cZn+IJu4BXDr+E6CA/AZikqljFps3IkdqrXOXcE7p78rBKwaiA++15cUcjpsTCgt9+LR+Rmpc
M4gX5hYAIgsEAbKux6eG+grKma9emZN3ZFY/QiaUULl1uIH4YhxYNyt/HV2KaydXgavr5YsHf7dC
MGmEKyVMeRHMPRewi5G+Y4j0Ne2xR3D2fjzFKC7X2+ejCxdKAMNeG3WpaERST4v2sRcDJQTIKV3E
G+HLI0KrJNSPVjjg6nq6vjXsOQi4Rvr3Xg0WUyBhnsDdxYCr9yAV9n2+HMC7eNCF+ZHcNvbVjfr9
PQwGWs/oqTQhdIAraOu58Hg0gFAn9KoqrtMH1yUo6IQRXARJAl/3Udw8J/kecWsRL8aFRWu4MkP/
qSD3dprP57xv744vkOJwxBg2e3jwRpoCaR0IkWMM7OOHj+5nhY5y+luRb4rbtUsvcmbGXUYB1eJG
5mhxPUcPaA7g5a9Md8C1dz90Fvx87ol7UwrYJfEFaYgOiH54lr5w6zees/3VaXRsZEFofxNhUuHK
PJBgARfeAhYYH7uC1y/aIlq01wJAIvLxZp/pd81ssjL8VSLKf6Iy/zi9zs7CULm7tx5k88nqA5jm
9Cr7iTeZfPsTFv5HTSiqEPFNewadef5s7Ptpc507a+NCdv8JMSLfEQjvKwwxMl3rQkkRetbHSGIw
4WAJ3qunTIl6eHq9LSrFVSsfvb3OMXEcTB8zE46+By4Sm9GvFqnPVDd/oQhzfzosi1O4rOhqhbMx
Fpoz4XdAh7Gae/PmVi5VHxKcWlRRccIwxSPabU4fxWiod6d+NcRX7jx0vdIajNrq6d4NPrnD/+5s
/oWPPrWYpIqeA2FEQKrhMNRe6RUY6qlIj8WWqGvwNfnzJtWa66xpoFyR7cc05N2Xu2ETh0B4jpbC
gPJO0Z6q27kKI3ITbG2vNPcglyCR8L+4lEy1Zj9CCDMRyU7uH9nT1bL3q6yHKwWums99MpQ6JQeH
dxCfuZytJogFSRZfq0PzkD8pAJY0cRyyAuqTBUo8zHsMR3o5jxArYCQqUHRlejWXXqmw3GC3YV1V
m2yFb81U0h+4DoV4m8+FcIqpZtL9+DQTH0xN9j63vtVsB17BctjQFRuJCQvae6qDG0IzCxyVkrZh
iEkcevBfPBrBLXjd0EMngZfTxeiDESBHi7VV3iWYzj57T2xH3XUUDgBlW0i8zNMWelOOELbWBIRq
faxWBqQ2S9vao0aAd4brjpvfZrUdtRLB20ftq4zasiqcFd6V0hvMcsK2/dVqoPqe+GXUvSu0hRQf
dvah3NtVx5ohv75+1v1e1MNY954pxXsWaN0DLMy3+dvO/h9vOwfm/4fm/zfFnFcJre+sOZE9MxFN
S5txyL7dziQUbvlEO1+93uX8HJngkT6Febm4wrxmv6n7bmRD4o82WI6SfLT92O1LvVsxzbYgaN/G
pgm1lS0sLVP831poaYCaaPHuU5X043HkgWgooLz2YoPVFrf1fdzaE919Zc/eV54zyKmVB44sNGob
mCmAl2pEU991nysk9UKo5rJv7f2OThpzN6vpspriqz78QmD7OpmMRnNQ1iCKU3ZoX9NxmW6nqkFj
tmrIbeP5agqXwSJYhN5I9HrTE0jDZKhYtoHaVvKEy+U7dLmUTdkVCdlGI7yLTp13W5021l6gzMl7
0aqzihvdzXimBcCc/AJb4GvdWrTDqXw4Dct6LF9hFiTXD2+cfpkNg9WmkUTLfO3wbhWa/Tkm489y
QsXVSqnR55GQCwgikOdCqB4f82N7gouyQIynsWIPmkdlYJnS0kUam8egd0Z/UQ6532TWYMOMxYKV
VR07iO8oz2nElFX/O/aBDvySb0hxIiUp3KOFlbs7l9LYv2GjxXFskQlLOhdXfMour8miUwEWcEYQ
a0GIbQP2dRzXlqqcvNJdP3xfPx+zQCjIT3f8RCtvxM6jqefbfOwXcFV4wzr7gN7aFpUq/wbCysPy
Ej6dHCK5+LohOth0KmnOpjfeUjlOgFz4xdFHR1HE4k2EK0pcfbicZzNjZfwfahLB3gGi4MUcMrHF
CnZtSQmuI0F6C42fEBumu/akBDepOfjhhkkuOggTFWlqAOxQJXFw4jtg7Pi3/Cjfhb3H7OAVYbv6
7UfFTgImSSppg0uSQbRiJtleuPFuAFDqYCpEmlDVcft5ASY1RO/p8WV4pzOZfRDcFZLJcSu72Yyt
zB5MBBvjFaOoLLsVeaiDljyMeaJxyoPXk9n0w5kv2tMQ4oG2KdarUIghRB5oADz7yxY2RGqZqKtb
aZIsPQNdUkJi5tGQWBz1pZQgGDaX2clomT6XjIWkKpLVXiwGU7718hdSTe/2HECvw37SUWweAUhl
mR8fH2df9/pfzP96T570hsPsl1/6FxffIhQJcQ1LeZN83f9WEO6mHVPXh4agETKLkAsKn9mKwadk
ha+K531DYVB/wJiTT6cjErUAmBCzvZRWK9DVCDDikhTq4gCPBfwIJoN5ZU7+1XL0u+lnwub5ERJE
mZ7VT6BMSVqcblb8azJ7N5ichvf2otqhZf/682w8PKOa61eD8dJ0uXyNaKnzwRRicMx1RaJcDiEo
TZb266jp2+8GKC4OsQ/WO/AMdgHgrXLmYzrj+mFqYXOuAic335ulemcAiWFIpodvSsg7Gea/AqIJ
tCNZ4z2/qOfYznPMctt4gdJJCzSyS0VZOFf4T5eFkfpa09AfTt/PqlqaoRy77MMMBnd/fCIaJjiD
Y8DFL48eP+mfnjx98OLV7ef3T23Dp1zZ6d3VAtRcjDsvj6mJU+CQ3Nyp360i5citMQHC3m4ex1/R
/dYJ5+7zkvF6z71q/TTfJtDnuZeySecuivJtpeJ7TiRHUyIXEwLX9rxUCbiNET7bsHVMAkX+05IM
SVLMeYmhTDMuNZQ5514IQB3mBPY6bvpiE+k12YXpyRiSbo+wKyS1NGT1pByUky81AyKZfhsqNmgN
9+GCP0BKL84uPmO2rBJv2ay4hs+DVi/LbT6nnFJrvUfoEB4iKBkww1OJWo/xNJCzUtmlqnqnwwOk
6Yocw9QxlJiIIkCsf6jrKjvPVxZzYK3/l6wEm9YZeL35uD6fzAzP8X+l3KOkgoYUEcmv6d3az8/B
5b2lbfSGX/cx+W2nv6Z3az/ntGLh579l+Jveep5b/098gYoeojL1AMMCPYJYbAGN0F/vHLS+J58s
0qqdFmAF2L8Z9A+mAp54nWRhxmNHa500ox2nNCUsnsFmlSx1jnHyGikTNeTs7m09fqD8sQ9iGe/0
Fge3lLh4wqJFyMxdZr60MAmsuJ8JPHsIKU/CT4geD53nLVA/np0PJvJVF8clu8HNqMd3sMxmVzA5
OGwuj57cfBKn0WNwg4Chcy7QbD4ZfDHH56crp8ZEkSpEe+UYMfBmb8k8yaqMI50NUZ8fwZGKOHlN
7KcmmFNfxQr+J/JwHsnN6Lg966O7mmFRD+XEwTHZ2DXvQqnLakVJ8FEKjS6lXS5OHj189uz+PQj6
TY2zZ2fFz0duU5Wm8lfaVQQB1JQeFgdaF6H6uGg+jc21bMiKcdaEKVcwCqhOaNSK1MYqYDcldWvo
5JtUr1sCSErOtludFyPgJaXtU0fbx51vGPeOxcnB2BmMlaZZ1WAqkWlHw7D1xSmHv3OAKQj4pbSM
vFz42BT+RyFK26R8Asa/TYonhCrcIsNPkQAAL7bJygQNbJOASQLK3eqVMHCWTuQnxVYDKlUHmAxd
BawPVUj+AnQFJ6PBAsN+ELaD90qRCgJrAJYTM3Zte9ejD1wNovY+tpXVd80VeDmiD6grgAVX059l
/rB5KGM+3kOe9bChQCz+CUqd4+KEY5UKI/rqvFRs1UcA1O37Tf/cnSm9sLNNrdA2hSOJ8EAU5Iz/
wlxcSUhW6SgGS7JyBckoEOt1sGxLRfEtgZQRbRjqyM8ltRvD+MqO6TlgO0D2pdhQhtTxQSUCtuZA
mwQWcSMYYgsUoiAh2pwYL+W8iRAR09BKlue4wRDoHzsbEA3Uy604hM0rsaqfNIvzE+42IO4CmaX3
hYYaIszJ7XsJkISscQ37uBV3+hNNA/hhS9NbMbz1TbfhxyCEUSt4zKd3ck6u6kd3bi8MgSejh/ca
vSrxNHh0BzFrg1JwaSj3qrYD0+ELkE3JW+sqfZYglkL9BDFqOlYFvgO5lELt5UrSjhy1jc2RYFXf
X00Gt89Bwccqr1VNP+FFGeLasJIRWBiA35jGqhaUKCrj0yoEOotg/tRHDvBPDzTLOlwz0rczrmyO
lW+tvmxwrNybXU4nM9RuUkwqsRy8R+q+VnLk5AHM3aTtlJCaGUp/OBGOT3YvgGdkqplXUrgMgnug
O20NyIlD9UPJsAW/rgW9wIL8bdDctqRP8FfA5GtWZoHAlQFiaNVPTrUJV+QW5mi6Vpu7InVf1Ddj
0LzCn3cx6NIcQgeQDksdDKbqXR5qMO9KCmPRo7XgGpbgCyfWgNsEGmEVNJU4f7Qg8+vMQavPZK0p
YT1QIIdgNKmIfCXXgtYSMp2OlqRfyyS+BX0XSi8GcSHabL4wDeTmNxm9XxLQA7oxAbzDYDEZY3ox
Z4OGWSPvOE8HX4VMMBDvFBPuDGf2OTMdxNBhRCz3GT2IzeYdvoYeewA8+YPbDx/DJYMxdsIZwRh4
t3w6pVtLvNG7mVOl0V/8IncxlNJ35PNdJh2osblBgvmyY/CKZUJ67bpf+In5OhN7O3F9TWRByC1u
fucNQ2/9LL1Oln9Ar7h4UtCmPVeofiQqUh+BSBZWxHPD8VOkFXXzREEhmrZuwQSo/nRd8/w9oEvR
MsN+Ou9LRVm15Vywj6+lUnk6MlT7wJJcYzVFNEUaEg8OTtQVuuyEy+kos1cfb8RtqZh44kvMgEdD
r44yu9TlOaugNIyIrfFPWZPXa2dB2ZpQ/3Uz1JlFnhvV92hsA/NZfA90ikAmi2GlpFEtNqrkwt27
pY5YaWYD/mmVs3tVipRkg1GoJ6iQ9BzzkCeU6BmwmpupHH/44OIV0JMlt9nHsCIV3tJ8XC2HRnRA
b+sbi+zGMjPyeHbjHHzUsWLXkqRETDl4K+9GTe/nwtfgBngAjjQrVFWeg7pm0rfNZzcGVULlxKkO
QmgHny8GVvfbQpFxYxklJci1eE24WN7meCtVJvrAM68AO3Uh2nHfq6SzUoKG2VWBelL7QqpyiFAn
6iSXySHOy0R+EIiQspzNtaeEWyEa+YrUxKF7J6u+cdFLsnEMMwGFcgf5TeMzL/yYNExGfhPFMP2y
+QDwFyXJpr9Vpmt64K6yUpFL5W2hg70c3fwdZbmmH5K7mn7ZFAHm748jTBEHevGOvWYHTNjr7Phi
PlssB9I9iGhfkDeH+TVB70I4KugMiBQozHTuWqsjSJpT0+p5DbdNwVHc6Ujyye/8nHkRpsF5+iiH
sYFq6CkcJvs76BrkvFDQ5alj01kANVI2gqcnsTGgM2taI22fzoEypj/Ua7NKPnNZOAmeLWbmvSH2
RiN+9uuLwI5fbDBxmV5xSQYxmTU1P6hquEh9rl/eeW7YDF0BP9f3xg3YMKQM3tNtFWD9R2iKuCBe
6JCad0h2jDytTMuP+fXLOVht0kk0+RgR2SCisztTrULx+zSKvBBGi83qxB1P+0jl6d1WikZzMOy0
KgHlbug5WhAXAUCS3d0drQVElR5MJUYrp3zfz1NaweDyOpScUC1awljrcdfTz/kIVKY+zjLj+hd+
8NoUOovjf0MVhFQASjIeIt8zVjUKTPDiIGwsZw6XxyoNJKPLiCMfSVYceP3aPj3b3QXnMQfbP4B8
p7kqkGtt9memYqji8/sA5WgIwlR1hp7RZ0f1CCvefvHaL3imFoXtKO5NLHiWpxC4t1WP5Y/u5Nuo
x/KeB+mIwA1AD+gLNNbzVFs7f40OzbLm3V3GjGSeJM+roFPmSgJqLxHP4QsRZ3f4bk671Nl7CXnC
dAyD/NCEjUfjDfEXzuAqgnhnmJy4gTQCmGKnSls9mFM8nTKNAgW/rFI+f6/EWvadvUJdX5Sk7qss
9Nm3513W8XhkDEIWSKnsRtzBFjP6Sz9z9Bo2rtAjeOQ404o7l1fj7lULF7fX1tlyMPEoDa4x8PAX
6i1SUuMi0xeRVrQDblWcIxFuyMf23p8foeItfzkd2weHKIEQT1NrlCagoTr2oMyvM44TR8gWrhby
Yn8AX3up+kS0eFL1SUqtZ17ehJekXzC/bsGv2+9mWHsSrx4dex1tfluNFl+YMJD3XhDin4ynTJhu
tr+3txezLzexI2YD7dp7V5bRAFwa819kCTkGoXKcd8jDfE21XrJwgnJvtSGwHGjdUcw4Ic3M+P2X
R0YCM7TBNANdVwAem0Ivl+cV8mcjHMPjxBFKo1PiJh0Ko5qFQ4inMIfbvn3epmP1JVb8N2Gm4I0n
LBbu2kxI9ORK4tnLN4pjlnnSfQccd8x/DuA/h+TCgz3p4p54TbiHamhnXbvQ7Us3PngrS6Sq1ua0
UBwN+c4Ds7cgDg2zDAZuzTwcP4tZpHMy/P09Hgt99ezjbGnuYebGmaIlZ31IMXv5jqX7X2bLB+Y6
l8iDWluW/nRKOEEuzWum35m13pyTTJzYqx8p5YxttiUswp/6SMzYPO9mnq1GU6aeZv2jHkkXftOg
H97DH9B7uGHjFaFam6Ak2hoyqnjV/+yGXAEMjkfM6AhscUMmJXZ0jVt4JgQ8KM0z8mSHlmPd+g6b
SvBXpAGN6gNXPPsUvhG5rKWGnK9E/QzkMltMtKrdLI+kstSAg80hMEzoRBah8iUdry+c23Qj39fj
6fvZ68vVADARPndZW3YGiK5QK6C5ItpGORyZyyKaNQ4Ai3Q1QEBXh/p6M1tNP01nl1MMW0KV23F2
c0cBWCWvyv918uL+E7kTg1y9mE1ORstTjkluTqVrmy7KjTk0KSnr5/P6hPNy4FI6QGnE9omEelPo
Ho0IPP85hhfYd6wr5xV56FdzwI9v+o8PMatfMpOxw8h1WRx1GlU3jeAVWzFyrk16rH3xTAMxmG5W
Dtr8/BLJjHsE4daeWrmpoJkWfN7a0KhUML/oTVfBcDDaRARqfCwO83PCpyj/9eypkcUJWcXc5PrZ
rzMXn9Y1fX06J4/KA0ASM0c3LjS242KNsNrsA2VcJtTgCRziGYL/ZecfZ7MGnEl+9GvAr6h2APta
gFnuYG//h92qNhuNnDcH3GMXbnM+GQOdhVg6szNMWdcW5BrHDV9EhrDjvES+YqLMXp28VJNMfZsb
WfGzi0yodzqXq2ezSbaNzglRQMZm48QRJF7Ey0bF0+Avb/L09suNrV42q8aZpLAP9ctm9Oolk1SL
WEiUWl6J71TwNPeNgTudibmTT1x8pIQw4tPtryoqorIWfIr6V1hQrDF5jBWqY6wzbngMx6hLM+Qc
rs6XpBUx98p9nfb7CeEf79HRJOwFBn9ode1Q+p6gnxZyHgi/tMym2FGmUyKo3nCW66UqtQwL8Gt4
++qPj/crr3oM/8bcUtSQ3ctSv3BpkiFbClmm7XeGt+u7EYhPbjuXimFU2uPnMK4i4CJco/MY0JUd
epXdXFOZ4kA+Q9DV3azAKTOa4QPVxq1QrvPbS/A13cCtqohvEbSsYYpvVsEIIH1HP93vjT11f/34
HUQGegluhhrAjx7Bh6P3A1BshNXnvA7dd50yWki5um3YxalogYZy+2TM2X+7osViREHer1XL5oBC
FGa/WoCCRZi/O7E30zTRP9Ob/a7cFhPt5n67bmuCiufnr/t63xaka2jZOgUpHvwJK77xBQ+7cwb6
Ie3qsZYGWekfgP3kmQcsYycYky/c9nUzbNqAgyGxhPMjOkHp4CjDo5PkEjRtwHcQ70iKGjT2BBNy
lAmgv7yjX0cZ4uUrKEoBt2dfa8Sxd28txLzkNwJ5EGu4vTg3ok8qrUGdnUR5GHygfyEzni4VGb1B
Whv9bkqgUeSaOqbEIZpH5wQ3pvRTPpPvy9cE44uB9s+NyIJRO3Ssnf40/Udtkb0F2xcM/9fYvE4h
PL4LcPNixpqgrpEbfx9frC7ucefFYUcaMKIuIQ1RS+QC4twQ6uw2RiSNoUGLJH54K+MkynECCxC8
KNikvzGLhP88JeqK+DpajGdDs4zNKEdNgxI3xZA0iu53n03Ad9tsM6E0WtItmRkpw1aBjMBeFu58
gc/NJr0wMp+3yMCMejEUvYSP2FTgq02iFWtCTEnHVxbnImnhiyTgE/pYmcU3NXKQ71tFyF7AAhZc
VjS0DEULPQdkDtaznz6jx4XosnlJsdX143gyRPeaXL4//RPr+fT6abiOr9tV/Gcwo4GHEAyX4PKe
Dnc7RaQE+srZQ9QX39rQiXaUtYn3hGdNfP/Bw9hzUGH8qgxAN0QgfWC+oL62IN7XC59GoIz5aI7A
yWhhpdr56p05XuzPFQdHeNwogTzWwVA3mzGd+8sPy9dQCbR8BkOoLRsJtLDJiolDRMgaZRrs0gO+
TFBGwC8dCibtArPwEdZKvpBZrJhDaVPiUoJu2K24KNoACl3fIy3eYnAZRnaqkeIMbg8tSgqpgcuD
nnOvT5vrffP/vBQ06d0qJ3d+coh26ZxTWmldo1VcsK+QWUmnr66XZjdUhXUmbq0yzDwJ64LRIa1D
INgg4QUsiiVEi0K+MkOLw1sR8c4n1hES1lPbWQT9+nlTEU6JtuvxOoxAi8XzOzadTjKJrGbiefLA
KUEmAE5c9ZOpmPCwg+OvU64JGEQqwdgnjXWH7dA4o7OWnweHcgVeaF3xw22WsiQcCf4JvrT8HqYW
L9yezy/8mbtMJK2e21ejipEhHWFIEIjFgBJ/ce+IGmsjLHG9BWOrIkBdK5yrLZw6nTad+jm5XwcW
G0ZBXXvubar5LzrmWo47/1h5E5wnG7CULefxpR3LgRJST14EUWjeMRivGlglJS+TYAW1iWt5S5zu
usoFF0XdImpV3n4Lgj7mHbuRMaLbh4UoDcu75xcA1QvbPEislhkJH7UsvLD5C5lFELNNpW98Eai5
i6Wonfo+1VBBIB10YDiaT2ZfGq2a8HS7/c2Z0kTu5d6g3Br13CqIBPORM2AtBaKlKyAqH8GdlQdI
SXGMiOvflPB3WsJl4m0l45pKrITbjJ1f4BFm5vMEKRZKuFTo+4dtN3NMDrswPPTU1Gx6gJ5R1K2T
JydvzDL+OAMdeHEFmLNQrpGOrC627AcpXb+cPhnAOTE6NY2uBhNOIuj1ccPS+TO9Bi66GIVJqIGa
jAT6VYrATR2p3FHvVe7d/zaU7FPqbC9NHJZl65AT+p+Z83kZ1P7kma27pbzFCJdey1lBqfDIMZLe
uaSoVaRAds5p5xf2wjQdeRcmJbqrFZ7jTqP9RA297XvpVPgalQeHDy4LdkFbXbi9/lVnC4T9LoHg
4SXBe7vV6qIVcnLv0aa1lFg+aaFdEsvbvqSM6vdGgyE6WYWXKftibUIeXyoTrYwnlCUmRDFrNyst
LBqlJxmCBDDaIUnhORl88yxw8yvZTf93kZ2QKEMZ2zoJT1+YEKlBKELZ5VoOtc2rr42hp448XZur
2hwTj0bzJTppeNkSdTpEZYBkHKsLygJsSRYmWHNZbsVEYxV47TimuDwi1MYg+ZuNjoFQmfUo2oGC
sBuoP4OUc7aHO51mtiIEFU93mTtVpeYqvvKzaLH/A2kT7g4B/pbFn5o1opBmdCr1psb8VAhCZX7c
HZBHICcbTBQXv0n+QlzGw5JkS3alKTUDl44KE4WwSvq7ShepB58NtWFROvfHsCTGb3gwY2uizNIf
D/keZL5FvU1wDSWAUbqHMpxRS0UW8Os3G00WFgxCnUIfk7A4XG3oRifu+RGl2JlDDIViMQzL6QSG
/tJuL+mlM3TLXwZ1DR0cN/kSrMEaLfUWgrCsClgHv0T4veXO1bOKfkdG0StlE/33ZhL18VM5m6h6
6GcU/XdlE612EqhF35tJ1FUCcphF9Q3ix+LKoRDP9rr9rSvLt6gLHwwHX0xVsM/xUn0Pfnr1cEeF
7Ug3nf/eJ/S1ZQdwgOWuzOskkcSXw3zSKW3kwqczK5aGldpoA6p2baW2LNXuwg5U/Ws+t/FS1j0f
hn4FIELnRfl/B0C4bSLSEGfwihiDeBg/sbigGcZMh+ijDh10Z323PoG7X3AIgDcgZpKd5d3Mcyys
dihE+zjpEmw9FK2PfiJMO7dh2taVH6OWYFVs3VX+0nUSo6fTe8Pr8dVCyqGvcz98LN8C39Hrqixp
aCTsr5lKH4wxiFXru51ZI9ZjaeMl3Qt5VHWd85t7K4/M23hTVRFSQT88+rts8+yL7JDvoLj/ohVF
zhwOyHNTN4cqb0WTy4GyPjWeRGdzP7v6KWa7aynQT5xF4SEU1mIpxYdwPziFuzoHXN8TAGyXOVEC
X7UQdMPPG2SL5Igld6UYY44t/l+GVnGEwtQAAA==
'@
#
# ---------------- Menu ----------------
if (-not $Mode) {
    Write-Host "Zabbix patch management - $env:COMPUTERNAME"
    Write-Host '  1) monitor - install / update the checker for Zabbix (scheduled tasks, patchbix.conf incl. AUTO_UPDATE)'
    Write-Host '  2) check   - run the update check now'
    Write-Host '  3) update  - install updates (only in the maintenance window)'
    Write-Host '  4) force   - install updates now (also outside the maintenance window)'
    $Mode = Ask 'Choose' '1'
}
switch -Regex ($Mode) {
    '^(1|monitor)$' { [void](Install-Monitor) }
    '^(2|check)$'   { Invoke-CheckNow }
    '^(3|update)$'  { Install-UpdatesNow $false }
    '^(4|force)$'   { Install-UpdatesNow $true }
    default         { Write-Warning "Unknown choice: $Mode" }
}
}
