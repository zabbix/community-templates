# ============================================================================
# kerio_mailstats.ps1 - Kerio Connect Mailflow-Statistiken für Zabbix
# ============================================================================
# Parst die Kerio Connect mail.log und security.log und gibt
# Mailflow-Statistiken als JSON aus.
#
# Verwendung: powershell -ExecutionPolicy Bypass -File kerio_mailstats.ps1 [STORE_DIR]
# ============================================================================

param(
    [string]$StoreDir = "C:\Program Files\Kerio\MailServer\store"
)

$MailLog      = Join-Path $StoreDir "logs\mail.log"
$MailLogPrev  = "$MailLog.0"
$SecurityLog  = Join-Path $StoreDir "logs\security.log"
$SecLogPrev   = "$SecurityLog.0"
$QueueDir     = Join-Path $StoreDir "queue"

# Sicherheit: Pfad validieren
if ($StoreDir -match '[;|&`$]') {
    Write-Output '{"error":"invalid store path","in_5m":0,"out_5m":0,"in_1h":0,"out_1h":0,"in_today":0,"out_today":0,"deferred_1h":0,"bounced_1h":0,"rejected_1h":0,"deferred_today":0,"bounced_today":0,"rejected_today":0,"queue_count":0,"queue_oldest_sec":0}'
    exit
}
if (-not (Test-Path $StoreDir -PathType Container)) {
    Write-Output '{"error":"store dir not found","in_5m":0,"out_5m":0,"in_1h":0,"out_1h":0,"in_today":0,"out_today":0,"deferred_1h":0,"bounced_1h":0,"rejected_1h":0,"deferred_today":0,"bounced_today":0,"rejected_today":0,"queue_count":0,"queue_oldest_sec":0}'
    exit
}

$Now          = Get-Date
$Ts5m         = $Now.AddMinutes(-5)
$Ts1h         = $Now.AddHours(-1)
$TsToday      = $Now.Date

# Frühester relevanter Zeitpunkt (zwischen 00:00 und 01:00 liegt Ts1h vor Mitternacht)
$TsEarliest   = if ($Ts1h -lt $TsToday) { $Ts1h } else { $TsToday }

# Regex für Kerio-Timestamp: [DD/Mon/YYYY HH:MM:SS]
$TsRegex = '^\[(\d{2}/\w{3}/\d{4} \d{2}:\d{2}:\d{2})\]'

function Parse-KerioTimestamp {
    param([string]$ts)
    try {
        [datetime]::ParseExact($ts, "dd/MMM/yyyy HH:mm:ss",
            [System.Globalization.CultureInfo]::InvariantCulture)
    } catch {
        $null
    }
}

# Initialisierung
$Stats = @{
    in_5m = 0; out_5m = 0
    in_1h = 0; out_1h = 0
    in_today = 0; out_today = 0
    deferred_1h = 0; bounced_1h = 0
    rejected_1h = 0
    deferred_today = 0; bounced_today = 0
    rejected_today = 0
    queue_count = 0; queue_oldest_sec = 0
}

# ============================================================================
# Mail-Log parsen
# ============================================================================
$LogFiles = @()
if (Test-Path $MailLogPrev) { $LogFiles += $MailLogPrev }
if (Test-Path $MailLog) { $LogFiles += $MailLog }

