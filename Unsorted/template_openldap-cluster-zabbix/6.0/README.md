# LDAP

## Overview

Monitoring OpenLDAP Cluster with Zabbix 3.4. It's a script that checks LDAP Provider - Consumer status, and sync status between them.


You should:


1. Put **ldap\_check\_status.sh** in LDAP **Consumer** and make it executable for zabbix user.
2. Put **openldap\_cluster\_status.conf** in /etc/zabbix/zabbix\_agentd.conf.d directory in **LDAP Consumer**.
3. Import **zabbix\_openldap\_template.xml**.
4. Import **zabbix\_openldap\_value\_mapping.xml**.
5. Modify the item parameter and replace with LDAP Provider FQDN or IP.


**[https://github.com/MrCirca/OpenLDAP-Cluster-Zabbix](https://github.com/MrCirca/OpenLDAP-Cluster-Zabbix "Download Project")**



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$BASE_DN}|<p>-</p>|`"dc=modulus,dc=gr"`|Text macro|
|{$LDAP_HOST}|<p>-</p>|`172.17.172.51`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|LDAP Cluster status|<p>-</p>|`Zabbix agent`|ldap.clusterstatus[172.17.172.51]<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

