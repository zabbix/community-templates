# Zabbix LLD: list of all IPv4 scopes on this DHCP server
# @() makes sure the output is always a JSON array, even with a single scope
ConvertTo-Json -InputObject @(Get-DhcpServerv4Scope) -Depth 2 -Compress