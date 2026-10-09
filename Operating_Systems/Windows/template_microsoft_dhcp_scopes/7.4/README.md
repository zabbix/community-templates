# Zabbix template – Microsoft DHCP Server (Windows Server 2012 / 2016 / 2019 / 2022)

Zabbix 7.4 template for monitoring **Microsoft DHCP Server** on Windows Server. All **IPv4 scopes and super scopes are discovered automatically**, with free / used addresses, usage in %, and **DHCP failover** partner statistics.

## ✨ Highlights

- 🔍 **Automatic scope discovery**: every IPv4 scope gets its own items, trigger and graph, named `Super scope -> Scope [network]`
- 🔁 **DHCP failover support**: addresses free / in use on this server and on the partner server
- 🗂️ **Super scopes**: available / used addresses, % in use and number of scopes per super scope
- 🚨 **Scope running out of addresses**: trigger with a configurable threshold
- ⚡ **Light on the server**: one PowerShell call per scope, all values are taken from it (dependent items)

## Contents

| File | Description |
|------|-------------|
| `template_microsoft_dhcp_scopes.yaml` | Zabbix **7.4** export with the template `APP Discovery DHCP scopes` |
| `files/scripts/DHCPv4ScopesLLD.ps1` | List of scopes (discovery) |
| `files/scripts/DHCPv4ScopeStats.ps1` | Statistics of one scope, with failover data |
| `files/scripts/DHCPv4SuperScopeStats.ps1` | Statistics of super scopes (discovery) |
| `files/zabbix_agentd.conf.d/DHCPv4Scope.conf` | UserParameters for the Zabbix agent |
| [`../5.2/template_microsoft_dhcp_scopes.xml`](../5.2/template_microsoft_dhcp_scopes.xml) | Original templates `APP Discovery DHCP scopes` and `Micrososft DHCP` for **Zabbix 5.2** (no longer maintained) |

### `APP Discovery DHCP scopes` (link to the DHCP server host)

**Items**
- DHCP Server service state (`DHCPServer`)

**Discovery rules**

| Rule | Source | Items per entry |
|------|--------|-----------------|
| **DHCP Scopes** (every 1 h) | `Get-DhcpServerv4Scope` | Free, In use, Reserved, Pending, % in use, All IP, Addresses free / in use on this server and on the partner server (failover) |
| **DHCP Super Scopes** (every 30 min) | `Get-DhcpServerv4SuperScopeStatistics` | Available IP, Used IP, % used IP, All IP, number of scopes |

Each scope and super scope also gets its own graph.

**Triggers**

| Trigger | Severity |
|---------|----------|
| DHCP Server service is not running | High |
| DHCP Scope … is running out of free addresses (> `{$DHCP_SCOPE_USAGE_WARN}` %) | Warning |
| DHCP Scope … Not used IP pool (*disabled by default*) | Info |

## Requirements

- Zabbix server / proxy **7.4** or newer (for Zabbix 5.2 use the template in [`../5.2/`](../5.2/))
- Windows Server 2012 or newer with the DHCP Server role and the `DhcpServer` PowerShell module (installed with the role)
- Zabbix agent or Zabbix agent 2 in **active** mode, running as Local System (or an account that can read DHCP statistics)

## Installation

1. **Copy the files** to the Zabbix agent folder on the DHCP server:
   - `scripts\*.ps1` → `C:\Program Files\Zabbix Agent\scripts\`
   - `zabbix_agentd.conf.d\DHCPv4Scope.conf` → `C:\Program Files\Zabbix Agent\zabbix_agentd.conf.d\`

   If your agent is installed elsewhere (for example `C:\Program Files\Zabbix Agent 2`), edit the paths in `DHCPv4Scope.conf`.
2. **Load the UserParameters**: make sure `zabbix_agentd.conf` (or `zabbix_agent2.conf`) contains
   ```
   Include=C:\Program Files\Zabbix Agent\zabbix_agentd.conf.d\*.conf
   ```
   and restart the Zabbix agent service.
3. **Test it** on the server:
   ```powershell
   & "C:\Program Files\Zabbix Agent\zabbix_agentd.exe" -c "C:\Program Files\Zabbix Agent\zabbix_agentd.conf" -t DHCPv4LLD
   ```
4. **Import the template**: *Data collection → Templates → Import* → `template_microsoft_dhcp_scopes.yaml`
5. **Link** `APP Discovery DHCP scopes` to the DHCP server host. For CPU, memory, disks and services also link the official template **Windows by Zabbix agent active**.

> The PowerShell items have their own **30 s timeout** in the template, so you don't need to change `Timeout` in the agent config (the Zabbix 5.2 version needed that). With an agent older than 7.0, set `Timeout=30` in the agent config instead.

## Macros

| Macro | Default | Description |
|-------|---------|-------------|
| `{$DHCP_SCOPE_USAGE_WARN}` | `97` | Scope usage threshold (%) |

## Notes

- Super scope values are taken from the discovery data, so they refresh with every discovery run (30 min), not more often.
- *Addresses free / in use on partner server* are `0` on servers without DHCP failover.
- The service item key is `service.info["DHCPServer",state]` (with quotes), so it doesn't clash with the service discovery in *Windows by Zabbix agent active*.
- Discovery works with any number of scopes, including a server with only one scope or one super scope.
- **Upgrading from the Zabbix 5.2 version**: the template name and item keys are the same, so importing the new file updates the existing template and keeps your history. The old template `Micrososft DHCP` (CPU, memory, disks, service) is no longer needed: unlink it and use *Windows by Zabbix agent active* instead. The DHCP service state is now part of `APP Discovery DHCP scopes`. Also replace the scripts and `DHCPv4Scope.conf` with the new ones.

## Custom work & support

Need something extra? I can extend or customize this template for your company's needs, for example DHCPv6, lease statistics, dashboards or integration with your environment. Feel free to get in touch: 📧 [info@duprtech.sk](mailto:info@duprtech.sk)

If this work makes sense to you, give the repo a ⭐ star or support me on Ko-fi ☕

I'm adding more tools and templates over time, so feel free to [follow me on GitHub](https://github.com/DuprTECH) to see what's new.

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/duprtech)

## More scripts, improvements and frequent updates

This folder holds a snapshot of the template. **More scripts, improvements and frequent updates are on my GitHub:**

- 🆕 newer versions and frequent updates
- 🐞 bug fixes
- 🧩 extra scripts and improvements for the template

👉 **Repository:** https://github.com/DuprTECH/Zabbix-Microsoft-DHCP-Server-2012-2016-2019  
👤 **My GitHub:** https://github.com/DuprTECH
