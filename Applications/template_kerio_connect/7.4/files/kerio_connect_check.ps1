# ============================================================================
# kerio_connect_check.ps1 - Kerio Connect API Monitoring für Zabbix
# ============================================================================
# SECURITY-HARDENED VERSION
#
# Credentials werden aus einer geschützten Datei gelesen.
#
# Verwendung: powershell -ExecutionPolicy Bypass -File kerio_connect_check.ps1 <HOST> [PORT] [CREDENTIALS_FILE]
#
# Credentials-Datei Format (NTFS-Berechtigung: nur Zabbix-Dienstkonto):
#   KERIO_USER=Admin
#   KERIO_PASS=GeheimesPasswort
# ============================================================================

param(
    [Parameter(Mandatory=$true)][string]$KerioHost,
    [string]$Port = "4040",
    [string]$CredFile = "C:\ProgramData\Zabbix\kerio_credentials.conf"
)

$ErrorResult = '{"error":"","users_total":0,"domains_total":0,"active_connections":0,"messages_in_queue":0,"version":"unknown","uptime_seconds":0,"license_days_left":-1,"license_users":0,"license_type":"unknown","storage_percent":0,"smtp_auth_failures":0,"spam_rejected":0,"imap_connections":0,"pop3_connections":0,"web_connections":0,"smtp_connections":0}'

# ============================================================================
# Input-Validierung
# ============================================================================
if ($KerioHost -match '[^a-zA-Z0-9.\-:]') {
    Write-Output ($ErrorResult -replace '"error":""', '"error":"invalid hostname"')
    exit
}
if ($Port -match '[^0-9]') {
    Write-Output ($ErrorResult -replace '"error":""', '"error":"invalid port"')
    exit
}

# ============================================================================
# Credentials laden
# ============================================================================
if (-not (Test-Path $CredFile)) {
    Write-Output ($ErrorResult -replace '"error":""', '"error":"credentials file not found"')
    exit
}

# ACL prüfen: Datei darf nicht für Everyone/Users lesbar sein
$Acl = Get-Acl $CredFile -ErrorAction SilentlyContinue
$UnsafeRules = $Acl.Access | Where-Object {
    $_.IdentityReference -match '(Everyone|Users|Authenticated Users|Benutzer|Jeder)' -and
    $_.FileSystemRights -match 'Read' -and
    $_.AccessControlType -eq 'Allow'
}
if ($UnsafeRules) {
    Write-Output ($ErrorResult -replace '"error":""', '"error":"credentials file has unsafe permissions"')
    exit
}

$User = ""
$Pass = ""
foreach ($Line in (Get-Content $CredFile)) {
    if ($Line -match '^\s*KERIO_USER\s*=\s*(.+)$') { $User = $Matches[1].Trim() }
    if ($Line -match '^\s*KERIO_PASS\s*=\s*(.+)$') { $Pass = $Matches[1].Trim() }
}

if ([string]::IsNullOrEmpty($User) -or [string]::IsNullOrEmpty($Pass)) {
    Write-Output ($ErrorResult -replace '"error":""', '"error":"credentials incomplete"')
    exit
}

if ($User -match '[^a-zA-Z0-9._@\-]') {
    Write-Output ($ErrorResult -replace '"error":""', '"error":"invalid username"')
    exit
}

# ============================================================================
# SSL-Konfiguration
# ============================================================================
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Für selbstsignierte Zertifikate: SSL-Validierung deaktivieren.
# Bessere Alternative: Kerio-Zertifikat in den Windows-Zertifikatspeicher
# importieren (certlm.msc → Vertrauenswürdige Stammzertifizierungsstellen).
# Dann kann dieser Block entfernt werden.
if (-not ([System.Management.Automation.PSTypeName]'TrustAllCertsPolicy').Type) {
    Add-Type @"
        using System.Net;
        using System.Security.Cryptography.X509Certificates;
        public class TrustAllCertsPolicy : ICertificatePolicy {
            public bool CheckValidationResult(
                ServicePoint srvPoint, X509Certificate certificate,
                WebRequest request, int certificateProblem) {
                return true;
            }
        }
"@
}
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy

$BaseUrl = "https://${KerioHost}:${Port}/admin/api/jsonrpc/"

# ============================================================================
# API-Hilfsfunktion
# ============================================================================
function Invoke-KerioApi {
    param(
        [string]$Method, [hashtable]$Params = @{}, [int]$Id = 1,
        [string]$Token = "",
        [Microsoft.PowerShell.Commands.WebRequestSession]$Session
    )
    $Body = @{ jsonrpc = "2.0"; id = $Id; method = $Method; params = $Params } | ConvertTo-Json -Depth 10
    $Headers = @{ "Content-Type" = "application/json" }
    if ($Token) { $Headers["X-Token"] = $Token }

    try {
        $SplatParams = @{ Uri = $BaseUrl; Method = 'Post'; Body = $Body; Headers = $Headers; TimeoutSec = 30 }
        if ($Session) { $SplatParams['WebSession'] = $Session }
        else { $SplatParams['SessionVariable'] = 'script:WebSession' }
        Invoke-RestMethod @SplatParams
    } catch { $null }
}

# ============================================================================
# API-Aufrufe
# ============================================================================

