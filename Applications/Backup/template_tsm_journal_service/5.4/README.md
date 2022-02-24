# App TSM Journal Service

## Overview

Template for check if "TSM Journal Service" is running.


 IBM Spectrum Protect (Tivoli Storage Manager)


Note that trigger service name is: "TSM Journal Service"


 


You can also create (manual) action auto-start service in case service is down:


 


Go to Configuration → Actions


 


**Conditions:**


* Maintenance status not in maintenance
* Trigger value = PROBLEM
* Trigger name like TSM Journal Service Stopped
* 
* 


**Operations:**


* **Operation type:** Remote command
* **Commands:** NET START "TSM Journal Service"


 


*- Haim Cohen 2017 -*



## Author

Haim Cohen

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Service State - TSM Journal Service|<p>-</p>|`Zabbix agent`|service_state[TSM Journal Service]<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

