# Event User Log

## Overview

Check windows event log:


1. Create user account
2. User account on
3. User account off
4. User account password reset
5. Delete user account
6. Unlocked user account


+ changed domain policy and cleaned security log



## Author

Andrew Herasym

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Changed domain policy|<p>Змінена політика домену</p>|`Zabbix agent (active)`|eventlog[Security,,,,4739,,]<p>Update: 300</p>|
|Cleaned Security Log|<p>Очищений журнал безпеки</p>|`Zabbix agent (active)`|eventlog[Security,,,,1102,,]<p>Update: 300</p>|
|Unlocked User|<p>Обліковий запис користувача розблоковано</p>|`Zabbix agent (active)`|eventlog[Security,,,,4767,,]<p>Update: 300</p>|
|User On|<p>Обліковий запис користувача включено</p>|`Zabbix agent (active)`|eventlog[Security,,,,4722,,]<p>Update: 300</p>|
|User Off|<p>Обліковий запис користувача виключено</p>|`Zabbix agent (active)`|eventlog[Security,,,,4725,,]<p>Update: 300</p>|
|Create User|<p>Обліковий запис користувача створено</p>|`Zabbix agent (active)`|eventlog[Security,,,,4720,,]<p>Update: 300</p>|
|User Password Reset|<p>Пароль користувача скинуто</p>|`Zabbix agent (active)`|eventlog[Security,,,,4724,,]<p>Update: 300</p>|
|Delete User|<p>Обліковий запис користувача видалено</p>|`Zabbix agent (active)`|eventlog[Security,,,,4726,,]<p>Update: 300</p>|


## Triggers

There are no triggers in this template.