foreach ($LogFile in $LogFiles) {
    $Reader = $null
    try {
        $Reader = [System.IO.StreamReader]::new($LogFile, [System.Text.Encoding]::UTF8)
        while ($null -ne ($Line = $Reader.ReadLine())) {
            if ($Line -notmatch $TsRegex) { continue }

            # FIX: $Matches[1] sofort sichern, bevor ein weiterer -match es überschreibt
            $TsString = $Matches[1]
            $Timestamp = Parse-KerioTimestamp $TsString
            if ($null -eq $Timestamp -or $Timestamp -lt $TsEarliest) { continue }

            # Recv = eingehend
            if ($Line -match '\] Recv:') {
                if ($Timestamp -ge $TsToday)  { $Stats.in_today++ }
                if ($Timestamp -ge $Ts1h)     { $Stats.in_1h++ }
                if ($Timestamp -ge $Ts5m)     { $Stats.in_5m++ }
            }

            # Sent + delivered to external host = outbound (exclude 127.0.0.1 = local delivery)
            if ($Line -match '\] Sent:' -and $Line -match 'Result: delivered' -and $Line -notmatch 'Remote-Host: 127\.0\.0\.1') {
                if ($Timestamp -ge $TsToday)  { $Stats.out_today++ }
                if ($Timestamp -ge $Ts1h)     { $Stats.out_1h++ }
                if ($Timestamp -ge $Ts5m)     { $Stats.out_5m++ }
            }

            # Sent + relayed = outbound (POP3 collector / smarthost setup)
            if ($Line -match '\] Sent:' -and $Line -match 'Result: relayed') {
                if ($Timestamp -ge $TsToday)  { $Stats.out_today++ }
                if ($Timestamp -ge $Ts1h)     { $Stats.out_1h++ }
                if ($Timestamp -ge $Ts5m)     { $Stats.out_5m++ }
            }

            # Sent + deferred
            if ($Line -match '\] Sent:' -and $Line -match 'Result: deferred') {
                if ($Timestamp -ge $TsToday)  { $Stats.deferred_today++ }
                if ($Timestamp -ge $Ts1h)     { $Stats.deferred_1h++ }
            }

            # Sent + failed = bounce
            if ($Line -match '\] Sent:' -and $Line -match 'Result: failed') {
                if ($Timestamp -ge $TsToday)  { $Stats.bounced_today++ }
                if ($Timestamp -ge $Ts1h)     { $Stats.bounced_1h++ }
            }
        }
    } catch {
        Write-Error "Fehler beim Lesen von ${LogFile}: $_" 2>$null
    } finally {
        if ($null -ne $Reader) { $Reader.Dispose() }
    }
}

# ============================================================================
# Security-Log: Rejected
# ============================================================================
$SecFiles = @()
if (Test-Path $SecLogPrev) { $SecFiles += $SecLogPrev }
if (Test-Path $SecurityLog) { $SecFiles += $SecurityLog }

# Regex für rejected-Keywords (getrennt vom Timestamp-Regex)
$RejectRegex = '(rejected|denied|spam score exceeded|blacklisted|blocked)'

foreach ($LogFile in $SecFiles) {
    $Reader = $null
    try {
        $Reader = [System.IO.StreamReader]::new($LogFile, [System.Text.Encoding]::UTF8)
        while ($null -ne ($Line = $Reader.ReadLine())) {
            if ($Line -notmatch $TsRegex) { continue }

            # FIX: Timestamp sofort sichern
            $TsString = $Matches[1]

            # Jetzt erst auf Reject-Keywords prüfen
            if ($Line -notmatch $RejectRegex) { continue }

            $Timestamp = Parse-KerioTimestamp $TsString
            if ($null -eq $Timestamp -or $Timestamp -lt $TsEarliest) { continue }

            if ($Timestamp -ge $TsToday)  { $Stats.rejected_today++ }
            if ($Timestamp -ge $Ts1h)     { $Stats.rejected_1h++ }
        }
    } catch {
        Write-Error "Fehler beim Lesen von ${LogFile}: $_" 2>$null
    } finally {
        if ($null -ne $Reader) { $Reader.Dispose() }
    }
}

# ============================================================================
# Mailqueue
# ============================================================================
if (Test-Path $QueueDir) {
    $QueueFiles = Get-ChildItem -Path $QueueDir -Filter '*.eml' -Recurse -ErrorAction SilentlyContinue
    $Stats.queue_count = ($QueueFiles | Measure-Object).Count

    if ($Stats.queue_count -gt 0) {
        $Oldest = $QueueFiles | Sort-Object LastWriteTime | Select-Object -First 1
        $Stats.queue_oldest_sec = [math]::Floor(($Now - $Oldest.LastWriteTime).TotalSeconds)
        if ($Stats.queue_oldest_sec -lt 0) { $Stats.queue_oldest_sec = 0 }
    }
}

# ============================================================================
# JSON-Ausgabe
# ============================================================================
$Stats | ConvertTo-Json -Compress
