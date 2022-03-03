# Mitel MiVoice Office 250

## Description

For Mitel MiVoice Office 250 phone system, fka Mitel 5000, fka Inter-Tel. Requires access from Zabbix server to the web interface of the phone system.

## Overview

Uses HTTP agent to connect to "Administrative Web Service" on Mitel MiVoice Office 250 phone system [formerly known as Mitel 5000 and Inter-Tel Axxess].


Requires HTTP agent, Xpath pre-processing and Dependent Items features in Zabbix.


The HTTPS port for the web interface is defined in the macro {$AWS.PORT}. Please override this if you're not using 443.


Developed and tested on Zabbix 4.2, with phone systems on 6.0, 6.1 and 6.3 software. May work with older versions.


 


Currently fetches:


* Alarm state
* Number of calls
* Flash space
* Call processing version
* Release version
* License state


Trigger for:


* Alarm state
* Flash space


## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$AWS.PORT}|<p>-</p>|`443`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Release version|<p>MiVO 250 Release version</p>|`Dependent item`|mitel.mivo250.relver<p>Update: 0</p>|
|MiVO 250 Status blob|<p>-</p>|`HTTP agent`|mitel.mivo250.status<p>Update: 180s</p>|
|Active calls|<p>MiVO 250 Active calls</p>|`Dependent item`|mitel.mivo250.activecalls<p>Update: 0</p>|
|Call Processing version|<p>MiVO 250 Call Processing version</p>|`Dependent item`|mitel.mivo250.cpver<p>Update: 0</p>|
|Free space on flash card|<p>MiVO 250 free space on flash in bytes</p>|`Dependent item`|mitel.mivo250.flashspace<p>Update: 0</p>|
|Percent free on flash card|<p>MiVO 250 free space on flash in bytes</p>|`Dependent item`|mitel.mivo250.flashpercfree<p>Update: 0</p>|
|License status|<p>MiVO 250 License Status</p>|`Dependent item`|mitel.mivo250.licstat<p>Update: 0</p>|
|Alarm status|<p>MiVO 250 Alarm status</p>|`Dependent item`|mitel.mivo250.alarm<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

