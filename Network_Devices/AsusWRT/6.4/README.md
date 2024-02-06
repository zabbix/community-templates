# Zabbix Template for Asus WRT Merlin Routers

<div align="right">
	
  [![LICENSE](https://img.shields.io/badge/License-GPL3-blue?logo=opensourceinitiative&logoColor=fff)](./LICENSE) 
  [![VERSION](https://img.shields.io/badge/Version-6410-blue?logo=republicofgamers&amp;color=0aa8d2)](https://github.com/diasdmhub/Asus_Merlin_Zabbix_Template/releases/tag/latest)
</div>

<BR>

### OVERVIEW
If you want to monitor your Asus SOHO router with a Zabbix agent, this template provides some useful monitoring items, triggers, graphs and more.
It targets Asus WRT routers with the Merlin firmware installed. \
The release comes with two templates, one for passive Zabbix Agent checks and one for active checks.

The main focus is on monitoring specific Asus WRT Merlin router items.

<BR>


### REQUIREMENTS

- Asus WRT Router with [Merlin firmware](https://www.asuswrt-merlin.net)
- Entware installed
- Zabbix agent installed
  - _You can try my [Zabbix Agent installation script](https://github.com/diasdmhub/Zabbix_agent_Asus_Merlin)_

<BR>


### SETUP

- Configure the Zabbix Agent configuration file:
  - Use `Server=` parameter with your Zabbix Server IP/Hostname
  - Add `AllowKey=system.run[*]` parameter *(necessary for custom checks)*
  - Add `AllowRoot=1` parameter *(necessary since no Zabbix user is created)* \
  [*Zabbix forum discussion*](https://www.zabbix.com/forum/zabbix-troubleshooting-and-problems/402023-zabbix-agent-system-run)

<BR>

---
### ➡️ [Download (latest)](https://github.com/diasdmhub/Asus_Merlin_Zabbix_Template/releases)
---
#### ➡️ [*How to import templates*](https://www.zabbix.com/documentation/current/en/manual/xml_export_import/templates#importing)
> _**For general Linux items, it is recommended to link your host to the official Linux template, which provides several items for monitoring, including CPU, memory, disk and bandwidth information.**_
---

<BR>


### TESTED VERSION
- This template has only been tested with Asus RT-AC86U / RT-AC87U / RT-AX86U routers running an Asus Merlin firmware. It should also work with other Asus routers.
- [*SNBForums original post*](https://www.snbforums.com/threads/asus-merlin-router-with-zabbix-agent.64343)
- [*WEB UI Memory discussion*](https://www.snbforums.com/threads/gui-memory-x-meminfo.68683/#post-645321)

<BR>


### ITEMS

| Name                             |
| -------------------------------- |
| AdGuard Home Status              |
| Conmon CSV                       |
| Conmon CSV: Conmon Jitter        |
| Conmon CSV: Conmon Line Quality  |
| Conmon CSV: Conmon Ping          |
| DNS Service IPv4                 |
| DNS Service IPv6                 |
| Device Model                     |
| Internet IPv4                    |
| Internet IPv6                    |
| Memory WebUI Free                |
| Memory WebUI Total               |
| Memory WebUI Used                |
| NTP Performance                  |
| NTPMerlin CSV                    |
| NTPMerlin CSV: NTPMerlin Drift   |
| NTPMerlin CSV: NTPMerlin Offset  |
| System NVRAM                     |
| System Model                     |
| System Firmware Version          |
| System Firmware New Version Info |
| System Firmware New Version Flag |
| Temperature CPU                  |
| Temperature Wireless 2.4GHz      |
| Temperature Wireless 5.0GHz      |
| Web Performance                  |

<BR>


### TRIGGERS

| Name                             |
| -------------------------------- |
| AdGuardHome Status Down          |
| CPU High temperature             |
| CPU High temperature ALERT       |
| Conmon abnormal Ping rise        |
| Conmon reports low line quality  |
| DNS Service IPv4 down            |
| DNS Service IPv6 down            |
| New Firmware Version Available   |
| NTP service is down              |
| Web service is down              |
| Wireless 2.4GHz high temperature |
| Wireless 5.0Hz high temperature  |

<BR>


### GRAPHS

| Name                 |
| -------------------- |
| Conmon Response Time |
| Memory WEBUI         |
| NTPMerlin            |
| Temperature          |
| WEB x NTP Perfomance |

<BR>

	
### WEB MONITORING

| Name            |
| --------------- |
| WEB UI Scenario |

<BR>
	
	
### DASHBOARD EXAMPLE
![Graph examples](https://github.com/diasdmhub/Asus_Merlin_Zabbix_Template/blob/main/images/dash_sample.png)
