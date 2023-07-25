# Unifi Network

## Description

This template is meant for monitoring Unifi network devices using Unifi Network API. Special thanks who wrote and maintain this [wiki page](https://ubntwiki.com/products/software/unifi-controller/api), this guide helped me for realizing this template. Upstream repository at [MassimilianoPasquini97/zbx_unifi_network](https://github.com/MassimilianoPasquini97/zbx_unifi_network).

## How to use

First of all you need to import the template file ***zbx_template_unifi_network.yaml*** in Zabbix. 😅

Said that, this template use Unifi Network API so it need a view only local user on Unifi Network Web Interface.

Once you create view only user, on Zabbix create a new host and link ***Unifi Network*** template, those macros need to be configured:

- ***{$UNIFI.IP}***: IP or FQDN of Unifi Network Web Interface.
- ***{$UNIFI.USERNAME}***: Username of View Only user.
- ***{$UNIFI.PASSWORD}***: Password of View Only user.

If you prefer you can modify other macros for further personalize trigger parameters.

If you done all right now it auto discover all Unifi Dream Machine, Unifi Switch and Unifi Access Point and create an host object for all of them.

## Templates

| Name          | Description                  |
| ------------- | ---------------------------- |
| Unifi Network | Unifi Network Template       |
| Unifi UDM     | Unifi Dream Machine Template |
| Unifi USW     | Unifi Switch Template        |
| Unifi UAP     | Unifi Access Point Template  |

## Unifi Network: Macros

| Name                                    | Description                                           | Default | Required | Type      |
| --------------------------------------- | ----------------------------------------------------- | ------- | -------- | --------- |
| {$UNIFI.AP.DISCONNECTED.SEC}            | AP Disconnected Trigger Avg threshold in seconds      | `900`   | `true`   | `numeric` |
| {$UNIFI.AP.PENDING.SEC}                 | AP Pending Trigger Avg threshold in seconds           | `1800`  | `true`   | `numeric` |
| {$UNIFI.CPU.USAGE.HIGH}                 | Cpu % High Trigger threshold                          | `90`    | `true`   | `numeric` |
| {$UNIFI.CPU.USAGE.HIGH.SEC}             | Cpu High Trigger Avg threshold in seconds             | `900`   | `true`   | `numeric` |
| {$UNIFI.CPU.USAGE.WARNING}              | Cpu % Warning Trigger threshold                       | `80`    | `true`   | `numeric` |
| {$UNIFI.CPU.USAGE.WARNING.SEC}          | Cpu Warning Trigger Avg threshold in seconds          | `900`   | `true`   | `numeric` |
| {$UNIFI.IP}                             | Unifi Ip                                              | `-`     | `true`   | `text`    |
| {$UNIFI.ISP.LATENCY.HIGH}               | ISP ms High Trigger threshold                         | `30`    | `true`   | `numeric` |
| {$UNIFI.ISP.LATENCY.HIGH.SEC}           | ISP  High Trigger Avg threshold in seconds            | `900`   | `true`   | `numeric` |
| {$UNIFI.ISP.LATENCY.WARNING}            | ISP ms Warning Trigger threshold                      | `15`    | `true`   | `numeric` |
| {$UNIFI.ISP.LATENCY.WARNING.SEC}        | ISP  Warning Trigger Avg threshold in seconds         | `900`   | `true`   | `numeric` |
| {$UNIFI.ISP.SPEED.DOWNLOAD}             | ISP Max Download Speed in Mbps                        | `1000`  | `true`   | `numeric` |
| {$UNIFI.ISP.SPEED.DOWNLOAD.HIGH}        | ISP Download % High Trigger threshold                 | `95`    | `true`   | `numeric` |
| {$UNIFI.ISP.SPEED.DOWNLOAD.HIGH.SEC}    | ISP Download Avg High Trigger threshold in seconds    | `900`   | `true`   | `numeric` |
| {$UNIFI.ISP.SPEED.DOWNLOAD.WARNING}     | ISP Download % Warning Trigger threshold              | `85`    | `true`   | `numeric` |
| {$UNIFI.ISP.SPEED.DOWNLOAD.WARNING.SEC} | ISP Download Avg Warning Trigger threshold in seconds | `900`   | `true`   | `numeric` |
| {$UNIFI.ISP.SPEED.UPLOAD}               | ISP Max Upload Speed in Mbps                          | `250`   | `true`   | `numeric` |
| {$UNIFI.ISP.SPEED.UPLOAD.HIGH}          | ISP Upload % High Trigger threshold                   | `85`    | `true`   | `numeric` |
| {$UNIFI.ISP.SPEED.UPLOAD.HIGH.SEC}      | ISP Upload Avg High Trigger threshold in seconds      | `900`   | `true`   | `numeric` |
| {$UNIFI.ISP.SPEED.UPLOAD.WARNING}       | ISP Upload % Warning Trigger threshold                | `95`    | `true`   | `numeric` |
| {$UNIFI.ISP.SPEED.UPLOAD.WARNING.SEC}   | ISP Upload Avg Warning Trigger threshold in seconds   | `900`   | `true`   | `numeric` |
| {$UNIFI.MEMORY.USAGE.HIGH}              | Memory % High Trigger threshold                       | `90`    | `true`   | `numeric` |
| {$UNIFI.MEMORY.USAGE.HIGH.SEC}          | Memory High Trigger Avg threshold in seconds          | `900`   | `true`   | `numeric` |
| {$UNIFI.MEMORY.USAGE.WARNING}           | Memory % Warning Trigger threshold                    | `80`    | `true`   | `numeric` |
| {$UNIFI.MEMORY.USAGE.WARNING.SEC}       | Memory Warning Trigger Avg threshold in seconds       | `900`   | `true`   | `numeric` |
| {$UNIFI.PASSWORD}                       | Unifi View Only Password                              | `-`     | `true`   | `numeric` |
| {$UNIFI.SW.DISCONNECTED.SEC}            | SW Disconnected Trigger Avg threshold in seconds      | `900`   | `true`   | `numeric` |
| {$UNIFI.SW.PENDING.SEC}                 | SW Pending Trigger Avg threshold in seconds           | `1800`  | `true`   | `numeric` |
| {$UNIFI.USERNAME}                       | Unifi View Only Username                              | `-`     | `true`   | `numeric` |

## Unifi Network: Discovery rules

| Name                                | Description                              | Type             | Key and additional info         |
| ----------------------------------- | ---------------------------------------- | ---------------- | ------------------------------- |
| *API stat/sta*: Client Wired        | Discover all wired client devices        | `Dependent item` | unifi.client.wired.discovery    |
| *API stat/sta*: Client Wireless     | Discover all wireless client devices     | `Dependent item` | unifi.client.wireless.discovery |
| *API stat/device-basic*: Device UAP | Discover all Unifi Access Point devices  | `Dependent item` | unifi.device.uap.discovery      |
| *API stat/device-basic*: Device UDM | Discover all Unifi Dream Machine devices | `Dependent item` | unifi.device.udm.discovery      |
| *API stat/device-basic*: Device USW | Discover all Unifi Switch devices        | `Dependent item` | unifi.device.usw.discovery      |

## Unifi Network: Items prototype

| Name                                                       | Description                   | Type             | Key and additional info                          |
| ---------------------------------------------------------- | ----------------------------- | ---------------- | ------------------------------------------------ |
| *API stat/sta*: {#NAME} DNS Record                         | Client dns record             | `Dependent item` | unifi.client.wired.dns.record[{#MAC}]            |
| *API stat/sta*: {#NAME} DNS Record Enabled                 | Client dns record enabled     | `Dependent item` | unifi.client.wired.dns.record.enabled[{#MAC}]    |
| *API stat/sta*: {#NAME} First Seen                         | Client first seen date        | `Dependent item` | unifi.client.wired.seen.first[{#MAC}]            |
| *API stat/sta*: {#NAME} Guest                              | Client is guest               | `Dependent item` | unifi.client.wired.guest[{#MAC}]                 |
| *API stat/sta*: {#NAME} Hostname                           | Client hostname               | `Dependent item` | unifi.client.wired.hostname[{#MAC}]              |
| *API stat/sta*: {#NAME} IP                                 | Client IP                     | `Dependent item` | unifi.client.wired.ip[{#MAC}]                    |
| *API stat/sta*: {#NAME} IP Fixed                           | Client IP is fixed            | `Dependent item` | unifi.client.wired.ip.fixed[{#MAC}]              |
| *API stat/sta*: {#NAME} Last Seen                          | Client last seen date         | `Dependent item` | unifi.client.wired.seen.last[{#MAC}]             |
| *API stat/sta*: {#NAME} Macaddress                         | Client Macaddress             | `Dependent item` | unifi.client.wired.mac[{#MAC}]                   |
| *API stat/sta*: {#NAME} Network                            | Client Network                | `Dependent item` | unifi.client.wired.network[{#MAC}]               |
| *API stat/sta*: {#NAME} Uptime                             | Client uptime                 | `Dependent item` | unifi.client.wired.uptime[{#MAC}]                |
| *API stat/sta*: {#NAME} Vlan                               | Client vlan id                | `Dependent item` | unifi.client.wired.vlan[{#MAC}]                  |
| *API stat/sta*: {#NAME} Wired Switch Depth                 | Client switch depth           | `Dependent item` | unifi.client.wired.sw.depth[{#MAC}]              |
| *API stat/sta*: {#NAME} Wired Switch Port                  | Client switch port            | `Dependent item` | unifi.client.wired.sw.port[{#MAC}]               |
| *API stat/sta*: {#NAME} Wired Switch Port Macaddress       | Client switch macaddress port | `Dependent item` | unifi.client.wired.sw.port.mac[{#MAC}]           |
| *API stat/sta*: {#NAME} Wired Switch Port Speed            | Client switch port speed      | `Dependent item` | unifi.client.wired.sw.port.speed[{#MAC}]         |
| *API stat/sta*: {#NAME} Wired Switch Port Total rx         | Client total rx byte          | `Dependent item` | unifi.client.wired.sw.port.rx.bytes[{#MAC}]      |
| *API stat/sta*: {#NAME} Wired Switch Port Total rx         | Client total rx packets       | `Dependent item` | unifi.client.wired.sw.port.rx.packets[{#MAC}]    |
| *API stat/sta*: {#NAME} Wired Switch Port Total rx Retries | Client total rx retries byte  | `Dependent item` | unifi.client.wired.sw.port.rx.bytes.r[{#MAC}]    |
| *API stat/sta*: {#NAME} Wired Switch Port Total tx         | Client total tx byte          | `Dependent item` | unifi.client.wired.sw.port.tx.bytes[{#MAC}]      |
| *API stat/sta*: {#NAME} Wired Switch Port Total tx         | Client total tx packets       | `Dependent item` | unifi.client.wired.sw.port.tx.packets[{#MAC}]    |
| *API stat/sta*: {#NAME} Wired Switch Port Total tx Retries | Client total tx retries byte  | `Dependent item` | unifi.client.wired.sw.port.tx.bytes.r[{#MAC}]    |
| *API stat/sta*: {#NAME} DNS Record                         | Client dns record             | `Dependent item` | unifi.client.wireless.dns.record[{#MAC}]         |
| *API stat/sta*: {#NAME} DNS Record Enabled                 | Client dns record enabled     | `Dependent item` | unifi.client.wireless.dns.record.enabled[{#MAC}] |
| *API stat/sta*: {#NAME} First Seen                         | Client first seen date        | `Dependent item` | unifi.client.wireless.seen.first[{#MAC}]         |
| *API stat/sta*: {#NAME} Guest                              | Client is guest               | `Dependent item` | unifi.client.wireless.guest[{#MAC}]              |
| *API stat/sta*: {#NAME} Hostname                           | Client hostname               | `Dependent item` | unifi.client.wireless.hostname[{#MAC}]           |
| *API stat/sta*: {#NAME} IP                                 | Client IP                     | `Dependent item` | unifi.client.wireless.ip[{#MAC}]                 |
| *API stat/sta*: {#NAME} IP Fixed                           | Client IP is fixed            | `Dependent item` | unifi.client.wireless.ip.fixed[{#MAC}]           |
| *API stat/sta*: {#NAME} Last Seen                          | Client last seen date         | `Dependent item` | unifi.client.wireless.seen.last[{#MAC}]          |
| *API stat/sta*: {#NAME} Macaddress                         | Client Macaddress             | `Dependent item` | unifi.client.wireless.mac[{#MAC}]                |
| *API stat/sta*: {#NAME} Network                            | Client Network                | `Dependent item` | unifi.client.wireless.network[{#MAC}]            |
| *API stat/sta*: {#NAME} Uptime                             | Client uptime                 | `Dependent item` | unifi.client.wireless.uptime[{#MAC}]             |
| *API stat/sta*: {#NAME} Vlan                               | Client vlan id                | `Dependent item` | unifi.client.wireless.vlan[{#MAC}]               |
| *API stat/sta*: {#NAME} Wireless AP bssid                  | Access Point bssid            | `Dependent item` | unifi.client.wireless.ap.bssid[{#MAC}]           |
| *API stat/sta*: {#NAME} Wireless AP Channel                | Access Point channel          | `Dependent item` | unifi.client.wireless.ap.channel[{#MAC}]         |
| *API stat/sta*: {#NAME} Wireless AP essid                  | Access Point essid            | `Dependent item` | unifi.client.wireless.ap.essid[{#MAC}]           |
| *API stat/sta*: {#NAME} Wireless AP Macaddress             | Access Point macaddress       | `Dependent item` | unifi.client.wireless.ap.mac[{#MAC}]             |
| *API stat/sta*: {#NAME} Wireless AP Radio                  | Client radio                  | `Dependent item` | unifi.client.wireless.ap.radio[{#MAC}]           |
| *API stat/sta*: {#NAME} Wireless Noise                     | Client noise                  | `Dependent item` | unifi.client.wireless.ap.noise[{#MAC}]           |
| *API stat/sta*: {#NAME} Wireless powersave                 | Client is in powersave        | `Dependent item` | unifi.client.wireless.ap.powersave[{#MAC}]       |
| *API stat/sta*: {#NAME} Wireless Total rx                  | Client total rx byte          | `Dependent item` | unifi.client.wireless.rx.bytes[{#MAC}]           |
| *API stat/sta*: {#NAME} Wireless Total rx                  | Client total rx packets       | `Dependent item` | unifi.client.wireless.rx.packets[{#MAC}]         |
| *API stat/sta*: {#NAME} Wireless Total rx Retries          | Client total rx retries byte  | `Dependent item` | unifi.client.wireless.rx.bytes.r[{#MAC}]         |
| *API stat/sta*: {#NAME} Wireless Total tx                  | Client total tx byte          | `Dependent item` | unifi.client.wireless.tx.bytes[{#MAC}]           |
| *API stat/sta*: {#NAME} Wireless Total tx                  | Client total tx packets       | `Dependent item` | unifi.client.wireless.tx.packets[{#MAC}]         |
| *API stat/sta*: {#NAME} Wireless Total tx Retries          | Client total tx retries byte  | `Dependent item` | unifi.client.wireless.tx.bytes.r[{#MAC}]         |
| *API stat/sta*: {#NAME} Wireless tx rate                   | Client tx rate                | `Dependent item` | unifi.client.wireless.tx.bytes.r[{#MAC}]         |

## Unifi Network: Host prototypes

| Name              | Description                                            | Templates | Host Group |
| ----------------- | ------------------------------------------------------ | --------- | ---------- |
| Unifi UAP {#NAME} | Create an host for each Unifi Access Point discovered  | Unifi UAP | Network    |
| Unifi UDM {#NAME} | Create an host for each Unifi Dream Machine discovered | Unifi UDM | Network    |
| Unifi USW {#NAME} | Create an host for each Unifi Switch discovered        | Unifi UAP | Network    |

## Unifi Network: Items

| Name                                                  | Description                                | Type             | Key and additional info       |
| ----------------------------------------------------- | ------------------------------------------ | ---------------- | ----------------------------- |
| API stat/device-basic                                 | Get all Unifi devices                      | `HTTP agent`     | unifi.device<p>Update: 1d</p> |
| API stat/health                                       | Get Unifi Network health metrics           | `HTTP agent`     | unifi.health<p>Update: 5m</p> |
| API stat/sta                                          | Get metrics for all client on network      | `HTTP agent`     | unifi.client<p>Update: 5m</p> |
| *API stat/health*: Unifi Gateway CPU Usage %          | CPU usage percentage                       | `Dependent item` | unifi.cpu                     |
| *API stat/health*: Unifi Gateway LAN Client           | Number of clients on lan                   | `Dependent item` | unifi.lan.client              |
| *API stat/health*: Unifi Gateway LAN Guest Client     | Number of clients on guest lan             | `Dependent item` | unifi.lan.guest.client        |
| *API stat/health*: Unifi Gateway LAN Status           | Lan status                                 | `Dependent item` | unifi.lan.status              |
| *API stat/health*: Unifi Gateway LAN SW               | Number of Unifi Switch                     | `Dependent item` | unifi.lan.sw                  |
| *API stat/health*: Unifi Gateway LAN SW Adopted       | Number of adopted Unifi Switch             | `Dependent item` | unifi.lan.sw.adopted          |
| *API stat/health*: Unifi Gateway LAN SW Disconnected  | Number of disconnected Unifi Switch        | `Dependent item` | unifi.lan.sw.disconnected     |
| *API stat/health*: Unifi Gateway LAN SW Pending       | Number of pending Unifi Switch             | `Dependent item` | unifi.lan.sw.pending          |
| *API stat/health*: Unifi Gateway Memory Usage %       | Memory usage percentage                    | `Dependent item` | unifi.mem                     |
| *API stat/health*: Unifi Gateway Name                 | Unifi gateway hostname                     | `Dependent item` | unifi.gw_name                 |
| *API stat/health*: Unifi Gateway Uptime               | Unifi gateway uptime                       | `Dependent item` | unifi.uptime                  |
| *API stat/health*: Unifi Gateway VPN Active Users     | Number of users using vpn                  | `Dependent item` | unifi.vpn.users               |
| *API stat/health*: Unifi Gateway VPN Status           | Vpn status                                 | `Dependent item` | unifi.vpn.status              |
| *API stat/health*: Unifi Gateway WAN Download         | Current WAN download usage                 | `Dependent item` | unifi.wan.isp.download        |
| *API stat/health*: Unifi Gateway WAN ISP Availability | WAN availability                           | `Dependent item` | unifi.wan.isp.availability    |
| *API stat/health*: Unifi Gateway WAN ISP Latency Avg  | Avarage ISP latency                        | `Dependent item` | unifi.wan.isp.latency         |
| *API stat/health*: Unifi Gateway WAN ISP Name         | ISP name                                   | `Dependent item` | unifi.wan.isp.name            |
| *API stat/health*: Unifi Gateway WAN ISP Organization | ISP organization                           | `Dependent item` | unifi.wan.isp.organization    |
| *API stat/health*: Unifi Gateway WAN ISP Uptime       | ISP uptime                                 | `Dependent item` | unifi.wan.isp.uptime          |
| *API stat/health*: Unifi Gateway WAN Status           | WAN status                                 | `Dependent item` | unifi.wan.status              |
| *API stat/health*: Unifi Gateway WAN Upload           | Current WAN upload usage                   | `Dependent item` | unifi.wan.isp.upload          |
| *API stat/health*: Unifi Gateway WLAN AP              | Number of Unifi Access Point               | `Dependent item` | unifi.wlan.ap                 |
| *API stat/health*: Unifi Gateway WLAN AP Adopted      | Number of adopted Unifi Access Point       | `Dependent item` | unifi.wlan.ap.adopted         |
| *API stat/health*: Unifi Gateway WLAN AP Disabled     | Number of disabled Unifi Access Point      | `Dependent item` | unifi.wlan.ap.disabled        |
| *API stat/health*: Unifi Gateway WLAN AP Disconnected | Number of disconnected Unifi Access Point  | `Dependent item` | unifi.wlan.ap.disconnected    |
| *API stat/health*: Unifi Gateway WLAN AP Pending      | Number of pending Unifi Access Point       | `Dependent item` | unifi.wlan.ap.pending         |
| *API stat/health*: Unifi Gateway WLAN Client          | Number of clients on wlan                  | `Dependent item` | unifi.wlan.client             |
| *API stat/health*: Unifi Gateway WLAN Guest Client    | Number of clients on guest wlan            | `Dependent item` | unifi.wlan.guest.client       |
| *API stat/health*: Unifi Gateway WLAN Status          | Lan status                                 | `Dependent item` | unifi.wlan.status             |

## Unifi Network: Triggers

| Name | Description | Expression | Priority |
| ---  | ----------- | ---------- | -------- |
| CPU Usage > {$UNIFI.CPU.USAGE.HIGH}% | Alert when CPU usage is above {$UNIFI.CPU.USAGE.HIGH} | <p>***Expression***: avg(/Unifi Network/unifi.cpu,{$UNIFI.CPU.USAGE.HIGH.SEC})>{$UNIFI.CPU.USAGE.HIGH}</p><p>***Recovery expression***:</p> | High |
| CPU Usage > {$UNIFI.CPU.USAGE.WARNING}% | Alert when CPU usage is above {$UNIFI.CPU.USAGE.WARNING} | <p>***Expression***: avg(/Unifi Network/unifi.cpu,{$UNIFI.CPU.USAGE.WARNING.SEC})>{$UNIFI.CPU.USAGE.WARNING}</p><p>***Recovery expression***:</p> | Warning |
| Device rebooted | Alert on device reboot | <p>***Expression***: last(/Unifi Network/unifi.uptime)<86400</p><p>***Recovery expression***:</p> | Warning |
| Hostname Changed | Alert on hostname change | <p>***Expression***: last(/Unifi Network/unifi.gw_name,#1:now-24h)<>last(/Unifi Network/unifi.gw_name,#1)=1</p><p>***Recovery expression***:</p> | Warning |
| ISP Download Usage > {$UNIFI.ISP.SPEED.DOWNLOAD.HIGH}% | Alert when ISP Download usage is above {$UNIFI.ISP.SPEED.DOWNLOAD.HIGH} | <p>***Expression***: avg(/Unifi Network/unifi.wan.isp.download,{$UNIFI.ISP.SPEED.DOWNLOAD.HIGH.SEC})/10000/{$UNIFI.ISP.SPEED.DOWNLOAD}>{$UNIFI.ISP.SPEED.DOWNLOAD.HIGH}</p><p>***Recovery expression***:</p> | High |
| ISP Download Usage > {$UNIFI.ISP.SPEED.DOWNLOAD.WARNING}% | Alert when ISP Download usage is above {$UNIFI.ISP.SPEED.DOWNLOAD.WARNING} | <p>***Expression***: avg(/Unifi Network/unifi.wan.isp.download,{$UNIFI.ISP.SPEED.DOWNLOAD.WARNING.SEC})/10000/{$UNIFI.ISP.SPEED.DOWNLOAD}>{$UNIFI.ISP.SPEED.DOWNLOAD.WARNING}</p><p>***Recovery expression***:</p> | Warning |
| ISP Latency Usage > {$UNIFI.ISP.LATENCY.HIGH}ms | Alert when ISP Latency usage is above {$UNIFI.ISP.LATENCY.HIGH} | <p>***Expression***: avg(/Unifi Network/unifi.wan.isp.latency,{$UNIFI.ISP.LATENCY.HIGH.SEC})>{$UNIFI.ISP.LATENCY.HIGH}</p><p>***Recovery expression***:</p> | High |
| ISP Latency Usage > {$UNIFI.ISP.LATENCY.WARNING}ms | Alert when ISP Latency usage is above {$UNIFI.ISP.LATENCY.WARNING} | <p>***Expression***: avg(/Unifi Network/unifi.wan.isp.latency,{$UNIFI.ISP.LATENCY.WARNING.SEC})>{$UNIFI.ISP.LATENCY.WARNING}</p><p>***Recovery expression***:</p> | Warning |
| ISP Upload Usage > {$UNIFI.ISP.SPEED.UPLOAD.HIGH}% | Alert when ISP Upload usage is above {$UNIFI.ISP.SPEED.UPLOAD.HIGH} | <p>***Expression***: avg(/Unifi Network/unifi.wan.isp.upload,{$UNIFI.ISP.SPEED.UPLOAD.HIGH.SEC})/10000/{$UNIFI.ISP.SPEED.UPLOAD}>{$UNIFI.ISP.SPEED.UPLOAD.HIGH}</p><p>***Recovery expression***:</p> | High |
| ISP Upload Usage > {$UNIFI.ISP.SPEED.UPLOAD.WARNING}% | Alert when ISP Upload usage is above {$UNIFI.ISP.SPEED.UPLOAD.WARNING} | <p>***Expression***: avg(/Unifi Network/unifi.wan.isp.upload,{$UNIFI.ISP.SPEED.UPLOAD.WARNING.SEC})/10000/{$UNIFI.ISP.SPEED.UPLOAD}>{$UNIFI.ISP.SPEED.UPLOAD.WARNING}</p><p>***Recovery expression***:</p> | Warning |
| ISP Uptime changed | Alert on ISP uptime change | <p>***Expression***: last(/Unifi Network/unifi.wan.isp.uptime)<3600</p><p>***Recovery expression***:</p> | Warning |
| Memory Usage > {$UNIFI.MEMORY.USAGE.HIGH}% | Alert when Memory usage is above {$UNIFI.MEMORY.USAGE.HIGH} | <p>***Expression***: avg(/Unifi Network/unifi.mem,{$UNIFI.MEMORY.USAGE.HIGH.SEC})>{$UNIFI.MEMORY.USAGE.HIGH}</p><p>***Recovery expression***:</p> | High |
| Memory Usage > {$UNIFI.MEMORY.USAGE.WARNING}% | Alert when Memory usage is above {$UNIFI.MEMORY.USAGE.WARNING} | <p>***Expression***: avg(/Unifi Network/unifi.mem,{$UNIFI.MEMORY.USAGE.WARNING.SEC})>{$UNIFI.MEMORY.USAGE.WARNING}</p><p>***Recovery expression***:</p> | Warning |
| One or more Acces Point is disconnected | Alert if one or more access point is disconnected | <p>***Expression***: avg(/Unifi Network/unifi.wlan.ap.disconnected,{$UNIFI.AP.DISCONNECTED.SEC})>0</p><p>***Recovery expression***:</p> | High |
| One or more Access Point need to be adopted | Alert if one or more access point need to be adopted | <p>***Expression***: avg(/Unifi Network/unifi.wlan.ap.pending,{$UNIFI.AP.PENDING.SEC})>0</p><p>***Recovery expression***:</p> | Information |
| One or more Switch is disconnected | Alert if one or more switch is disconnected | <p>***Expression***: avg(/Unifi Network/unifi.lan.sw.disconnected,{$UNIFI.SW.DISCONNECTED.SEC})>0</p><p>***Recovery expression***:</p> | High |
| One or more Switch need to be adopted | Alert if one or more switch need to be adopted | <p>***Expression***: avg(/Unifi Network/unifi.lan.sw.pending,{$UNIFI.SW.PENDING.SEC})>0</p><p>***Recovery expression***:</p> | Information |
| Problem on LAN | Alert on lan problem | <p>***Expression***: last(/Unifi Network/unifi.lan.status,#3)<>"ok"</p><p>***Recovery expression***:</p> | High |
| Problem on VPN | Alert on vpn problem | <p>***Expression***: last(/Unifi Network/unifi.vpn.status,#3)<>"ok"</p><p>***Recovery expression***:</p> | High |
| Problem on WAN | Alert on wan problem | <p>***Expression***: last(/Unifi Network/unifi.wan.status,#3)<>"ok"</p><p>***Recovery expression***:</p> | High |
| Problem on WLAN | Alert on wlan problem | <p>***Expression***: last(/Unifi Network/unifi.wlan.status,#3)<>"ok"</p><p>***Recovery expression***:</p> | High |
| Unifi API not responding | Alert when Unifi Network API are not reachable | <p>***Expression***: last(/Unifi Network/unifi.health,#3)=""</p><p>***Recovery expression***:</p> | High |

## Unifi UDM: Macros

| Name                                    | Description                                           | Default                            | Required | Type      |
| --------------------------------------- | ----------------------------------------------------- | ---------------------------------- | -------- | --------- |
| {$UNIFI.CPU.USAGE.HIGH}                 | Cpu % High Trigger threshold                          | `90`                               | `true`   | `numeric` |
| {$UNIFI.CPU.USAGE.HIGH.SEC}             | Cpu High Trigger Avg threshold in seconds             | `900`                              | `true`   | `numeric` |
| {$UNIFI.CPU.USAGE.WARNING}              | Cpu % Warning Trigger threshold                       | `80`                               | `true`   | `numeric` |
| {$UNIFI.CPU.USAGE.WARNING.SEC}          | Cpu Warning Trigger Avg threshold in seconds          | `900`                              | `true`   | `numeric` |
| {$UNIFI.IP}                             | Unifi Ip                                              | `-`                                | `true`   | `text`    |
| {$UNIFI.MEMORY.USAGE.HIGH}              | Memory % High Trigger threshold                       | `90`                               | `true`   | `numeric` |
| {$UNIFI.MEMORY.USAGE.HIGH.SEC}          | Memory High Trigger Avg threshold in seconds          | `900`                              | `true`   | `numeric` |
| {$UNIFI.MEMORY.USAGE.WARNING}           | Memory % Warning Trigger threshold                    | `80`                               | `true`   | `numeric` |
| {$UNIFI.MEMORY.USAGE.WARNING.SEC}       | Memory Warning Trigger Avg threshold in seconds       | `900`                              | `true`   | `numeric` |
| {$UNIFI.PASSWORD}                       | Unifi View Only Password                              | `-`                                | `true`   | `numeric` |
| {$UNIFI.TEMP.HIGH}                      | Temperatire High Trigger threshold                    | `80`                               | `true`   | `numeric` |
| {$UNIFI.TEMP.HIGH.SEC}                  | Temperatire High Trigger threshold in sec             | `900`                              | `true`   | `numeric` |
| {$UNIFI.TEMP.WARNING}                   | Temperatire Warning Trigger threshold                 | `80`                               | `true`   | `numeric` |
| {$UNIFI.TEMP.WARNING.SEC}               | Temperatire Warning Trigger threshold in sec          | `900`                              | `true`   | `numeric` |
| {$UNIFI.UDM.MAC}                        | UNIFI GW Macaddress                                   | `-`                                | `true`   | `text`    |
| {$UNIFI.USERNAME}                       | Unifi View Only Username                              | `-`                                | `true`   | `numeric` |
| {$UNIFI.API.AUTH.URI}                   | Unifi API Authentication route                        | `api/auth/login`                   | `true`   | `text`    |
| {$UNIFI.API.AUTH.TOKEN}                 | Unifi API Authentication cookie name                  | `TOKEN`                            | `true`   | `text`    |
| {$UNIFI.API.URI}                        | Unifi API route                                       | `proxy/network/api/s/default/stat` | `true`   | `text`    |

## Unifi UDM: Discovery rules

| Name                                             | Description                      | Type             | Key and additional info         |
| ------------------------------------------------ | -------------------------------- | ---------------- | ------------------------------- |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port         | Discover UDM ports               | `Dependent item` | unifi.udm.port.discovery        |
| *API stat/device/{$UNIFI.UDM.MAC}*: Temperatures | Discover UDM temperature sensors | `Dependent item` | unifi.udm.temperature.discovery |

## Unifi UDM: Items prototype

| Name                                                              | Description                   | Type             | Key and additional info            |
| ----------------------------------------------------------------- | ----------------------------- | ---------------- | ---------------------------------- |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Enabled            | Port enabled                  | `Dependent item` | unifi.udm.port.enabled[{#ID}]      |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Media              | Port type                     | `Dependent item` | unifi.udm.port.media[{#ID}]        |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Mode               | Port mode                     | `Dependent item` | unifi.udm.port.mode[{#ID}]         |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Name               | Port name                     | `Dependent item` | unifi.udm.port.name[{#ID}]         |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} POE Capable        | Port POE capable              | `Dependent item` | unifi.udm.port.poe.capable[{#ID}]  |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} POE Good           | Port POE state                | `Dependent item` | unifi.udm.port.poe.good[{#ID}]     |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} POE Mode           | Port POE mode                 | `Dependent item` | unifi.udm.port.poe.mode[{#ID}]     |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} POE Power          | Port POE Watt                 | `Dependent item` | unifi.udm.port.poe.power[{#ID}]    |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Speed              | Port speed                    | `Dependent item` | unifi.udm.port.speed[{#ID}]        |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Total RX           | Port total rx bytes           | `Dependent item` | unifi.udm.port.rx[{#ID}]           |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Total RX Broadcast | Port total rx broadcast bytes | `Dependent item` | unifi.udm.port.rx.broadcast[{#ID}] |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Total RX Dropped   | Port total rx dropped bytes   | `Dependent item` | unifi.udm.port.rx.dropped[{#ID}]   |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Total RX Errors    | Port total rx error bytes     | `Dependent item` | unifi.udm.port.rx.errors[{#ID}]    |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Total RX Multicast | Port total rx multicast bytes | `Dependent item` | unifi.udm.port.rx.multicast[{#ID}] |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Total RX Packets   | Port total rx packets         | `Dependent item` | unifi.udm.port.rx.packets[{#ID}]   |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Total TX           | Port total tx bytes           | `Dependent item` | unifi.udm.port.tx[{#ID}]           |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Total TX Broadcast | Port total tx broadcast bytes | `Dependent item` | unifi.udm.port.tx.broadcast[{#ID}] |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Total TX Dropped   | Port total tx dropped bytes   | `Dependent item` | unifi.udm.port.tx.dropped[{#ID}]   |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Total TX Errors    | Port total tx errors bytes    | `Dependent item` | unifi.udm.port.tx.errors[{#ID}]    |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Total TX Multicast | Port total tx multicast bytes | `Dependent item` | unifi.udm.port.tx.multicast[{#ID}] |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Total TX Packets   | Port total tx packets         | `Dependent item` | unifi.udm.port.tx.packets[{#ID}]   |
| *API stat/device/{$UNIFI.UDM.MAC}*: Port {#ID} Up                 | Port up state                 | `Dependent item` | unifi.udm.port.up[{#ID}]           |
| *API stat/device/{$UNIFI.UDM.MAC}*: Temperature {#NAME}           | Temperature                   | `Dependent item` | udm.temperature[{#NAME}]           |

## Unifi UDM: Triggers prototype

| Name                                | Description                                           | Expression                                                                                                                                          | Priority |
| ----------------------------------  | ----------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| Temperature > {$UNIFI.TEMP.HIGH}    | Alert when temperature is above {$UNIFI.TEMP.HIGH}    | <p>***Expression***: last(/Unifi UDM/udm.temperature[{#NAME}],{$UNIFI.TEMP.HIGH.SEC})>{$UNIFI.TEMP.HIGH}</p><p>***Recovery expression***:</p>       | High     |
| Temperature > {$UNIFI.TEMP.WARNING} | Alert when temperature is above {$UNIFI.TEMP.WARNING} | <p>***Expression***: last(/Unifi UDM/udm.temperature[{#NAME}],{$UNIFI.TEMP.WARNING.SEC})>{$UNIFI.TEMP.WARNING}</p><p>***Recovery expression***:</p> | Warning  |

## Unifi UDM: Items

| Name                                                       | Description                     | Type             | Key and additional info           |
| ---------------------------------------------------------- | ------------------------------- | ---------------- | --------------------------------- |
| API stat/device/{$UNIFI.UDM.MAC}                           | Get device metrics              | `HTTP agent`     | unifi.udm.device<p>Update: 5m</p> |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Adopted            | Is adopted                      | `Dependent item` | unifi.udm.adopted                 |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Cpu Usage %        | Current CPU usage in percentage | `Dependent item` | unifi.udm.cpu.usage               |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Inform Ip          | Inform IP                       | `Dependent item` | unifi.udm.inform.ip               |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Inform Url         | Inform Url                      | `Dependent item` | unifi.udm.inform.url              |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM IP                 | IP                              | `Dependent item` | unifi.udm.ip                      |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Kernel Version     | Kernel version                  | `Dependent item` | unifi.udm.kernel.version          |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Last Seen          | Last seen date                  | `Dependent item` | unifi.udm.lastseen                |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Macaddress         | Macaddress                      | `Dependent item` | unifi.udm.mac                     |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Management Network | Management network              | `Dependent item` | unifi.udm.network                 |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Memory Usage %     | Current Memory Usage            | `Dependent item` | unifi.udm.memory.usage            |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Model              | Model                           | `Dependent item` | unifi.udm.model                   |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Serial             | Serial                          | `Dependent item` | unifi.udm.serial                  |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM SOC Arch           | SOC Arch                        | `Dependent item` | unifi.udm.soc.arch                |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM State              | State                           | `Dependent item` | unifi.udm.cpu.state               |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Total RX Byte      | Total rx in bytes               | `Dependent item` | unifi.udm.rx                      |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Total TX Byte      | Total tx in bytes               | `Dependent item` | unifi.udm.tx                      |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Upgradable         | Is an upgrade available         | `Dependent item` | unifi.udm.upgradable              |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Uptime             | Uptime                          | `Dependent item` | unifi.udm.uptime                  |
| *API stat/device/{$UNIFI.UDM.MAC}*: UDM Version            | Software version                | `Dependent item` | unifi.udm.version                 |

## Unifi UDM: Triggers

| Name                                          | Description                                                    | Expression                                                             | Priority |
| --------------------------------------------- | -------------------------------------------------------------- | ---------------------------------------------------------------------- | -------- |
| CPU Usage > {$UNIFI.CPU.USAGE.HIGH}%          | Alert when CPU usage is above {$UNIFI.CPU.USAGE.HIGH}          | <p>***Expression***: avg(/Unifi UDM/unifi.udm.cpu.usage,{$UNIFI.CPU.USAGE.HIGH.SEC})>{$UNIFI.CPU.USAGE.HIGH}</p><p>***Recovery expression***:</p> | High        |
| CPU Usage > {$UNIFI.CPU.USAGE.WARNING}%       | Alert when CPU usage is above {$UNIFI.CPU.USAGE.WARNING}       | <p>***Expression***: avg(/Unifi UDM/unifi.udm.cpu.usage,{$UNIFI.CPU.USAGE.WARNING.SEC})>{$UNIFI.CPU.USAGE.WARNING}</p><p>***Recovery expression***:</p> | Warning     |
| GW Not Adopted                                | Alert if UDM need to be adopted                                | <p>***Expression***: last(/Unifi UDM/unifi.udm.adopted)<>"true"</p><p>***Recovery expression***:</p> | Information |
| GW Offline                                    | Alert when UDM go offline                                      | <p>***Expression***: last(/Unifi UDM/unifi.udm.cpu.state,#3)<>1</p><p>***Recovery expression***:</p> | High        |
| GW Rebooted                                   | Alert if UDM was rebooted                                      | <p>***Expression***: last(/Unifi UDM/unifi.udm.uptime)<1800</p><p>***Recovery expression***:</p> | Warning     |
| Inform Url Changed                            | Alert on inform url change                                     | <p>***Expression***: last(/Unifi UDM/unifi.udm.inform.url,#1:now-24h)<>last(/Unifi UDM/unifi.udm.inform.url,#1)=1</p><p>***Recovery expression***:</p> | Warning     |
| Management Network Changed                    | Alert on management network change                             | <p>***Expression***: last(/Unifi UDM/unifi.udm.network,#1:now-24h)<>last(/Unifi UDM/unifi.udm.network,#1)=1</p><p>***Recovery expression***:</p> | Warning     |
| Memory Usage > {$UNIFI.MEMORY.USAGE.HIGH}%    | Alert when Memory usage is above {$UNIFI.MEMORY.USAGE.HIGH}    | <p>***Expression***: avg(/Unifi UDM/unifi.udm.memory.usage,{$UNIFI.MEMORY.USAGE.HIGH.SEC})>{$UNIFI.MEMORY.USAGE.HIGH}</p><p>***Recovery expression***:</p> | High        |
| Memory Usage > {$UNIFI.MEMORY.USAGE.WARNING}% | Alert when Memory usage is above {$UNIFI.MEMORY.USAGE.WARNING} | <p>***Expression***: avg(/Unifi UDM/unifi.udm.memory.usage,{$UNIFI.MEMORY.USAGE.WARNING.SEC})>{$UNIFI.MEMORY.USAGE.WARNING}</p><p>***Recovery expression***:</p> | Warning     |
| Software Upgrade Available                    | Alert on software upgrade available                            | <p>***Expression***: last(/Unifi UDM/unifi.udm.upgradable)="true"</p><p>***Recovery expression***:</p> | Warning     |
| Software Version Changed                      | Alert on software version change                               | <p>***Expression***: last(/Unifi UDM/unifi.udm.version,#1:now-24h)<>last(/Unifi UDM/unifi.udm.version,#1)=1</p><p>***Recovery expression***:</p> | Information |

## Unifi USW: Macros

| Name                                    | Description                                           | Default | Required | Type      |
| --------------------------------------- | ----------------------------------------------------- | ------- | -------- | --------- |
| {$UNIFI.CPU.USAGE.HIGH}                 | Cpu % High Trigger threshold                          | `90`    | `true`   | `numeric` |
| {$UNIFI.CPU.USAGE.HIGH.SEC}             | Cpu High Trigger Avg threshold in seconds             | `900`   | `true`   | `numeric` |
| {$UNIFI.CPU.USAGE.WARNING}              | Cpu % Warning Trigger threshold                       | `80`    | `true`   | `numeric` |
| {$UNIFI.CPU.USAGE.WARNING.SEC}          | Cpu Warning Trigger Avg threshold in seconds          | `900`   | `true`   | `numeric` |
| {$UNIFI.IP}                             | Unifi Ip                                              | `-`     | `true`   | `text`    |
| {$UNIFI.MEMORY.USAGE.HIGH}              | Memory % High Trigger threshold                       | `90`    | `true`   | `numeric` |
| {$UNIFI.MEMORY.USAGE.HIGH.SEC}          | Memory High Trigger Avg threshold in seconds          | `900`   | `true`   | `numeric` |
| {$UNIFI.MEMORY.USAGE.WARNING}           | Memory % Warning Trigger threshold                    | `80`    | `true`   | `numeric` |
| {$UNIFI.MEMORY.USAGE.WARNING.SEC}       | Memory Warning Trigger Avg threshold in seconds       | `900`   | `true`   | `numeric` |
| {$UNIFI.PASSWORD}                       | Unifi View Only Password                              | `-`     | `true`   | `numeric` |
| {$UNIFI.USW.MAC}                        | UNIFI USW Macaddress                                  | `-`     | `true`   | `text`    |
| {$UNIFI.USERNAME}                       | Unifi View Only Username                              | `-`     | `true`   | `numeric` |

## Unifi USW: Discovery rules

| Name                                             | Description                      | Type             | Key and additional info         |
| ------------------------------------------------ | -------------------------------- | ---------------- | ------------------------------- |
| *API stat/device/{$UNIFI.USW.MAC}*: Port         | Discover USW ports               | `Dependent item` | unifi.usw.port.discovery        |

## Unifi USW: Items prototypes

| Name                                                              | Description                   | Type             | Key and additional info            |
| ----------------------------------------------------------------- | ----------------------------- | ---------------- | ---------------------------------- |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Enabled            | Port enabled                  | `Dependent item` | unifi.usw.port.enabled[{#ID}]      |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Media              | Port type                     | `Dependent item` | unifi.usw.port.media[{#ID}]        |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Mode               | Port mode                     | `Dependent item` | unifi.usw.port.mode[{#ID}]         |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Name               | Port name                     | `Dependent item` | unifi.usw.port.name[{#ID}]         |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} POE Capable        | Port POE capable              | `Dependent item` | unifi.usw.port.poe.capable[{#ID}]  |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} POE Good           | Port POE state                | `Dependent item` | unifi.usw.port.poe.good[{#ID}]     |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} POE Mode           | Port POE mode                 | `Dependent item` | unifi.usw.port.poe.mode[{#ID}]     |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} POE Power          | Port POE Watt                 | `Dependent item` | unifi.usw.port.poe.power[{#ID}]    |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Speed              | Port speed                    | `Dependent item` | unifi.usw.port.speed[{#ID}]        |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Total RX           | Port total rx bytes           | `Dependent item` | unifi.usw.port.rx[{#ID}]           |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Total RX Broadcast | Port total rx broadcast bytes | `Dependent item` | unifi.usw.port.rx.broadcast[{#ID}] |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Total RX Dropped   | Port total rx dropped bytes   | `Dependent item` | unifi.usw.port.rx.dropped[{#ID}]   |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Total RX Errors    | Port total rx error bytes     | `Dependent item` | unifi.usw.port.rx.errors[{#ID}]    |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Total RX Multicast | Port total rx multicast bytes | `Dependent item` | unifi.usw.port.rx.multicast[{#ID}] |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Total RX Packets   | Port total rx packets         | `Dependent item` | unifi.usw.port.rx.packets[{#ID}]   |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Total TX           | Port total tx bytes           | `Dependent item` | unifi.usw.port.tx[{#ID}]           |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Total TX Broadcast | Port total tx broadcast bytes | `Dependent item` | unifi.usw.port.tx.broadcast[{#ID}] |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Total TX Dropped   | Port total tx dropped bytes   | `Dependent item` | unifi.usw.port.tx.dropped[{#ID}]   |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Total TX Errors    | Port total tx errors bytes    | `Dependent item` | unifi.usw.port.tx.errors[{#ID}]    |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Total TX Multicast | Port total tx multicast bytes | `Dependent item` | unifi.usw.port.tx.multicast[{#ID}] |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Total TX Packets   | Port total tx packets         | `Dependent item` | unifi.usw.port.tx.packets[{#ID}]   |
| *API stat/device/{$UNIFI.USW.MAC}*: Port {#ID} Up                 | Port up state                 | `Dependent item` | unifi.usw.port.up[{#ID}]           |

## Unifi USW: Items

| Name                                                       | Description                     | Type             | Key and additional info           |
| ---------------------------------------------------------- | ------------------------------- | ---------------- | --------------------------------- |
| API stat/device/{$UNIFI.USW.MAC}                           | Get device metrics              | `HTTP agent`     | unifi.usw.device<p>Update: 5m</p> |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Adopted            | Is adopted                      | `Dependent item` | unifi.usw.adopted                 |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Cpu Usage %        | Current CPU usage in percentage | `Dependent item` | unifi.usw.cpu.usage               |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Inform Ip          | Inform IP                       | `Dependent item` | unifi.usw.inform.ip               |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Inform Url         | Inform Url                      | `Dependent item` | unifi.usw.inform.url              |
| *API stat/device/{$UNIFI.USW.MAC}*: USW IP                 | IP                              | `Dependent item` | unifi.usw.ip                      |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Kernel Version     | Kernel version                  | `Dependent item` | unifi.usw.kernel.version          |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Last Seen          | Last seen date                  | `Dependent item` | unifi.usw.lastseen                |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Macaddress         | Macaddress                      | `Dependent item` | unifi.usw.mac                     |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Management Network | Management network              | `Dependent item` | unifi.usw.network                 |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Memory Usage %     | Current Memory Usage            | `Dependent item` | unifi.usw.memory.usage            |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Model              | Model                           | `Dependent item` | unifi.usw.model                   |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Serial             | Serial                          | `Dependent item` | unifi.usw.serial                  |
| *API stat/device/{$UNIFI.USW.MAC}*: USW SOC Arch           | SOC Arch                        | `Dependent item` | unifi.usw.soc.arch                |
| *API stat/device/{$UNIFI.USW.MAC}*: USW State              | State                           | `Dependent item` | unifi.usw.cpu.state               |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Total RX Byte      | Total rx in bytes               | `Dependent item` | unifi.usw.rx                      |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Total TX Byte      | Total tx in bytes               | `Dependent item` | unifi.usw.tx                      |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Upgradable         | Is an upgrade available         | `Dependent item` | unifi.usw.upgradable              |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Uplink Device      | Uplink device name              | `Dependent item` | unifi.usw.uplink.device           |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Uplink Port        | Uplink device port              | `Dependent item` | unifi.usw.uplink.port             |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Uplink Type        | Uplink device type              | `Dependent item` | unifi.usw.uplink.type             |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Uptime             | Uptime                          | `Dependent item` | unifi.usw.uptime                  |
| *API stat/device/{$UNIFI.USW.MAC}*: USW Version            | Software version                | `Dependent item` | unifi.usw.version                 |

## Unifi USW: Triggers

| Name                                          | Description                                                    | Expression                                                             | Priority |
| --------------------------------------------- | -------------------------------------------------------------- | ---------------------------------------------------------------------- | -------- |
| CPU Usage > {$UNIFI.CPU.USAGE.HIGH}%          | Alert when CPU usage is above {$UNIFI.CPU.USAGE.HIGH}          | <p>***Expression***: avg(/Unifi USW/unifi.usw.cpu.usage,{$UNIFI.CPU.USAGE.HIGH.SEC})>{$UNIFI.CPU.USAGE.HIGH}</p><p>***Recovery expression***:</p> | High        |
| CPU Usage > {$UNIFI.CPU.USAGE.WARNING}%       | Alert when CPU usage is above {$UNIFI.CPU.USAGE.WARNING}       | <p>***Expression***: avg(/Unifi USW/unifi.usw.cpu.usage,{$UNIFI.CPU.USAGE.WARNING.SEC})>{$UNIFI.CPU.USAGE.WARNING}</p><p>***Recovery expression***:</p> | Warning     |
| Inform Url Changed                            | Alert on inform url change                                     | <p>***Expression***: last(/Unifi USW/unifi.usw.inform.url,#1:now-24h)<>last(/Unifi USW/unifi.usw.inform.url,#1)=1</p><p>***Recovery expression***:</p> | Warning     |
| Management Network Changed                    | Alert on management network change                             | <p>***Expression***: last(/Unifi USW/unifi.usw.network,#1:now-24h)<>last(/Unifi USW/unifi.usw.network,#1)=1</p><p>***Recovery expression***:</p> | Warning     |
| Memory Usage > {$UNIFI.MEMORY.USAGE.HIGH}%    | Alert when Memory usage is above {$UNIFI.MEMORY.USAGE.HIGH}    | <p>***Expression***: avg(/Unifi USW/unifi.usw.memory.usage,{$UNIFI.MEMORY.USAGE.HIGH.SEC})>{$UNIFI.MEMORY.USAGE.HIGH}</p><p>***Recovery expression***:</p> | High        |
| Memory Usage > {$UNIFI.MEMORY.USAGE.WARNING}% | Alert when Memory usage is above {$UNIFI.MEMORY.USAGE.WARNING} | <p>***Expression***: avg(/Unifi USW/unifi.usw.memory.usage,{$UNIFI.MEMORY.USAGE.WARNING.SEC})>{$UNIFI.MEMORY.USAGE.WARNING}</p><p>***Recovery expression***:</p> | Warning     |
| Software Upgrade Available                    | Alert on software upgrade available                            | <p>***Expression***: last(/Unifi USW/unifi.usw.upgradable)="true"</p><p>***Recovery expression***:</p> | Warning     |
| Software Version Changed                      | Alert on software version change                               | <p>***Expression***: last(/Unifi USW/unifi.usw.version,#1:now-24h)<>last(/Unifi USW/unifi.usw.version,#1)=1</p><p>***Recovery expression***:</p> | Information |
| SW Not Adopted                                | Alert if USW need to be adopted                                | <p>***Expression***: last(/Unifi USW/unifi.usw.adopted)<>"true"</p><p>***Recovery expression***:</p> | Information |
| SW Offline                                    | Alert when USW go offline                                      | <p>***Expression***: last(/Unifi USW/unifi.usw.cpu.state,#3)<>1</p><p>***Recovery expression***:</p> | High        |
| SW Rebooted                                   | Alert if USW was rebooted                                      | <p>***Expression***: last(/Unifi USW/unifi.usw.uptime)<1800</p><p>***Recovery expression***:</p> | Warning     |

## Unifi UAP: Macros

| Name                                    | Description                                           | Default | Required | Type      |
| --------------------------------------- | ----------------------------------------------------- | ------- | -------- | --------- |
| {$UNIFI.CPU.USAGE.HIGH}                 | Cpu % High Trigger threshold                          | `90`    | `true`   | `numeric` |
| {$UNIFI.CPU.USAGE.HIGH.SEC}             | Cpu High Trigger Avg threshold in seconds             | `900`   | `true`   | `numeric` |
| {$UNIFI.CPU.USAGE.WARNING}              | Cpu % Warning Trigger threshold                       | `80`    | `true`   | `numeric` |
| {$UNIFI.CPU.USAGE.WARNING.SEC}          | Cpu Warning Trigger Avg threshold in seconds          | `900`   | `true`   | `numeric` |
| {$UNIFI.IP}                             | Unifi Ip                                              | `-`     | `true`   | `text`    |
| {$UNIFI.MEMORY.USAGE.HIGH}              | Memory % High Trigger threshold                       | `90`    | `true`   | `numeric` |
| {$UNIFI.MEMORY.USAGE.HIGH.SEC}          | Memory High Trigger Avg threshold in seconds          | `900`   | `true`   | `numeric` |
| {$UNIFI.MEMORY.USAGE.WARNING}           | Memory % Warning Trigger threshold                    | `80`    | `true`   | `numeric` |
| {$UNIFI.MEMORY.USAGE.WARNING.SEC}       | Memory Warning Trigger Avg threshold in seconds       | `900`   | `true`   | `numeric` |
| {$UNIFI.PASSWORD}                       | Unifi View Only Password                              | `-`     | `true`   | `numeric` |
| {$UNIFI.UAP.MAC}                        | UNIFI UAP Macaddress                                  | `-`     | `true`   | `text`    |
| {$UNIFI.USERNAME}                       | Unifi View Only Username                              | `-`     | `true`   | `numeric` |

## Unifi UAP: Discovery rules

| Name                                             | Description                      | Type             | Key and additional info         |
| ------------------------------------------------ | -------------------------------- | ---------------- | ------------------------------- |
| *API stat/device/{$UNIFI.UAP.MAC}*: Radio        | Discover UAP radio antennas      | `Dependent item` | unifi.uap.radio.discovery       |

## Unifi UAP: Items prototypes

| Name                                                              | Description              | Type             | Key and additional info               |
| ----------------------------------------------------------------- | ------------------------ | ---------------- | ------------------------------------- |
| *API stat/device/{$UNIFI.UAP.MAC}*: {#NAME} Channel               | channel                  | `Dependent item` | unifi.uap.radio.channel[{#NAME}]      |
| *API stat/device/{$UNIFI.UAP.MAC}*: {#NAME} Gain                  | gain                     | `Dependent item` | unifi.uap.radio.gain[{#NAME}]         |
| *API stat/device/{$UNIFI.UAP.MAC}*: {#NAME} HT                    | ht                       | `Dependent item` | unifi.uap.radio.ht[{#NAME}]           |
| *API stat/device/{$UNIFI.UAP.MAC}*: {#NAME} Radio                 | radio                    | `Dependent item` | unifi.uap.radio.radio[{#NAME}]        |
| *API stat/device/{$UNIFI.UAP.MAC}*: {#NAME} State                 | state                    | `Dependent item` | unifi.uap.radio.state[{#NAME}]        |
| *API stat/device/{$UNIFI.UAP.MAC}*: {#NAME} TX Packets            | total tx packets         | `Dependent item` | unifi.uap.radio.tx.packets[{#NAME}]   |
| *API stat/device/{$UNIFI.UAP.MAC}*: {#NAME} TX Power              | total tx errors bytes    | `Dependent item` | unifi.uap.radio.tx.errors[{#NAME}]    |
| *API stat/device/{$UNIFI.UAP.MAC}*: {#NAME} TX Power Mode         | total tx multicast bytes | `Dependent item` | unifi.uap.radio.tx.multicast[{#NAME}] |
| *API stat/device/{$UNIFI.UAP.MAC}*: {#NAME} TX Retries            | total tx dropped bytes   | `Dependent item` | unifi.uap.radio.tx.dropped[{#NAME}]   |

## Unifi UAP: Triggers prototype

| Name                     | Description                                 | Expression                                                                                                          | Priority |
| -----------------------  | ------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | -------- |
| {#NAME} State is not RUN | Alert when antennas is not in running state | <p>***Expression***: last(/Unifi UAP/unifi.uap.radio.state[{#NAME}],#3)<>"RUN"</p><p>***Recovery expression***:</p> | High     |

## Unifi UAP: Items

| Name                                                       | Description                     | Type             | Key and additional info           |
| ---------------------------------------------------------- | ------------------------------- | ---------------- | --------------------------------- |
| API stat/device/{$UNIFI.UAP.MAC}                           | Get device metrics              | `HTTP agent`     | unifi.uap.device<p>Update: 5m</p> |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Adopted            | Is adopted                      | `Dependent item` | unifi.uap.adopted                 |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Cpu Usage %        | Current CPU usage in percentage | `Dependent item` | unifi.uap.cpu.usage               |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Inform Ip          | Inform IP                       | `Dependent item` | unifi.uap.inform.ip               |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Inform Url         | Inform Url                      | `Dependent item` | unifi.uap.inform.url              |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP IP                 | IP                              | `Dependent item` | unifi.uap.ip                      |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Kernel Version     | Kernel version                  | `Dependent item` | unifi.uap.kernel.version          |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Last Seen          | Last seen date                  | `Dependent item` | unifi.uap.lastseen                |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Macaddress         | Macaddress                      | `Dependent item` | unifi.uap.mac                     |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Management Network | Management network              | `Dependent item` | unifi.uap.network                 |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Memory Usage %     | Current Memory Usage            | `Dependent item` | unifi.uap.memory.usage            |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Model              | Model                           | `Dependent item` | unifi.uap.model                   |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Serial             | Serial                          | `Dependent item` | unifi.uap.serial                  |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP SOC Arch           | SOC Arch                        | `Dependent item` | unifi.uap.soc.arch                |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP State              | State                           | `Dependent item` | unifi.uap.cpu.state               |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Total RX Byte      | Total rx in bytes               | `Dependent item` | unifi.uap.rx                      |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Total TX Byte      | Total tx in bytes               | `Dependent item` | unifi.uap.tx                      |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Upgradable         | Is an upgrade available         | `Dependent item` | unifi.uap.upgradable              |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Uplink Device      | Uplink device name              | `Dependent item` | unifi.uap.uplink.device           |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Uplink Port        | Uplink device port              | `Dependent item` | unifi.uap.uplink.port             |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Uplink Type        | Uplink device type              | `Dependent item` | unifi.uap.uplink.type             |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Uptime             | Uptime                          | `Dependent item` | unifi.uap.uptime                  |
| *API stat/device/{$UNIFI.UAP.MAC}*: UAP Version            | Software version                | `Dependent item` | unifi.uap.version                 |

## Unifi UAP: Triggers

| Name                                          | Description                                                    | Expression                                                             | Priority |
| --------------------------------------------- | -------------------------------------------------------------- | ---------------------------------------------------------------------- | -------- |
| CPU Usage > {$UNIFI.CPU.USAGE.HIGH}%          | Alert when CPU usage is above {$UNIFI.CPU.USAGE.HIGH}          | <p>***Expression***: avg(/Unifi UAP/unifi.uap.cpu.usage,{$UNIFI.CPU.USAGE.HIGH.SEC})>{$UNIFI.CPU.USAGE.HIGH}</p><p>***Recovery expression***:</p> | High        |
| CPU Usage > {$UNIFI.CPU.USAGE.WARNING}%       | Alert when CPU usage is above {$UNIFI.CPU.USAGE.WARNING}       | <p>***Expression***: avg(/Unifi UAP/unifi.uap.cpu.usage,{$UNIFI.CPU.USAGE.WARNING.SEC})>{$UNIFI.CPU.USAGE.WARNING}</p><p>***Recovery expression***:</p> | Warning     |
| Inform Url Changed                            | Alert on inform url change                                     | <p>***Expression***: last(/Unifi UAP/unifi.uap.inform.url,#1:now-24h)<>last(/Unifi UAP/unifi.uap.inform.url,#1)=1</p><p>***Recovery expression***:</p> | Warning     |
| Management Network Changed                    | Alert on management network change                             | <p>***Expression***: last(/Unifi UAP/unifi.uap.network,#1:now-24h)<>last(/Unifi UAP/unifi.uap.network,#1)=1</p><p>***Recovery expression***:</p> | Warning     |
| Memory Usage > {$UNIFI.MEMORY.USAGE.HIGH}%    | Alert when Memory usage is above {$UNIFI.MEMORY.USAGE.HIGH}    | <p>***Expression***: avg(/Unifi UAP/unifi.uap.memory.usage,{$UNIFI.MEMORY.USAGE.HIGH.SEC})>{$UNIFI.MEMORY.USAGE.HIGH}</p><p>***Recovery expression***:</p> | High        |
| Memory Usage > {$UNIFI.MEMORY.USAGE.WARNING}% | Alert when Memory usage is above {$UNIFI.MEMORY.USAGE.WARNING} | <p>***Expression***: avg(/Unifi UAP/unifi.uap.memory.usage,{$UNIFI.MEMORY.USAGE.WARNING.SEC})>{$UNIFI.MEMORY.USAGE.WARNING}</p><p>***Recovery expression***:</p> | Warning     |
| Software Upgrade Available                    | Alert on software upgrade available                            | <p>***Expression***: last(/Unifi UAP/unifi.uap.upgradable)="true"</p><p>***Recovery expression***:</p> | Warning     |
| Software Version Changed                      | Alert on software version change                               | <p>***Expression***: last(/Unifi UAP/unifi.uap.version,#1:now-24h)<>last(/Unifi UAP/unifi.uap.version,#1)=1</p><p>***Recovery expression***:</p> | Information |
| SW Not Adopted                                | Alert if UAP need to be adopted                                | <p>***Expression***: last(/Unifi UAP/unifi.uap.adopted)<>"true"</p><p>***Recovery expression***:</p> | Information |
| SW Offline                                    | Alert when UAP go offline                                      | <p>***Expression***: last(/Unifi UAP/unifi.uap.cpu.state,#3)<>1</p><p>***Recovery expression***:</p> | High        |
| SW Rebooted                                   | Alert if UAP was rebooted                                      | <p>***Expression***: last(/Unifi UAP/unifi.uap.uptime)<1800</p><p>***Recovery expression***:</p> | Warning     |

## Contribute

This template is on early stage and can bee improved supporting other Unifi devices. Feel free to fork and submit pull request at [MassimilianoPasquini97/zbx_unifi_network](https://github.com/MassimilianoPasquini97/zbx_unifi_network) repository. 🙏🏻

## License

Licensed under the [MIT license](https://github.com/MassimilianoPasquini97/zbx_unifi_network/blob/main/LICENSE.md).
