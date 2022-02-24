# ESA-CISCO XML Status

## Overview

Template allows to monitor your CISCO ESA ( IRONPORT ). number of active recipients, number of completed recipietns per minute, number of injected (recieved by esa) messages per minute, number of connections and so on. For now there is no triggers.


Installation:


1. import the template,
2. create read\_only\_operator user in your ESA,
3. create and fill in value macros in zabbix ESA host: {$IRP\_LOGIN} for login and {$IRP\_PASS} for password (both created on step 2)
4. link imported template to ESA host


Default update interval is 5 min. you can chage it in "Get\_Ironport\_xml\_status" item.


Tempalate contains 28 items. "HTTP agent" item (Get\_Ironport\_xml\_status) reads xml status page from ESA (https://{HOST.IP}/xml/status) and 27 dependet items, using preproceccing and XML Path to get items from XML:


* 5xx\_hard\_bounced\_recips
* active\_recips
* completed\_recips
* completed\_recips\_last\_1\_min
* conn\_in
* conn\_out
* deleted\_recips
* delivered\_recips
* delivered\_recips\_last\_1\_min
* dns\_hard\_bounced\_recips
* dropped\_msgs
* expired\_hard\_bounced\_recips
* filter\_hard\_bounced\_recips
* gen\_bounce\_recips
* global\_unsub\_hits
* hard\_bounced\_recips
* hard\_bounced\_recips\_last\_1\_min
* inj\_msgs
* inj\_msgs\_last\_1\_min
* inj\_recips
* inj\_recips\_last\_1\_min
* kbytes\_in\_policy\_virus\_outbreak\_quarantine
* msgs\_in\_policy\_virus\_outbreak\_quarantine
* other\_hard\_bounced\_recips
* rejected\_recips
* soft\_bounced\_evts
* soft\_bounced\_evts\_last\_1\_min


## Author

DK

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|soft_bounced_evts per 1m|<p>-</p>|`Dependent item`|soft_bounced_evts_last_1_min<p>Update: 0</p>|
|hard_bounced_recips  lifetime|<p>-</p>|`Dependent item`|hard_bounced_recips<p>Update: 0</p>|
|conn_out|<p>-</p>|`Dependent item`|conn_out<p>Update: 0</p>|
|rejected_recips  lifetime|<p>-</p>|`Dependent item`|rejected_recips<p>Update: 0</p>|
|delivered_recips  lifetime|<p>-</p>|`Dependent item`|delivered_recips<p>Update: 0</p>|
|Get_Ironport_xml_status|<p>-</p>|`HTTP agent`|Get_Ironport_xml_status<p>Update: 5m</p>|
|expired_hard_bounced_recips  lifetime|<p>-</p>|`Dependent item`|expired_hard_bounced_recips<p>Update: 0</p>|
|delivered_recips per 1m|<p>-</p>|`Dependent item`|delivered_recips_last_1_min<p>Update: 0</p>|
|filter_hard_bounced_recips  lifetime|<p>-</p>|`Dependent item`|filter_hard_bounced_recips<p>Update: 0</p>|
|5xx_hard_bounced_recips lifetime|<p>-</p>|`Dependent item`|5xx_hard_bounced_recips<p>Update: 0</p>|
|global_unsub_hits  lifetime|<p>-</p>|`Dependent item`|global_unsub_hits<p>Update: 0</p>|
|gen_bounce_recips  lifetime|<p>-</p>|`Dependent item`|gen_bounce_recips<p>Update: 0</p>|
|inj_recips  lifetime|<p>-</p>|`Dependent item`|inj_recips<p>Update: 0</p>|
|conn_in|<p>-</p>|`Dependent item`|conn_in<p>Update: 0</p>|
|dropped_msgs  lifetime|<p>-</p>|`Dependent item`|dropped_msgs<p>Update: 0</p>|
|inj_msgs  lifetime|<p>-</p>|`Dependent item`|inj_msgs<p>Update: 0</p>|
|dns_hard_bounced_recips  lifetime|<p>-</p>|`Dependent item`|dns_hard_bounced_recips<p>Update: 0</p>|
|inj_msgs per 1m|<p>-</p>|`Dependent item`|inj_msgs_last_1_min<p>Update: 0</p>|
|active_recips|<p>-</p>|`Dependent item`|active_recips<p>Update: 0</p>|
|msgs_in_policy_virus_outbreak_quarantine|<p>-</p>|`Dependent item`|msgs_in_policy_virus_outbreak_quarantine<p>Update: 0</p>|
|kbytes_in_policy_virus_outbreak_quarantine|<p>-</p>|`Dependent item`|kbytes_in_policy_virus_outbreak_quarantine<p>Update: 0</p>|
|completed_recips lifetime|<p>-</p>|`Dependent item`|completed_recips<p>Update: 0</p>|
|hard_bounced_recips per 1m|<p>-</p>|`Dependent item`|hard_bounced_recips_last_1_min<p>Update: 0</p>|
|soft_bounced_evts  lifetime|<p>-</p>|`Dependent item`|soft_bounced_evts<p>Update: 0</p>|
|deleted_recips  lifetime|<p>-</p>|`Dependent item`|deleted_recips<p>Update: 0</p>|
|completed_recips per 1m|<p>-</p>|`Dependent item`|completed_recips_last_1_min<p>Update: 0</p>|
|other_hard_bounced_recips  lifetime|<p>-</p>|`Dependent item`|other_hard_bounced_recips<p>Update: 0</p>|
|inj_recips per 1m|<p>-</p>|`Dependent item`|inj_recips_last_1_min<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

