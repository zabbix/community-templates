# App WireGuard

## Overview

Hi,


I tried to create a template to monitor WireGuard with Zabbix.  
WireGuard does not really provide any monitoring tool so I had to do with "wg show" commands.


It's probably not perfect so if you want to help I'm interested.


Template provides 2 discovery rules :


Interfaces Discovery (wg0, wg1...) :  
- Items to get active peers, total peers, port used and check firewall mark.  
- Triggers to check changes on port, fwmark and numbers of clients.  
- Graph to monitor active and total peers (even if connections are never released by WG once established).  



Peers Discovery (based on public key) :  
I had to truncate keys to 10 characters for easy reading. It should not be a problem because they're random.  
- Items to get for each endpoint : allowed IPs, IP address, port used, incoming/outgoing traffic, keepalive status and the last handshake.   
- Triggers to track changes on allowed IPs, connection port, IP address, keeaplive status and to monitor high traffic and unreachable endpoint.  
- Graph to monitor incoming/outgoing network traffic.  



This template may work with previous versions of Zabbix but it was tested for Zabbix 4.0 on a Debian 9.6 server.


Please follow the link for instructions and files.


Have fun !



## Author

Cryptage21

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|WireGuard Peers Discovery|<p>-</p>|`Zabbix agent`|wg.list.discovery[PEERS]<p>Update: 3600s</p>|
|WireGuard Interfaces Discovery|<p>-</p>|`Zabbix agent`|wg.list.discovery[INTERFACES]<p>Update: 3600s</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Endpoint IP address for peer {#PEER}... on {#INTERFACE}|<p>-</p>|`Zabbix agent`|wg.endpoint.address[{#PEER}]<p>Update: 15m</p><p>LLD</p>|
|Allowed IPs for peer {#PEER}... on {#INTERFACE}|<p>-</p>|`Zabbix agent`|wg.endpoint.allowedips[{#PEER}]<p>Update: 30m</p><p>LLD</p>|
|Last handshake for peer {#PEER}... on {#INTERFACE}|<p>-</p>|`Zabbix agent`|wg.endpoint.handshake[{#PEER}]<p>Update: 10m</p><p>LLD</p>|
|Keepalive enabled for peer {#PEER}... on {#INTERFACE}|<p>-</p>|`Zabbix agent`|wg.endpoint.keepalive[{#PEER}]<p>Update: 30m</p><p>LLD</p>|
|Endpoint port for peer {#PEER}... on {#INTERFACE}|<p>-</p>|`Zabbix agent`|wg.endpoint.port[{#PEER}]<p>Update: 15m</p><p>LLD</p>|
|Incoming traffic for peer {#PEER}... on {#INTERFACE}|<p>-</p>|`Zabbix agent`|wg.endpoint.transferdown[{#PEER}]<p>Update: 5m</p><p>LLD</p>|
|Outgoing traffic for peer {#PEER}... on {#INTERFACE}|<p>-</p>|`Zabbix agent`|wg.endpoint.transferup[{#PEER}]<p>Update: 5m</p><p>LLD</p>|
|Firewall mark enabled on {#WGINTERFACE}|<p>-</p>|`Zabbix agent`|wg.fw.mark[{#WGINTERFACE}]<p>Update: 60m</p><p>LLD</p>|
|Active peers on {#WGINTERFACE}|<p>-</p>|`Zabbix agent`|wg.peers.connected[{#WGINTERFACE}]<p>Update: 15m</p><p>LLD</p>|
|Total peers on {#WGINTERFACE}|<p>-</p>|`Zabbix agent`|wg.peers.count[{#WGINTERFACE}]<p>Update: 30m</p><p>LLD</p>|
|Port used on {#WGINTERFACE}|<p>-</p>|`Zabbix agent`|wg.port.used[{#WGINTERFACE}]<p>Update: 60m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Connection port changed on {#WGINTERFACE} {HOST.NAME} VPN|<p>-</p>|<p>**Expression**: {App WireGuard:wg.port.used[{#WGINTERFACE}].diff()}=1</p><p>**Recovery expression**: </p>|warning|
|Firewall mark changed on {#WGINTERFACE} {HOST.NAME} VPN|<p>-</p>|<p>**Expression**: {App WireGuard:wg.fw.mark[{#WGINTERFACE}].diff()}=1</p><p>**Recovery expression**: </p>|warning|
|Less clients connected on {#WGINTERFACE} {HOST.NAME} VPN|<p>-</p>|<p>**Expression**: {App WireGuard:wg.peers.connected[{#WGINTERFACE}].change()}<=-1</p><p>**Recovery expression**: </p>|information|
|More clients connected on {#WGINTERFACE} {HOST.NAME} VPN|<p>-</p>|<p>**Expression**: {App WireGuard:wg.peers.connected[{#WGINTERFACE}].change()}>=1</p><p>**Recovery expression**: </p>|information|
|Peers added on {#WGINTERFACE} {HOST.NAME} VPN|<p>-</p>|<p>**Expression**: {App WireGuard:wg.peers.count[{#WGINTERFACE}].change()}>=1</p><p>**Recovery expression**: </p>|information|
|Peers removed on {#WGINTERFACE} {HOST.NAME} VPN|<p>-</p>|<p>**Expression**: {App WireGuard:wg.peers.count[{#WGINTERFACE}].change()}<=-1</p><p>**Recovery expression**: </p>|information|
|Allowed IPs list altered for {#PEER}... peer on {HOST.NAME}|<p>-</p>|<p>**Expression**: {App WireGuard:wg.endpoint.allowedips[{#PEER}].diff()}=1</p><p>**Recovery expression**: </p>|high|
|Connection port changed for {#PEER}... peer on {HOST.NAME}|<p>-</p>|<p>**Expression**: {App WireGuard:wg.endpoint.port[{#PEER}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|High incoming traffic for {#PEER}... peer on {HOST.NAME}|<p>-</p>|<p>**Expression**: {App WireGuard:wg.endpoint.transferdown[{#PEER}].change()}>52428800</p><p>**Recovery expression**: </p>|average|
|High outgoing traffic for {#PEER}... peer on {HOST.NAME}|<p>-</p>|<p>**Expression**: {App WireGuard:wg.endpoint.transferup[{#PEER}].change()}>52428800</p><p>**Recovery expression**: </p>|average|
|IP address changed for {#PEER}... peer on {HOST.NAME}|<p>-</p>|<p>**Expression**: {App WireGuard:wg.endpoint.address[{#PEER}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|Keepalived changed for {#PEER}... peer on {HOST.NAME}|<p>-</p>|<p>**Expression**: {App WireGuard:wg.endpoint.keepalive[{#PEER}].diff()}=1</p><p>**Recovery expression**: </p>|warning|
|Unreachable {#PEER}... peer on {HOST.NAME} for 30 minutes|<p>-</p>|<p>**Expression**: {App WireGuard:wg.endpoint.handshake[{#PEER}].fuzzytime(1800)}=0</p><p>**Recovery expression**: </p>|high|
|Allowed IPs list altered for {#PEER}... peer on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {App WireGuard:wg.endpoint.allowedips[{#PEER}].diff()}=1</p><p>**Recovery expression**: </p>|high|
|Connection port changed for {#PEER}... peer on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {App WireGuard:wg.endpoint.port[{#PEER}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|High incoming traffic for {#PEER}... peer on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {App WireGuard:wg.endpoint.transferdown[{#PEER}].change()}>52428800</p><p>**Recovery expression**: </p>|average|
|High outgoing traffic for {#PEER}... peer on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {App WireGuard:wg.endpoint.transferup[{#PEER}].change()}>52428800</p><p>**Recovery expression**: </p>|average|
|IP address changed for {#PEER}... peer on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {App WireGuard:wg.endpoint.address[{#PEER}].diff()}=1</p><p>**Recovery expression**: </p>|information|
|Keepalived changed for {#PEER}... peer on {HOST.NAME} (LLD)|<p>-</p>|<p>**Expression**: {App WireGuard:wg.endpoint.keepalive[{#PEER}].diff()}=1</p><p>**Recovery expression**: </p>|warning|
|Unreachable {#PEER}... peer on {HOST.NAME} for 30 minutes (LLD)|<p>-</p>|<p>**Expression**: {App WireGuard:wg.endpoint.handshake[{#PEER}].fuzzytime(1800)}=0</p><p>**Recovery expression**: </p>|high|
|Connection port changed on {#WGINTERFACE} {HOST.NAME} VPN (LLD)|<p>-</p>|<p>**Expression**: {App WireGuard:wg.port.used[{#WGINTERFACE}].diff()}=1</p><p>**Recovery expression**: </p>|warning|
|Firewall mark changed on {#WGINTERFACE} {HOST.NAME} VPN (LLD)|<p>-</p>|<p>**Expression**: {App WireGuard:wg.fw.mark[{#WGINTERFACE}].diff()}=1</p><p>**Recovery expression**: </p>|warning|
|Less clients connected on {#WGINTERFACE} {HOST.NAME} VPN (LLD)|<p>-</p>|<p>**Expression**: {App WireGuard:wg.peers.connected[{#WGINTERFACE}].change()}<=-1</p><p>**Recovery expression**: </p>|information|
|More clients connected on {#WGINTERFACE} {HOST.NAME} VPN (LLD)|<p>-</p>|<p>**Expression**: {App WireGuard:wg.peers.connected[{#WGINTERFACE}].change()}>=1</p><p>**Recovery expression**: </p>|information|
|Peers added on {#WGINTERFACE} {HOST.NAME} VPN (LLD)|<p>-</p>|<p>**Expression**: {App WireGuard:wg.peers.count[{#WGINTERFACE}].change()}>=1</p><p>**Recovery expression**: </p>|information|
|Peers removed on {#WGINTERFACE} {HOST.NAME} VPN (LLD)|<p>-</p>|<p>**Expression**: {App WireGuard:wg.peers.count[{#WGINTERFACE}].change()}<=-1</p><p>**Recovery expression**: </p>|information|
