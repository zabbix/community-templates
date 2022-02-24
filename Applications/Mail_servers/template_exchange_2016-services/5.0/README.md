# Microsoft Exchange Server 2016 - Services

## Overview


```
The "Exchange 2016 - Services" is mostly used to restart critical services by using "ACTIONS" and has discovery rules (Which Are Disabled by Default)

This template is based on using the {EVENT.TAGS} as a execute command within Actions.
(Note: The whole Trigger will execute all alerts and do with them as you specify but independently execute based on 5m run-times)
So if there are three (3) services out, it may take fifteen (15) to twenty (20) mins to restart them.


To create an "ACTION" do the following.

Add "All Services" and tag them as (Trigger equals XXX)

See Example: Trigger equals Template Microsoft Exchange Server 2016 - Services: Service: MSExchangeUMCR on Template Microsoft Exchange Server 2016 - Services

If done correctly, you will have A~AE Trigger equals, about (31 Objects)

Once done, under "Operations" to Execute a command on the windows server use the following configuration.

Operation Type: Remote Command (Note: Zabbix Agent must be set to "Allow Remote Commands)
Target list: Current Host
Type: Custom Script
Execute on: Zabbix Agent
Commands: net start {EVENT.TAGS}

Yes, it a "Vague" tutorial (Sorry)
```


## Author

Route Packets

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|{#SERVICE.NAME}|<p>-</p>|`Zabbix agent`|service_state<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Service Status Microsoft Exchange Search|<p>-</p>|`Zabbix agent`|service_state[MSExchangeFastSearch]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Search Host Controller|<p>-</p>|`Zabbix agent`|service_state[HostControllerService]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Transport Submission|<p>-</p>|`Zabbix agent`|service_state[MSExchangeSubmission]<p>Update: 5m</p>|
|Service Status Microsoft Exchange POP3|<p>-</p>|`Zabbix agent`|service_state[MSExchangePop3]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Information Store|<p>-</p>|`Zabbix agent`|service_state[MSExchangeIS]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Transport Delivery|<p>-</p>|`Zabbix agent`|service_state[MSExchangeDelivery]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Throttling|<p>-</p>|`Zabbix agent`|service_state[MSExchangeThrottling]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Unified Messaging Call Router|<p>-</p>|`Zabbix agent`|service_state[MSExchangeUMCR]<p>Update: 5m</p>|
|Service Status Microsoft Exchange EdgeSync|<p>-</p>|`Zabbix agent`|service_state[MSExchangeEdgeSync]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Mailbox Replication|<p>-</p>|`Zabbix agent`|service_state[MSExchangeMailboxReplication]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Unified Messaging|<p>-</p>|`Zabbix agent`|service_state[MSExchangeUM]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Service Host|<p>-</p>|`Zabbix agent`|service_state[MSExchangeServiceHost]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Transport Log Search|<p>-</p>|`Zabbix agent`|service_state[MSExchangeTransportLogSearch]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Transport|<p>-</p>|`Zabbix agent`|service_state[MSExchangeTransport]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Diagnostics|<p>-</p>|`Zabbix agent`|service_state[MSExchangeDiagnostics]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Server Extension for Windows Server Backup|<p>-</p>|`Zabbix agent`|service_state[wsbexchange]<p>Update: 1m</p>|
|Service Status Microsoft Exchange IMAP4|<p>-</p>|`Zabbix agent`|service_state[MSExchangeImap4]<p>Update: 5m</p>|
|Service Status Microsoft Exchange IMAP4 Backend|<p>-</p>|`Zabbix agent`|service_state[MSExchangeIMAP4BE]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Health Manager|<p>-</p>|`Zabbix agent`|service_state[MSExchangeHM]<p>Update: 5m</p>|
|Service Status Microsoft Exchange DAG Management|<p>-</p>|`Zabbix agent`|service_state[MSExchangeDagMgmt]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Compliance Service|<p>-</p>|`Zabbix agent`|service_state[MSExchangeCompliance]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Anti-spam update|<p>-</p>|`Zabbix agent`|service_state[MSExchangeAntispamUpdate]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Health Manager Recovery|<p>-</p>|`Zabbix agent`|service_state[MSExchangeHMRecovery]<p>Update: 1m</p>|
|Service Status Microsoft Exchange POP3 Backend|<p>-</p>|`Zabbix agent`|service_state[MSExchangePOP3BE]<p>Update: 5m</p>|
|Service Status Microsoft Exchange RPC Client Access|<p>-</p>|`Zabbix agent`|service_state[MSExchangeRPC]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Mailbox Assistants|<p>-</p>|`Zabbix agent`|service_state[MSExchangeMailboxAssistants]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Replication|<p>-</p>|`Zabbix agent`|service_state[MSExchangeRepl]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Frontend Transport|<p>-</p>|`Zabbix agent`|service_state[MSExchangeFrontEndTransport]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Notifications Broker|<p>-</p>|`Zabbix agent`|service_state[MSExchangeNotificationsBroker]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Active Directory Topology|<p>-</p>|`Zabbix agent`|service_state[MSExchangeADTopology]<p>Update: 5m</p>|
|Service Status Microsoft Exchange Compliance Audit|<p>-</p>|`Zabbix agent`|service_state[MSComplianceAudit]<p>Update: 5m</p>|
|State of service "{#SERVICE.NAME}" ({#SERVICE.DISPLAYNAME})|<p>-</p>|`Zabbix agent`|service_state[{#SERVICE.NAME},state]<p>Update: 1m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{#SERVICE.DISPLAYNAME} ({#SERVICE.NAME}) {#SERVICE.STATENAME} on {HOST.NAME} and be able to extract {#SERVICE.NAME} from it|<p>-</p>|<p>**Expression**: {Microsoft Exchange Server 2016 - Services:service_state[{#SERVICE.NAME},state].last()}<>0</p><p>**Recovery expression**: {Microsoft Exchange Server 2016 - Services:service_state[{#SERVICE.NAME},state].last()}<>0</p>|not classified|
|{#SERVICE.DISPLAYNAME} ({#SERVICE.NAME}) {#SERVICE.STATENAME} on {HOST.NAME} and be able to extract {#SERVICE.NAME} from it (LLD)|<p>-</p>|<p>**Expression**: {Microsoft Exchange Server 2016 - Services:service_state[{#SERVICE.NAME},state].last()}<>0</p><p>**Recovery expression**: {Microsoft Exchange Server 2016 - Services:service_state[{#SERVICE.NAME},state].last()}<>0</p>|not classified|
