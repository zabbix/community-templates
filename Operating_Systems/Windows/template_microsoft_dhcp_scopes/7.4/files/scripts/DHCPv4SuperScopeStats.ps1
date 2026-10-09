# Zabbix LLD: statistics of all IPv4 super scopes
# @() makes sure the output is always a JSON array, even with a single super scope
ConvertTo-Json -InputObject @(Get-DhcpServerv4SuperScopeStatistics) -Depth 2 -Compress