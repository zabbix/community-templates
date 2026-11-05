# Eltex SMG Template 7.4

## Author

Sergey B.

## Macros used

There are no macros used in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CPU Discovery|<p>-</p>|`SNMP agent`|cpu_discovery<p>Update: 10m</p>|
|Disk Discovery|<p>-</p>|`SNMP agent`|disk_discovery<p>Update: 15m</p>|
|E1 Stream Discovery|<p>-</p>|`SNMP agent`|e1_discovery<p>Update: 15m</p>|
|Interface Discovery|<p>-</p>|`SNMP agent`|if_discovery<p>Update: 10m</p>|
|FrontPort LACP Discovery|<p>-</p>|`SNMP agent`|lacp_discovery<p>Update: 10m</p>|
|License Discovery|<p>-</p>|`SNMP agent`|lic_discovery<p>Update: 6h</p>|
|MSP Module Discovery|<p>-</p>|`SNMP agent`|msp_discovery<p>Update: 15m</p>|
|Power Module Discovery|<p>-</p>|`SNMP agent`|pm_discovery<p>Update: 10m</p>|
|SIP Interface Discovery|<p>-</p>|`SNMP agent`|sip_if_discovery<p>Update: 10m</p>|
|Trunk Monitor Discovery|<p>-</p>|`SNMP agent`|trunk_discovery<p>Update: 10m</p>|
|VoIP Channel Discovery|<p>-</p>|`SNMP agent`|voip_discovery<p>Update: 15m</p>|

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Active Call Count|<p>-</p>|`SNMP agent`|smg.active_calls<p>Update: 30s</p>|
|Application Uptime|<p>Application uptime</p>|`SNMP agent`|smg.app_uptime<p>Update: 30m</p>|
|Cached RAM (UCD)|<p>Cached memory</p>|`SNMP agent`|smg.cached_ram<p>Update: 5m</p>|
|CAPS 1min Invalid|<p>-</p>|`SNMP agent`|smg.caps1_invalid<p>Update: 10s</p>|
|CAPS 1min Total|<p>-</p>|`SNMP agent`|smg.caps1_total<p>Update: 10s</p>|
|CAPS 1min Users|<p>-</p>|`SNMP agent`|smg.caps1_users<p>Update: 10s</p>|
|CAPS 10sec Invalid|<p>-</p>|`SNMP agent`|smg.caps10_invalid<p>Update: 10s</p>|
|CAPS 10sec Total|<p>-</p>|`SNMP agent`|smg.caps10_total<p>Update: 10s</p>|
|CAPS 10sec Users|<p>-</p>|`SNMP agent`|smg.caps10_users<p>Update: 10s</p>|
|Device Name|<p>SMG device hostname</p>|`SNMP agent`|smg.dev_name<p>Update: 1h</p>|
|Device Type|<p>SMG device type identifier</p>|`SNMP agent`|smg.dev_type<p>Update: 6h</p>|
|Eth0 IP Address|<p>Management IP</p>|`SNMP agent`|smg.eth0_ip<p>Update: 1h</p>|
|Fan 0 Speed|<p>No data on SMG500 (no fans)</p>|`SNMP agent`|smg.fan[0]<p>Update: 5m</p>|
|Fan 1 Speed|<p>No data on SMG500 (no fans)</p>|`SNMP agent`|smg.fan[1]<p>Update: 5m</p>|
|Fan 2 Speed|<p>No data on SMG500 (no fans)</p>|`SNMP agent`|smg.fan[2]<p>Update: 5m</p>|
|Fan 3 Speed|<p>No data on SMG500 (no fans)</p>|`SNMP agent`|smg.fan[3]<p>Update: 5m</p>|
|Free RAM (SMG)|<p>SMG MIB free RAM (DisplayString)</p>|`SNMP agent`|smg.free_ram_smg<p>Update: 1m</p>|
|Free RAM (UCD)|<p>Free physical memory</p>|`SNMP agent`|smg.free_ram_ucd<p>Update: 1m</p>|
|Free Disk Space|<p>-</p>|`SNMP agent`|smg.free_space<p>Update: 5m</p>|
|Firmware Version - Version|<p>Firmware version</p>|`SNMP agent`|smg.fw_version<p>Update: 6h</p>|
|Firmware Version - Build|<p>-</p>|`SNMP agent`|smg.fw_version_build<p>Update: 6h</p>|
|Firmware Version - Licenses|<p>Licenses</p>|`SNMP agent`|smg.fw_version_licenses<p>Update: 6h</p>|
|HW Revision|<p>Hardware revision</p>|`SNMP agent`|smg.hw_revision<p>Update: 6h</p>|
|RADIUS Acct Success|<p>-</p>|`SNMP agent`|smg.radius_acct_ok<p>Update: 5m</p>|
|RADIUS Access Accept|<p>-</p>|`SNMP agent`|smg.radius_acc_accept<p>Update: 5m</p>|
|RADIUS Access Reject|<p>-</p>|`SNMP agent`|smg.radius_acc_reject<p>Update: 5m</p>|
|RADIUS Access Req|<p>-</p>|`SNMP agent`|smg.radius_acc_req<p>Update: 5m</p>|
|RADIUS Proc Timeout|<p>-</p>|`SNMP agent`|smg.radius_proc_timeout<p>Update: 5m</p>|
|RADIUS Sent|<p>-</p>|`SNMP agent`|smg.radius_sent<p>Update: 5m</p>|
|RADIUS Resp Timeouts|<p>-</p>|`SNMP agent`|smg.radius_timeout<p>Update: 5m</p>|
|RADIUS Timeout Exhaust|<p>-</p>|`SNMP agent`|smg.radius_timeout_exh<p>Update: 5m</p>|
|RADIUS Total|<p>-</p>|`SNMP agent`|smg.radius_total<p>Update: 5m</p>|
|Registration Count|<p>-</p>|`SNMP agent`|smg.reg_count<p>Update: 1m</p>|
|Active SIP Users|<p>-</p>|`SNMP agent`|smg.sip_active<p>Update: 1m</p>|
|SIP Interface Count|<p>-</p>|`SNMP agent`|smg.sip_if_count<p>Update: 5m</p>|
|Total SIP Users|<p>-</p>|`SNMP agent`|smg.sip_total<p>Update: 5m</p>|
|System Uptime|<p>System uptime</p>|`SNMP agent`|smg.sys_uptime<p>Update: 30m</p>|
|Temperature 1|<p>DisplayString, parse with regex</p>|`SNMP agent`|smg.temp[1]<p>Update: 30s</p>|
|Temperature 2|<p>DisplayString, parse with regex</p>|`SNMP agent`|smg.temp[2]<p>Update: 30s</p>|
|Total RAM (UCD)|<p>Total physical memory</p>|`SNMP agent`|smg.total_ram<p>Update: 1m</p>|
|Used RAM|<p>Total - Free</p>|`Calculated`|smg.used_ram<p>Update: 1s</p>|
|Configuration alarm|<p>-</p>|`SNMP trap`|snmptrap["Configuration"]<p>Update: 0</p>|
|CPU Temp Alarm|<p>-</p>|`SNMP trap`|snmptrap["CPU"]<p>Update: 0</p>|
|CDR-file|<p>-</p>|`SNMP trap`|snmptrap["Failed to create operational CDR-file"]<p>Update: 0</p>|
|IP-NET interface number|<p>-</p>|`SNMP trap`|snmptrap["IP-NET interface"]<p>Update: 0</p>|
|LinkSet alarm|<p>-</p>|`SNMP trap`|snmptrap["LinkSet"]<p>Update: 0</p>|
|Memory alarm|<p>-</p>|`SNMP trap`|snmptrap["Memory"]<p>Update: 0</p>|
|Processor alarm|<p>-</p>|`SNMP trap`|snmptrap["Processor"]<p>Update: 0</p>|
|SIP interface number|<p>-</p>|`SNMP trap`|snmptrap["SIP interface"]<p>Update: 0</p>|
|SIP OPTIONS queue|<p>-</p>|`SNMP trap`|snmptrap["SIP OPTIONS queue"]<p>Update: 0</p>|
|SIPT Module Alarm|<p>-</p>|`SNMP trap`|snmptrap["SIPT-module"]<p>Update: 0</p>|
|SM-VP device alarm|<p>-</p>|`SNMP trap`|snmptrap["SM-VP device"]<p>Update: 0</p>|
|SS7-Link alarm|<p>-</p>|`SNMP trap`|snmptrap["SS7-Link"]<p>Update: 0</p>|
|Stream alarm|<p>-</p>|`SNMP trap`|snmptrap["Stream"]<p>Update: 0</p>|
|Other alarms|<p>-</p>|`SNMP trap`|snmptrap[]<p>Update: 0</p>|
|CPU {#SNMPINDEX} Idle %|<p>-</p>|`SNMP agent`|smg.cpu_idle[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|CPU {#SNMPINDEX} IO %|<p>-</p>|`SNMP agent`|smg.cpu_io[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|CPU {#SNMPINDEX} IRQ %|<p>-</p>|`SNMP agent`|smg.cpu_irq[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|CPU {#SNMPINDEX} NIC %|<p>-</p>|`SNMP agent`|smg.cpu_nic[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|CPU {#SNMPINDEX} SIRQ %|<p>-</p>|`SNMP agent`|smg.cpu_sirq[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|CPU {#SNMPINDEX} System %|<p>-</p>|`SNMP agent`|smg.cpu_sys[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|CPU {#SNMPINDEX} Usage %|<p>-</p>|`SNMP agent`|smg.cpu_usage[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|CPU {#SNMPINDEX} User %|<p>-</p>|`SNMP agent`|smg.cpu_usr[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Disk {#SNMPINDEX} Free Size|<p>-</p>|`SNMP agent`|smg.disk_free[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Disk {#SNMPINDEX} Full Size|<p>-</p>|`SNMP agent`|smg.disk_full[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|Disk {#SNMPINDEX} Use %|<p>-</p>|`SNMP agent`|smg.disk_use[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|E1 {#SNMPINDEX} - BER|<p>-</p>|`SNMP agent`|smg.e1_ber[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|E1 {#SNMPINDEX} - Busy Channels|<p>-</p>|`SNMP agent`|smg.e1_busy[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|E1 {#SNMPINDEX} - Line Alarm|<p>-</p>|`SNMP agent`|smg.e1_line_alarm[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|E1 {#SNMPINDEX} - Link State|<p>-</p>|`SNMP agent`|smg.e1_link_state[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|E1 {#SNMPINDEX} - Name|<p>-</p>|`SNMP agent`|smg.e1_name[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|E1 {#SNMPINDEX} - Phy State|<p>-</p>|`SNMP agent`|smg.e1_phy[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|E1 {#SNMPINDEX} - Remote Alarm|<p>-</p>|`SNMP agent`|smg.e1_rem_alarm[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|E1 {#SNMPINDEX} - Rx Count|<p>-</p>|`SNMP agent`|smg.e1_rx[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|E1 {#SNMPINDEX} - Slip Down|<p>-</p>|`SNMP agent`|smg.e1_slipdown[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|E1 {#SNMPINDEX} - Slip Up|<p>-</p>|`SNMP agent`|smg.e1_slipup[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|E1 {#SNMPINDEX} - Tx Count|<p>-</p>|`SNMP agent`|smg.e1_tx[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|{#SNMPVALUE} - In Discards|<p>-</p>|`SNMP agent`|if.indisc[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#SNMPVALUE} - In Errors|<p>-</p>|`SNMP agent`|if.inerr[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#SNMPVALUE} - RX Bytes|<p>-</p>|`SNMP agent`|if.in[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#SNMPVALUE} - operStatus|<p>-</p>|`SNMP agent`|if.opstatus[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#SNMPVALUE} - Out Discards|<p>-</p>|`SNMP agent`|if.outdisc[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#SNMPVALUE} - Out Errors|<p>-</p>|`SNMP agent`|if.outerr[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#SNMPVALUE} - TX Bytes|<p>-</p>|`SNMP agent`|if.out[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|{#SNMPVALUE} - Speed|<p>-</p>|`SNMP agent`|if.speed[{#SNMPINDEX}]<p>Update: 10m</p><p>LLD</p>|
|FrontPort {#SNMPINDEX} LACP Group|<p>-</p>|`SNMP agent`|smg.lacp_group[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|FrontPort {#SNMPINDEX} LACP State|<p>-</p>|`SNMP agent`|smg.lacp_state[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|License {#SNMPINDEX} - License Count|<p>-</p>|`SNMP agent`|smg.lic_count[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|License {#SNMPINDEX} - License Left|<p>-</p>|`SNMP agent`|smg.lic_left[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|License {#SNMPINDEX} - License Name|<p>-</p>|`SNMP agent`|smg.lic_name[{#SNMPINDEX}]<p>Update: 1h</p><p>LLD</p>|
|MSP {#SNMPINDEX} - Created|<p>-</p>|`SNMP agent`|smg.msp_created[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|MSP {#SNMPINDEX} - Create Req|<p>-</p>|`SNMP agent`|smg.msp_create_req[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|MSP {#SNMPINDEX} - Destroyed|<p>-</p>|`SNMP agent`|smg.msp_destroyed[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|MSP {#SNMPINDEX} - Destroy Req|<p>-</p>|`SNMP agent`|smg.msp_destroy_req[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|MSP {#SNMPINDEX} - Payload|<p>-</p>|`SNMP agent`|smg.msp_payload[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|MSP {#SNMPINDEX} - State|<p>-</p>|`SNMP agent`|smg.msp_state[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|MSP {#SNMPINDEX} - Used Conn|<p>-</p>|`SNMP agent`|smg.msp_used_conn[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|PM {#SNMPINDEX} Exist|<p>-</p>|`SNMP agent`|smg.pm_exist[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|PM {#SNMPINDEX} Power|<p>-</p>|`SNMP agent`|smg.pm_power[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|SIP IF {#SNMPINDEX} - Accessible|<p>-</p>|`SNMP agent`|smg.sip_if_accessible[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|SIP IF {#SNMPINDEX} - Call Count|<p>-</p>|`SNMP agent`|smg.sip_if_calls[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|SIP IF {#SNMPINDEX} - Egress Calls|<p>-</p>|`SNMP agent`|smg.sip_if_egress[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|SIP IF {#SNMPINDEX} - Ingress Calls|<p>-</p>|`SNMP agent`|smg.sip_if_ingress[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|SIP IF {#SNMPINDEX} - Max Calls|<p>-</p>|`SNMP agent`|smg.sip_if_max_calls[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|SIP IF {#SNMPINDEX} - Mode|<p>-</p>|`SNMP agent`|smg.sip_if_mode[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|SIP IF {#SNMPINDEX} - Name|<p>-</p>|`SNMP agent`|smg.sip_if_name[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Trunk {#SNMPINDEX} - Busy Ch|<p>-</p>|`SNMP agent`|smg.trunk_busy[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Trunk {#SNMPINDEX} - Capacity|<p>-</p>|`SNMP agent`|smg.trunk_cap[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Trunk {#SNMPINDEX} - CPS|<p>-</p>|`SNMP agent`|smg.trunk_cps[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Trunk {#SNMPINDEX} - Egress Calls|<p>-</p>|`SNMP agent`|smg.trunk_egress[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Trunk {#SNMPINDEX} - Enable|<p>-</p>|`SNMP agent`|smg.trunk_enable[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Trunk {#SNMPINDEX} - Free Ch|<p>-</p>|`SNMP agent`|smg.trunk_free[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Trunk {#SNMPINDEX} - Ingress Calls|<p>-</p>|`SNMP agent`|smg.trunk_ingress[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Trunk {#SNMPINDEX} - Name|<p>-</p>|`SNMP agent`|smg.trunk_name[{#SNMPINDEX}]<p>Update: 5m</p><p>LLD</p>|
|Trunk {#SNMPINDEX} - Status|<p>-</p>|`SNMP agent`|smg.trunk_status[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|Trunk {#SNMPINDEX} - Total Calls|<p>-</p>|`SNMP agent`|smg.trunk_total[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|VoIP {#SNMPINDEX} Busy Ch|<p>-</p>|`SNMP agent`|smg.voip_busy[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|
|VoIP {#SNMPINDEX} Free Ch|<p>-</p>|`SNMP agent`|smg.voip_free[{#SNMPINDEX}]<p>Update: 30s</p><p>LLD</p>|

## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Firmware version changed|<p>-</p>|<p>**Expression**: change(/Eltex SMG Template v7/smg.fw_version)=1</p><p>**Recovery expression**: </p>|information|
|Configuration alarm|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["Configuration"],,"like","Configuration failure")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["Configuration"],,"like","Configuration in norm")=1</p>|high|
|CPU 70C|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["CPU"],,"regexp","CPU overheating more than 70C. .* on CPU, .* on RAM")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["CPU"],,"like","CPU temperature in norm")=1</p>|warning|
|CPU 85C|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["CPU"],,"regexp","CPU overheating more than 85C. .* on CPU, .* on RAM")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["CPU"],,"like","CPU temperature in norm")=1</p>|average|
|CPU 100C|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["CPU"],,"regexp","CPU overheating more than 100C. .* on CPU, .* on RAM")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["CPU"],,"like","CPU temperature in norm")=1</p>|disaster|
|IP-NET interface number|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["IP-NET interface"],,"regexp","IP-NET interface .* access alarm")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["IP-NET interface"],,"regexp","IP-NET interface .* access in norm")=1</p>|average|
|LinkSet alarm|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["LinkSet"],,"regexp","LinkSet.*alarm")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["LinkSet"],,"regexp","LinkSet.*in norm")=1</p>|high|
|Memory 75%|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["Memory"],,"regexp","Memory 75% busy (free .* of .* Mb)")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["Memory"],,"like","Memory in norm (less than 75% busy)")=1</p>|warning|
|Memory 90%|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["Memory"],,"regexp","Memory 90% busy (free .* of .* Mb)")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["Memory"],,"like","Memory in norm (less than 75% busy)")=1</p>|high|
|Memory 95%|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["Memory"],,"regexp","Memory 95% busy (free .* of .* Mb)")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["Memory"],,"like","Memory in norm (less than 75% busy)")=1</p>|disaster|
|Processor 90%|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["Processor"],,"regexp","Processor .* overload 90%")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["Processor"],,"like","Processor load in norm")=1</p>|high|
|Processor 95%|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["Processor"],,"regexp","Processor .* overload 95%")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["Processor"],,"like","Processor load in norm")=1</p>|disaster|
|SIP interface number|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["SIP interface"],,"regexp","SIP interface .* access alarm")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["SIP interface"],,"regexp","SIP interface .* access in norm")=1</p>|average|
|SIP OPTIONS queue overload|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["SIP OPTIONS queue"],,"like","SIP OPTIONS queue overload")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["SIP OPTIONS queue"],,"like","SIP OPTIONS queue in norm")=1</p>|warning|
|SIPT Module Alarm|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["SIPT-module"],,"like","SIPT-module alarm")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["SIPT-module"],,"like","SIPT-module in norm")=1</p>|high|
|SM-VP device alarm|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["SM-VP device"],,"regexp","SM-VP device.*alarm")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["SM-VP device"],,"regexp","SM-VP device.*in norm")=1</p>|high|
|SS7-Link alarm|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["SS7-Link"],,"regexp","SS7-Link alarm (LinkSet .*, E1 stream.*)")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["SS7-Link"],,"regexp","SS7-Link in norm (LinkSet .*, E1 stream.*)")=1</p>|high|
|Stream loss|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["Stream"],,"regexp","Stream.*signal loss")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["Stream"],,"regexp","Stream.*in norm")=1</p>|high|
|Stream remote alarm|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap["Stream"],,"regexp","Stream.*remote alarm")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap["Stream"],,"regexp","Stream.*in norm")=1</p>|warning|
|CDR-data less 5|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap[],,"like","No connection with upload server, local CDR-data is less than 5 Mb")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap[],,"like","Upload server connection in norm")=1</p>|warning|
|CDR-data less 15|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap[],,"like","No connection with upload server, local CDR-data is more than 5 Mb and less than 15 Mb")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap[],,"like","Upload server connection in norm")=1</p>|average|
|CDR-data more 15|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap[],,"like","No connection with upload server, local CDR-data is more than 15 Mb")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap[],,"like","Upload server connection in norm")=1</p>|high|
|H323 adapter alarm|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap[],,"like","No connection with H323 adapter")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap[],,"like","Connection with H323 adapter in norm")=1</p>|high|
|Less priority synchronization|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap[],,"like","Less priority synchronization alarm")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap[],,"like","Synchronization in norm")=1</p>|warning|
|Local synchronization|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap[],,"like","Local synchronization alarm")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap[],,"like","Synchronization in norm")=1</p>|high|
|No fans|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap[],,"like","No fans operated")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap[],,"regexp","All .* fans operated")=1</p>|warning|
|Only 1 fan|<p>-</p>|<p>**Expression**: find(/Eltex SMG Template v7/snmptrap[],,"regexp","Only .* of .* fans operated")=1</p><p>**Recovery expression**: find(/Eltex SMG Template v7/snmptrap[],,"regexp","All .* fans operated")=1</p>|warning|
|CPU {#SNMPINDEX} usage > 80% (LLD)|<p>-</p>|<p>**Expression**: last(/Eltex SMG Template v7/smg.cpu_usage[{#SNMPINDEX}]) > 80</p><p>**Recovery expression**: </p>|warning|
|CPU {#SNMPINDEX} usage > 95% (LLD)|<p>-</p>|<p>**Expression**: last(/Eltex SMG Template v7/smg.cpu_usage[{#SNMPINDEX}]) > 95</p><p>**Recovery expression**: </p>|average|
|Disk {{#SNMPINDEX}} > 85% (LLD)|<p>-</p>|<p>**Expression**: last(/Eltex SMG Template v7/smg.disk_use[{#SNMPINDEX}]) > 85</p><p>**Recovery expression**: </p>|warning|
|Disk {{#SNMPINDEX}} > 95% (LLD)|<p>-</p>|<p>**Expression**: last(/Eltex SMG Template v7/smg.disk_use[{#SNMPINDEX}]) > 95</p><p>**Recovery expression**: </p>|average|
|E1 {{#SNMPINDEX}} Line Alarm (LLD)|<p>-</p>|<p>**Expression**: last(/Eltex SMG Template v7/smg.e1_line_alarm[{#SNMPINDEX}]) > 0</p><p>**Recovery expression**: </p>|average|
|E1 {{#SNMPINDEX}} Remote Alarm (LLD)|<p>-</p>|<p>**Expression**: last(/Eltex SMG Template v7/smg.e1_rem_alarm[{#SNMPINDEX}]) > 0</p><p>**Recovery expression**: </p>|warning|
|Interface {{#SNMPVALUE}} down (LLD)|<p>-</p>|<p>**Expression**: last(/Eltex SMG Template v7/if.opstatus[{#SNMPINDEX}],#2)=0 and last(/Eltex SMG Template v7/if.opstatus[{#SNMPINDEX}])<>0</p><p>**Recovery expression**: </p>|average|
|MSP {{#SNMPINDEX}} failed (LLD)|<p>-</p>|<p>**Expression**: last(/Eltex SMG Template v7/smg.msp_state[{#SNMPINDEX}]) = 3</p><p>**Recovery expression**: </p>|high|
|MSP {{#SNMPINDEX}} not present (LLD)|<p>-</p>|<p>**Expression**: last(/Eltex SMG Template v7/smg.msp_state[{#SNMPINDEX}]) = 0</p><p>**Recovery expression**: </p>|information|
|PM {{#SNMPINDEX}} missing (LLD)|<p>-</p>|<p>**Expression**: last(/Eltex SMG Template v7/smg.pm_exist[{#SNMPINDEX}]) = 2</p><p>**Recovery expression**: </p>|warning|
|SIP IF {{#SNMPINDEX}} not accessible (LLD)|<p>-</p>|<p>**Expression**: last(/Eltex SMG Template v7/smg.sip_if_accessible[{#SNMPINDEX}]) = 2</p><p>**Recovery expression**: </p>|warning|
