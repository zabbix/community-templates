# AD DS Monitoring and Attack Detection

## Overview

**Template based on MS document "Best Practices for Securing Active Directory"**  
  
Items & Triggers


A monitored security event pattern has occurred.


A replay attack was detected. May be a harmless false positive due to misconfiguration error.


System audit policy was changed.


SID History was added to an account.


An attempt to add SID History to an account failed.


An attempt was made to set the Directory Services Restore Mode.


Role separation enabled:


Special groups have been assigned to a new logon.


A security setting was updated on the OCSP Responder Service


Possible denial-of-service (DoS) attack


The audit log was cleared


Administrator recovered system from CrashOnAuditFail.


Users who are not administrators will now be allowed to log on.


Some auditable activity might not have been recorded.


SIDs were filtered.


Backup of data protection master key was attempted.


Recovery of data protection master key was attempted.


A new trust was created to a domain.


Kerberos policy was changed.


Encrypted data recovery policy was changed.


The audit policy (SACL) on an object was changed.


Trusted domain information was modified.


An attempt was made to reset an account’s password.



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Windows Security (ID1102)|<p>The audit log was cleared.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^1102$]<p>Update: 5m</p>|
|Windows Security (ID4675)|<p>SIDs were filtered.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4675$]<p>Update: 5m</p>|
|Windows Security (ID4649)|<p>A replay attack was detected. May be a harmless false positive due to misconfiguration error.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4649$]<p>Update: 5m</p>|
|Windows Security (ID4692)|<p>Backup of data protection master key was attempted.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4692$]<p>Update: 5m</p>|
|Windows Security (ID4794)|<p>An attempt was made to set the Directory Services Restore Mode.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4794$]<p>Update: 5m</p>|
|Windows Security (ID4716)|<p>Trusted domain information was modified.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4716$]<p>Update: 5m</p>|
|Windows Security (ID4706)|<p>A new trust was created to a domain.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4706$]<p>Update: 5m</p>|
|Windows Security (ID4618)|<p>A monitored security event pattern has occurred.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4618$]<p>Update: 5m</p>|
|Windows Security (ID4765)|<p>SID History was added to an account.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4765$]<p>Update: 5m</p>|
|Windows Security (ID4897)|<p>Role separation enabled.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4897$]<p>Update: 5m</p>|
|Windows Security (ID5124)|<p>A security setting was updated on the OCSP Responder Service.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^5124$]<p>Update: 5m</p>|
|Windows Security (ID4719)|<p>System audit policy was changed.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4719$]<p>Update: 5m</p>|
|Windows Security (ID4693)|<p>Recovery of data protection master key was attempted.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4693$]<p>Update: 5m</p>|
|Windows Security (ID4714)|<p>Encrypted data recovery policy was changed.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4714$]<p>Update: 5m</p>|
|Windows Security (ID4713)|<p>Kerberos policy was changed.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4713$]<p>Update: 5m</p>|
|Windows Security (ID4715)|<p>The audit policy (SACL) on an object was changed.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4715$]<p>Update: 5m</p>|
|Windows Security (ID4621)|<p>Administrator recovered system from CrashOnAuditFail. Users who are not administrators will now be allowed to log on. Some auditable activity might not have been recorded.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4621$]<p>Update: 5m</p>|
|Windows Security (ID4964)|<p>Special groups have been assigned to a new logon.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4964$]<p>Update: 5m</p>|
|Windows Security (ID4766)|<p>An attempt to add SID History to an account failed.</p>|`Zabbix agent (active)`|eventlog[Security,,,,^4766$]<p>Update: 5m</p>|


## Triggers

There are no triggers in this template.

