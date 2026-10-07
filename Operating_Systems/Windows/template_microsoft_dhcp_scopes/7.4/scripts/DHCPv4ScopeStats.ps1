# Zabbix: statistics of one IPv4 scope (JSON)
param (
    [Parameter(Mandatory=$true)]
    [string]$ScopeId
)

# -Failover adds the partner server statistics; fall back to plain statistics if it fails
$stats = Get-DhcpServerv4ScopeStatistics -ScopeId $ScopeId -Failover -ErrorAction SilentlyContinue
if (-not $stats) {
    $stats = Get-DhcpServerv4ScopeStatistics -ScopeId $ScopeId
}
$stats | ConvertTo-Json -Depth 1 -Compress