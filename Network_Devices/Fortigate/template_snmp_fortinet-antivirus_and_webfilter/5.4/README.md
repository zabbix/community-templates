# SNMP Fortinet  - Antivirus and WebFilter

## Description

Created by Samuel Martins (04-16-2021) https://github.com/slunart https://www.linkedin.com/in/slmartins ----------------------------------------------------------- Based on FORTINET-FORTIGATE-MIB OBJECTS { fgAvVirusDetected, fgAvVirusBlocked, fgAvHTTPVirusDetected, fgAvHTTPVirusBlocked, fgAvSMTPVirusDetected, fgAvSMTPVirusBlocked, fgAvPOP3VirusDetected, fgAvPOP3VirusBlocked, fgAvIMAPVirusDetected, fgAvIMAPVirusBlocked, fgAvFTPVirusDetected, fgAvFTPVirusBlocked, fgAvIMVirusDetected, fgAvIMVirusBlocked, fgAvNNTPVirusDetected, fgAvNNTPVirusBlocked, fgAvOversizedDetected, fgAvOversizedBlocked } FgWebfilterStatsEntry ::= SEQUENCE { fgWfHTTPBlocked Counter32, fgWfHTTPSBlocked Counter32, fgWfHTTPURLBlocked Counter32, fgWfHTTPSURLBlocked Counter32, fgWfActiveXBlocked Counter32, fgWfCookieBlocked Counter32, fgWfAppletBlocked Counter32 }

## Overview

Updated: 2021-04-19 -> Support for monitoring the WebFilter feature. 


-----------------------------------------------------------------------------------------


Template for monitoring Antivirus and Web Filter features in FORTIGATE equipment based on FORTINET-FORTIGATE-MIB.


**WEBFILTER:**


* 7 Item prototypes
* 0 Trigger prototypes


**ANTIVIRUS**:


* 18 Item prototypes
* 0 Trigger prototypes


 


Feel free to make suggestions! 



## Author

Samuel Martins

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discovery of fgWebfilter|<p>A table of Web-filter statistics per virtual domain</p>|`SNMP agent`|fgWebfilterStatsEntry<p>Update: 1h</p>|
|Discovery of fgAntivirus|<p>-</p>|`SNMP agent`|fgAvStatsEntry<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|ActiveX Downloads Blocked ID #{#SNMPINDEX}|<p>Number of ActiveX downloads blocked by Web-filter since start-up</p>|`SNMP agent`|fgWfActiveXBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Applets Blocked ID #{#SNMPINDEX}|<p>Number of Applets blocked by Web-filter since start-up</p>|`SNMP agent`|fgWfAppletBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Cookies Blocked ID #{#SNMPINDEX}|<p>Number of HTTP Cookies blocked by Web-filter since start-up</p>|`SNMP agent`|fgWfCookieBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|HTTP Sessions Blocked ID #{#SNMPINDEX}|<p>Number of HTTP sessions blocked by Web-filter since start-up</p>|`SNMP agent`|fgWfHTTPBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|HTTPS Sessions Blocked ID #{#SNMPINDEX}|<p>Number of HTTPS sessions blocked by Web-filter since start-up</p>|`SNMP agent`|fgWfHTTPSBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|HTTPS URLS Blocked ID #{#SNMPINDEX}|<p>Number of HTTPS URLs blocked by Web-filter since start-up</p>|`SNMP agent`|fgWfHTTPSURLBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|HTTP URLS Blocked ID #{#SNMPINDEX}|<p>Number of HTTP URLs blocked by Web-filter since start-up</p>|`SNMP agent`|fgWfHTTPURLBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|FTP Virus Blocked ID #{#SNMPINDEX}|<p>Number of virus transmissions over FTP blocked in the virtual domain since start-up</p>|`SNMP agent`|fgAvFTPVirusBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Oversized Blocked ID #{#SNMPINDEX}|<p>Number of over-sized file transmissions blocked in the virtual domain since start-up</p>|`SNMP agent`|fgAvOversizedBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Virus Blocked ID #{#SNMPINDEX}|<p>Number of virus transmissions blocked in the virtual domain since start-up</p>|`SNMP agent`|fgAvVirusBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|SMTP Virus Detected ID #{#SNMPINDEX}|<p>Number of virus transmissions over SMTP detected in the virtual domain since start-up</p>|`SNMP agent`|fgAvSMTPVirusDetected[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|SMTP Virus Blocked ID #{#SNMPINDEX}|<p>Number of virus transmissions over SMTP blocked in the virtual domain since start-up</p>|`SNMP agent`|fgAvSMTPVirusBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|POP3 Virus Detected ID #{#SNMPINDEX}|<p>Number of virus transmissions over POP3 detected in the virtual domain since start-up</p>|`SNMP agent`|fgAvPOP3VirusDetected[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|POP3 Virus Blocked ID #{#SNMPINDEX}|<p>Number of virus transmissions over POP3 blocked in the virtual domain since start-up</p>|`SNMP agent`|fgAvPOP3VirusBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Oversized Detected ID #{#SNMPINDEX}|<p>Number of over-sized file transmissions detected in the virtual domain since start-up</p>|`SNMP agent`|fgAvOversizedDetected[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|NNTP Virus Detected ID #{#SNMPINDEX}|<p>Number of virus transmissions over NNTP detected in the virtual domain since start-up</p>|`SNMP agent`|fgAvNNTPVirusDetected[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|FTP Virus Detected ID #{#SNMPINDEX}|<p>Number of virus transmissions over FTP detected in the virtual domain since start-up</p>|`SNMP agent`|fgAvFTPVirusDetected[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|NNTP Virus Blocked ID #{#SNMPINDEX}|<p>Number of virus transmissions over NNTP blocked in the virtual domain since start-up</p>|`SNMP agent`|fgAvNNTPVirusBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|IM Virus Detected ID #{#SNMPINDEX}|<p>Number of virus transmissions over IM protocols detected in the virtual domain since start-up</p>|`SNMP agent`|fgAvIMVirusDetected[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|IM Virus Blocked ID #{#SNMPINDEX}|<p>Number of virus transmissions over IM protocols blocked in the virtual domain since start-up</p>|`SNMP agent`|fgAvIMVirusBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|IMAP Virus Detected ID #{#SNMPINDEX}|<p>Number of virus transmissions over IMAP detected in the virtual domain since start-up</p>|`SNMP agent`|fgAvIMAPVirusDetected[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|IMAP Virus Blocked  ID #{#SNMPINDEX}|<p>Number of virus transmissions over IMAP blocked in the virtual domain since start-up</p>|`SNMP agent`|fgAvIMAPVirusBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|HTTP Virus Detected  ID #{#SNMPINDEX}|<p>Number of virus transmissions over HTTP detected in the virtual domain since start-up</p>|`SNMP agent`|fgAvHTTPVirusDetected[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|HTTP Virus Blocked ID #{#SNMPINDEX}|<p>Number of virus transmissions over HTTP blocked in the virtual domain since start-up</p>|`SNMP agent`|fgAvHTTPVirusBlocked[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|
|Virus Detected ID #{#SNMPINDEX}|<p>Number of virus transmissions detected in the virtual domain since start-up</p>|`SNMP agent`|fgAvVirusDetected[{#SNMPINDEX}]<p>Update: 1m</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

