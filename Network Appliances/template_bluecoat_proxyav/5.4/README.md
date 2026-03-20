# Template App BlueCoat AV

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|AV engine version|<p>AV engine version.</p>|`SNMP agent`|avEngineVersion<p>Update: 3600</p>|
|Percent of CPU in use|<p>Percent of CPU in use.</p>|`SNMP agent`|deviceUsagePercentCPU<p>Update: 60</p>|
|Number of slow ICAP connections|<p>The number of ICAP connections that are considered 'slow' - receiving data for more than the configured time threshold (by default 60 seconds).</p>|`SNMP agent`|avSlowICAPConnections<p>Update: 60</p>|
|Percent of Interface 0 in use|<p>Percent of Interface 0 in use.</p>|`SNMP agent`|deviceUsagePercentInterface0<p>Update: 60</p>|
|Number of files scanned using all protocols|<p>Sum of number of files scanned using all protocols. An archive containing multiple files will count as one file.</p>|`SNMP agent`|avFilesScanned<p>Update: 60</p>|
|Number of files scanned using the Secure ICAP protocol|<p>Number of files scanned using the Secure ICAP protocol. An archive containing multiple files will count as one file.</p>|`SNMP agent`|avSecureICAPFilesScanned<p>Update: 60</p>|
|Currently installed ProxyAV firmware version|<p>Currently installed ProxyAV firmware version.</p>|`SNMP agent`|avInstalledFirmwareVersion<p>Update: 3600</p>|
|Release date and time of the av pattern|<p>Release date and time of the av pattern.</p>|`SNMP agent`|avPatternDateTime<p>Update: 3600</p>|
|AV license days remaining|<p>AV license days remaining.</p>|`SNMP agent`|avLicenseDaysRemaining<p>Update: 3600</p>|
|AV pattern version|<p>AV pattern version.</p>|`SNMP agent`|avPatternVersion<p>Update: 3600</p>|
|Percent of memory in use|<p>Percent of memory in use.</p>|`SNMP agent`|deviceUsagePercentMemory<p>Update: 60</p>|
|Number of infected files detected using the ICAP protocol|<p>Number of infected files detected using the ICAP protocol. A file containing multiple infections will count as one infected file.</p>|`SNMP agent`|avICAPVirusesDetected<p>Update: 60</p>|
|Number of infected files detected using the Secure ICAP protocol|<p>Number of infected files detected using the Secure ICAP protocol. A file containing multiple infections will count as one infected file.</p>|`SNMP agent`|avSecureICAPVirusesDetected<p>Update: 60</p>|
|Number of infected files detected using all protocols|<p>Sum of number of infected files detected using all protocols. A file containing multiple infections will count as one infected file.</p>|`SNMP agent`|avVirusesDetected<p>Update: 60</p>|
|Number of files scanned using the ICAP protocol|<p>Number of files scanned using the ICAP protocol. An archive containing multiple files will count as one file.</p>|`SNMP agent`|avICAPFilesScanned<p>Update: 60</p>|
|Version published on the automatic update location|<p>ProxyAV version published on the automatic update location.</p>|`SNMP agent`|avPublishedFirmwareVersion<p>Update: 3600</p>|


## Triggers

There are no triggers in this template.