# Login (Passwort nur im POST-Body, nie als CLI-Argument)
$LoginParams = @{
    userName = $User; password = $Pass
    application = @{ name = "Zabbix Monitoring"; vendor = "Zabbix"; version = "1.0" }
}
$LoginResult = Invoke-KerioApi -Method "Session.login" -Params $LoginParams -Id 1
if (-not $LoginResult -or -not $LoginResult.result.token) {
    Write-Output ($ErrorResult -replace '"error":""', '"error":"login failed"')
    exit
}
$Token = $LoginResult.result.token
$Session = $script:WebSession

# Server Info (Kerio 10.x: Server.getProductInfo)
$ServerInfo = Invoke-KerioApi -Method "Server.getProductInfo" -Id 2 -Token $Token -Session $Session
$Version = if ($ServerInfo.result.info.version) { $ServerInfo.result.info.version }
           elseif ($ServerInfo.result.version) { $ServerInfo.result.version }
           else { "unknown" }

# Statistics (enthält Uptime, Queue, Storage, Connections)
$Stats = Invoke-KerioApi -Method "Statistics.get" -Id 3 -Token $Token -Session $Session
$UptimeSec = 0
if ($Stats.result.uptime) {
    $u = $Stats.result.uptime
    $UptimeSec = ([int]($u.days) * 86400) + ([int]($u.hours) * 3600) + ([int]($u.minutes) * 60)
}

# Queue aus Statistics
$QueueCount = 0
if ($Stats.result.storedInQueue -and $Stats.result.storedInQueue.count) {
    $QueueCount = [int]$Stats.result.storedInQueue.count
}

# Storage
$StoragePercent = 0
if ($Stats.result.storage -and $Stats.result.storage.percentage) {
    $StoragePercent = [int]$Stats.result.storage.percentage
}

# Connections aus Statistics (kumulativ seit Serverstart)
$ImapConns = 0; $Pop3Conns = 0; $WebConns = 0; $SmtpConns = 0
if ($Stats.result.imapServer) { $ImapConns = [int]$Stats.result.imapServer.totalIncomingConnections }
if ($Stats.result.pop3Server) { $Pop3Conns = [int]$Stats.result.pop3Server.totalIncomingConnections }
if ($Stats.result.webServer)  { $WebConns  = [int]$Stats.result.webServer.totalIncomingConnections }
if ($Stats.result.smtpServer) { $SmtpConns = [int]$Stats.result.smtpServer.totalIncomingConnections }
$TotalConns = $ImapConns + $Pop3Conns + $WebConns + $SmtpConns

# SMTP Auth Failures + Spam
$SmtpAuthFail = 0; $SpamRejected = 0
if ($Stats.result.smtpServer.authenticationFailures) { $SmtpAuthFail = [int]$Stats.result.smtpServer.authenticationFailures }
if ($Stats.result.spam -and $Stats.result.spam.rejected) { $SpamRejected = [int]$Stats.result.spam.rejected }

# Domains
$Domains = Invoke-KerioApi -Method "Domains.get" -Params @{ query = @{ fields = @("id","name"); start = 0; limit = 100 } } -Id 4 -Token $Token -Session $Session
$DomainsTotal = if ($Domains.result.totalItems) { $Domains.result.totalItems } else { 0 }

# Users: pro Domain abfragen und summieren (Kerio 10.x braucht domainId)
$UsersTotal = 0
if ($Domains.result.list) {
    foreach ($Dom in $Domains.result.list) {
        $DomUsers = Invoke-KerioApi -Method "Users.get" -Params @{
            query = @{ fields = @("id"); start = 0; limit = 1 }
            domainId = $Dom.id
        } -Id 5 -Token $Token -Session $Session
        if ($DomUsers.result.totalItems) {
            $UsersTotal += [int]$DomUsers.result.totalItems
        }
    }
}

# License
$LicDays = -1; $LicUsers = 0; $LicType = "unknown"
$LicInfo = Invoke-KerioApi -Method "Server.getLicenseInfo" -Id 8 -Token $Token -Session $Session
if ($LicInfo.result) {
    if ($LicInfo.result.expirationDate) {
        try {
            $Exp = [datetime]::Parse($LicInfo.result.expirationDate)
            $LicDays = [math]::Floor(($Exp - (Get-Date)).TotalDays)
        } catch {}
    }
    if ($LicInfo.result.users) { $LicUsers = [int]$LicInfo.result.users }
    if ($LicInfo.result.type) { $LicType = $LicInfo.result.type }
}

# Logout
Invoke-KerioApi -Method "Session.logout" -Id 99 -Token $Token -Session $Session | Out-Null

# ============================================================================
# Ausgabe
# ============================================================================
@{
    users_total        = [int]$UsersTotal
    domains_total      = [int]$DomainsTotal
    total_connections   = [int]$TotalConns
    messages_in_queue  = [int]$QueueCount
    version            = $Version
    uptime_seconds     = [int]$UptimeSec
    license_days_left  = [int]$LicDays
    license_users      = [int]$LicUsers
    license_type       = $LicType
    storage_percent    = [int]$StoragePercent
    smtp_auth_failures = [int]$SmtpAuthFail
    spam_rejected      = [int]$SpamRejected
    imap_connections   = [int]$ImapConns
    pop3_connections   = [int]$Pop3Conns
    web_connections    = [int]$WebConns
    smtp_connections   = [int]$SmtpConns
} | ConvertTo-Json -Compress
