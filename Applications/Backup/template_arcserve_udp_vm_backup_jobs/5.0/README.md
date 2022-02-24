# Arcserve UDP VM Backup Check

## Overview

**Zabbix-Template Arcserve UDP VM Backups**


This template checks out-of-the-box only VM Backups from Arcserve UDP. This script only counts the number of successful or unsuccessful backup jobs and throws a trigger if necessary.


Installation steps für Arcserve UDP VM Backup checks:


1. Copy the script file "Arcserve\_UDP\_VMCount.ps1" to your Zabbix Agent Script folder on the Arcserve UDP Host.
2. Modify script parameter if necessary (protocol, port, JobID)
3. Test the script manually on the Arcserve UDP Host:  
`.\Arcserve_UDP_VMCount.ps1    JobSuccessCount`
4. For debugging of errors you can enable "$Debug=$True" in the script..
5. Check the script for correct results of the VM backup jobs.
6. Add the UserParameter to the zabbix\_agentd.conf:  
UserParameter=custom.arcserveudpvm[*],powershell.exe -NoProfile -ExecutionPolicy Bypass -file "C:\Program Files\Zabbix Agent\Scripts\Arcserve\_UDP\_VMCount.ps1" $1 $2 $3 $4 $5
7. Import des Zabbix Template "Template\_Arcserve UDP VM Backup Check.xml" to the Zabbix Server.
8. Assign the template to the Zabbix host for ARcserve UDP.
9. Modify the macro "{$ARCSERVE\_DOMAIN}", "{$ARCSERVE\_USER}" and "{$ARCSERVE\_PASS} with the read only user login for Arcserve UDP.
10. Check the latest value of application "ArcserveUDP Jobs".


## Author

R.P.Wimmer

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$ARCSERVE_DOMAIN}|<p>-</p>|``|Text macro|
|{$ARCSERVE_HOST}|<p>-</p>|``|Text macro|
|{$ARCSERVE_PASS}|<p>-</p>|``|Text macro|
|{$ARCSERVE_USER}|<p>-</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Arcserve UDP JobInProgressCount|<p>Arcserve UDP JobInProgressCount from VM Backups</p>|`Zabbix agent`|custom.arcserveudpvm[{$ARCSERVE_DOMAIN},{$ARCSERVE_USER},{$ARCSERVE_PASS},"JobInProgressCount",{$ARCSERVE_HOST}]<p>Update: 5m</p>|
|Arcserve UDP JobMissedCount|<p>Arcserve UDP JobMissedCount from VM Backups</p>|`Zabbix agent`|custom.arcserveudpvm[{$ARCSERVE_DOMAIN},{$ARCSERVE_USER},{$ARCSERVE_PASS},"JobMissedCount",{$ARCSERVE_HOST}]<p>Update: 5m</p>|
|Arcserve UDP JobWaitingCount|<p>Arcserve UDP JobWaitingCount from VM Backups</p>|`Zabbix agent`|custom.arcserveudpvm[{$ARCSERVE_DOMAIN},{$ARCSERVE_USER},{$ARCSERVE_PASS},"JobWaitingCount",{$ARCSERVE_HOST}]<p>Update: 5m</p>|
|ArcserveBackup: Arcserve UDP-RPS-Datenspeicherdienst|<p>-</p>|`Zabbix agent`|service_state[CASDatastoreSvc]<p>Update: 2m</p>|
|Arcserve UDP JobFailedCount|<p>Arcserve UDP JobFailedCount from VM Backups</p>|`Zabbix agent`|custom.arcserveudpvm[{$ARCSERVE_DOMAIN},{$ARCSERVE_USER},{$ARCSERVE_PASS},"JobFailedCount",{$ARCSERVE_HOST}]<p>Update: 5m</p>|
|ArcserveBackup: Arcserve UDP-Verwaltungsport-Freigabedienst|<p>-</p>|`Zabbix agent`|service_state[ArcserveUDPPS]<p>Update: 2m</p>|
|ArcserveBackup: Arcserve UDP-Aktualisierungsdienst|<p>-</p>|`Zabbix agent`|service_state[CAARCUpdateSvc]<p>Update: 2m</p>|
|ArcserveBackup: Arcserve UDP-RPS-Port-Freigabedienst|<p>-</p>|`Zabbix agent`|service_state[CASARPSWebSvc]<p>Update: 2m</p>|
|ArcserveBackup: Arcserve UDP-Agent-Dienst|<p>-</p>|`Zabbix agent`|service_state[CASAD2DWebSvc]<p>Update: 2m</p>|
|Arcserve UDP JobCancelledCount|<p>Arcserve UDP JobCancelledCount from VM Backups</p>|`Zabbix agent`|custom.arcserveudpvm[{$ARCSERVE_DOMAIN},{$ARCSERVE_USER},{$ARCSERVE_PASS},"JobCancelledCount",{$ARCSERVE_HOST}]<p>Update: 5m</p>|
|Arcserve UDP JobIncompleteCount|<p>Arcserve UDP JobIncompleteCount from VM Backups</p>|`Zabbix agent`|custom.arcserveudpvm[{$ARCSERVE_DOMAIN},{$ARCSERVE_USER},{$ARCSERVE_PASS},"JobIncompleteCount",{$ARCSERVE_HOST}]<p>Update: 5m</p>|
|ArcserveBackup: Arcserve Event Log Watch|<p>-</p>|`Zabbix agent`|service_state[ASLogWatch]<p>Update: 2m</p>|
|Arcserve UDP JobSuccessCount|<p>Arcserve UDP JobSuccessCount from VM Backups</p>|`Zabbix agent`|custom.arcserveudpvm[{$ARCSERVE_DOMAIN},{$ARCSERVE_USER},{$ARCSERVE_PASS},"JobSuccessCount",{$ARCSERVE_HOST}]<p>Update: 5m</p>|
|Arcserve UDP JobOtherCount|<p>Arcserve UDP JobOtherCount from VM Backups</p>|`Zabbix agent`|custom.arcserveudpvm[{$ARCSERVE_DOMAIN},{$ARCSERVE_USER},{$ARCSERVE_PASS},"JobOtherCount",{$ARCSERVE_HOST}]<p>Update: 5m</p>|
|ArcserveBackup: Arcserve UDP-Verwaltungsdienst|<p>-</p>|`Zabbix agent`|service_state[CAARCAppSvc]<p>Update: 2m</p>|
|Arcserve UDP JobIdleCount|<p>Arcserve UDP JobIdleCount from VM Backups</p>|`Zabbix agent`|custom.arcserveudpvm[{$ARCSERVE_DOMAIN},{$ARCSERVE_USER},{$ARCSERVE_PASS},"JobIdleCount",{$ARCSERVE_HOST}]<p>Update: 5m</p>|
|ArcserveBackup: Arcserve UDP-Identitätsdienst|<p>-</p>|`Zabbix agent`|service_state[ArcserveUDPIS]<p>Update: 2m</p>|


## Triggers

There are no triggers in this template.

