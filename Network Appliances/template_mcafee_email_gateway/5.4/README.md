# SNMP McAfee Email Gateway (SMTP - POP3)

## Description

Created by Samuel Martins 2019-04-24 Version 1.00 https://github.com/slunart/Zabbix-Templates https://www.linkedin.com/in/slmartins/

## Overview

Template SNMP McAfee Email Gateway  
  
I used the MCAFEE-SCM-MIB to create this template and I tested with the version 5.5, a very old version, but I think it will works well with the others versions. This appliance is now at end-of-life status, you can check this here: https://www.mcafee.com/enterprise/pt-br/support/email-security-end-of-life.html  
  
This template supply the security monitor for SMTP and POP3.  
  
It also available at https://github.com/slunart/Zabbix-Templates/tree/master/McAfeeEmailGateway  
  




## Author

Samuel Martins

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of messages in the Logging Queue|<p>Number of messages in the logging queue</p>|`SNMP agent`|deferred-logging-mails<p>Update: 1m</p>|
|SMTP Total Virus Detected|<p>Total number of viruses detected</p>|`SNMP agent`|smtp-virus-detected<p>Update: 1m</p>|
|Total of POP3 E-mail Messages|<p>Total number of e-mail messages</p>|`SNMP agent`|pop3-messages<p>Update: 1m</p>|
|Number of Content Quarantined SMTP E-mail|<p>Number of Content Quarantined E-mail</p>|`SNMP agent`|smtp-quarantined-content<p>Update: 1m</p>|
|Number of POP3 PUPs from inside|<p>Number of potentially unwanted programs detected from inside</p>|`SNMP agent`|pop3-from-inside-pups-detected<p>Update: 1m</p>|
|CPU Overall Usage|<p>Shows the overall usage of one or more processors</p>|`SNMP agent`|cpu-busy<p>Update: 1m</p>|
|Number of Messages in the Quarantine Queue|<p>Number of messages in the quarantine queue</p>|`SNMP agent`|deferred-quarantine-mails<p>Update: 1m</p>|
|Total of POP3 Packers Quarantined|<p>Total number of packers quarantined</p>|`SNMP agent`|pop3-quarantined-packers<p>Update: 1m</p>|
|Total of SMTP Emails Rejected After SenderID Check|<p>Total number of emails rejected after SenderID check</p>|`SNMP agent`|smtp-spfpra-rejected<p>Update: 1m</p>|
|Number of SMTP Packers Detected from Outside|<p>Number of packers detected from outside</p>|`SNMP agent`|smtp-from-outside-packers-detected<p>Update: 1m</p>|
|Total of POP3 Packers Detected|<p>Total number of packers detected</p>|`SNMP agent`|pop3-packers-detected<p>Update: 1m</p>|
|Number of SMTP Packers Detected From Inside|<p>Number of packers detected from inside</p>|`SNMP agent`|smtp-from-inside-packers-detected<p>Update: 1m</p>|
|POP3 Virus Detected|<p>Total number of viruses detected</p>|`SNMP agent`|pop3-virus-detected<p>Update: 1m</p>|
|Number of SMTP PUPs Detected From Outside|<p>Number of potentially unwanted programs detected from outside</p>|`SNMP agent`|smtp-from-outside-pups-detected<p>Update: 1m</p>|
|Number of POP3 Packers Setected from Inside|<p>Number of packers detected from inside</p>|`SNMP agent`|pop3-from-inside-packers-detected<p>Update: 1m</p>|
|Number of POP3 E-mail Messages from Inside|<p>Number of e-mail messages from inside</p>|`SNMP agent`|pop3-from-inside-messages<p>Update: 1m</p>|
|Total of PUPs from POP3 detected|<p>Total number of potentially unwanted programs detected</p>|`SNMP agent`|pop3-pups-detected<p>Update: 1m</p>|
|Load Average|<p>Shows the load average for the appliance</p>|`SNMP agent`|loadaverage<p>Update: 1m</p>|
|Total Data Transferred Through a SMTP Proxy|<p>Total data transferred through a proxy</p>|`SNMP agent`|smtp-TotalBytes<p>Update: 1m</p>|
|Total of SMTP Emails Rejected After Sender Policy Framework Check|<p>Total number of emails rejected after Sender Policy Framework check</p>|`SNMP agent`|smtp-spf-rejected<p>Update: 1m</p>|
|Number of Viruses Detected From SMTP Inside|<p>Number of viruses detected from inside</p>|`SNMP agent`|smtp-from-inside-virus-detected<p>Update: 1m</p>|
|Number of Spam Quarantined SMTP E-mail|<p>Number of Spam Quarantined E-mail</p>|`SNMP agent`|smtp-quarantined-spam<p>Update: 1m</p>|
|SMTP Blocked Connections|<p>Connections that have been blocked</p>|`SNMP agent`|smtp-BlockedConnections<p>Update: 1m</p>|
|Total of SMTP Emails Rejected due to Reputation Service Lookup|<p>Total number of emails rejected due to reputation service lookup</p>|`SNMP agent`|smtp-ptin-rejected<p>Update: 1m</p>|
|POP3 Total Bytes|<p>Total data transferred through a proxy</p>|`SNMP agent`|pop3-TotalBytes<p>Update: 1m</p>|
|Memory Usage|<p>Shows the processor memory usage</p>|`SNMP agent`|mem-used<p>Update: 1m</p>|
|Memory Free|<p>Shows the processor memory free</p>|`SNMP agent`|mem-free<p>Update: 1m</p>|
|SNMP Agent Version|<p>The version of the SNMP Agent module</p>|`SNMP agent`|agent-scm-module-version<p>Update: 1h</p>|
|Number of SMTP Directory Harvests Blocked|<p>Number of directory harvests blocked</p>|`SNMP agent`|smtp-directory-harvest-blocked<p>Update: 1m</p>|
|Number of SMTP PUPs detected from inside|<p>Number of potentially unwanted programs detected from inside</p>|`SNMP agent`|smtp-from-inside-pups-detected<p>Update: 1m</p>|
|Total of Emails Delivered Successfully|<p>Total number of emails delivered successfully</p>|`SNMP agent`|smtp-deliver-ok<p>Update: 1m</p>|
|Total of SMTP PUPs quarantined|<p>Total number of potentially unwanted programs quarantined</p>|`SNMP agent`|smtp-quarantined-pups<p>Update: 1m</p>|
|Number of POP3 E-mail Messages from Outside|<p>Number of e-mail messages from outside</p>|`SNMP agent`|pop3-from-outside-messages<p>Update: 1m</p>|
|Memory Swap Rate|<p>Shows the processor memory swap rate</p>|`SNMP agent`|swaprate<p>Update: 1m</p>|
|Total of SMTP E-mail Messages|<p>Total number of e-mail messages</p>|`SNMP agent`|smtp-messages<p>Update: 1m</p>|
|Number of SMTP Phish Blocked by SpamKiller|<p>Number of phish blocked by SpamKiller</p>|`SNMP agent`|smtp-phish-blocked<p>Update: 1m</p>|
|Number of SMTP Content-filtering Based Blocks|<p>Number of content-filtering based blocks</p>|`SNMP agent`|smtp-content-filter-blocked<p>Update: 1m</p>|
|Number of SMTP MIME Formats Blocked|<p>Number of MIME formats blocked</p>|`SNMP agent`|smtp-mime-format-blocked<p>Update: 1m</p>|
|Total of Rejected SMTP Mails After DKIM Signature Verification|<p>Total number of rejected mails after DKIM signature verification</p>|`SNMP agent`|smtp-dkim-rejected<p>Update: 1m</p>|
|Total of Emails Rejected After RBL Check|<p>Total number of emails rejected after RBL check</p>|`SNMP agent`|smtp-rbl-rejected<p>Update: 1m</p>|
|Total number of POP3 PUPs quarantined|<p>Total number of potentially unwanted programs quarantined</p>|`SNMP agent`|pop3-quarantined-pups<p>Update: 1m</p>|
|Number of SMTP Packers Blocked|<p>Number of packers blocked</p>|`SNMP agent`|smtp-packer-blocked<p>Update: 1m</p>|
|Number of SMTP PUPs blocked|<p>Number of potentially unwanted program blocked</p>|`SNMP agent`|smtp-pup-blocked<p>Update: 1m</p>|
|Total of Packers From SMTP Quarantined|<p>Total number of packers quarantined</p>|`SNMP agent`|smtp-quarantined-packers<p>Update: 1m</p>|
|Number of Viruses Detected From SMTP Outside|<p>Number of viruses detected from outside</p>|`SNMP agent`|smtp-from-outside-virus-detected<p>Update: 1m</p>|
|Number of SMTP Deferred E-mail|<p>Number of deferred E-mail</p>|`SNMP agent`|smtp-deferred<p>Update: 1m</p>|
|Number of SMTP Virus Blocked|<p>Number of viruses blocked</p>|`SNMP agent`|smtp-virus-blocked<p>Update: 1m</p>|
|Number of SMTP Encrypted Contents Blocked|<p>Number of encrypted contents blocked</p>|`SNMP agent`|smtp-encrypted-blocked<p>Update: 1m</p>|
|POP3 Total of Connections|<p>Total connections used</p>|`SNMP agent`|pop3-TotalConnections<p>Update: 1m</p>|
|Number of Virus Quarantined From SMTP E-mail|<p>Number of Virus Quarantined E-mail</p>|`SNMP agent`|smtp-quarantined<p>Update: 1m</p>|
|Number of Messages in the MQM Queue|<p>Number of messages in the MQM queue</p>|`SNMP agent`|deferred-tqmd-mails<p>Update: 1m</p>|
|Number of SMTP Compliancy Based Blocks|<p>Number of compliancy based blocks</p>|`SNMP agent`|smtp-compliancy-blocked<p>Update: 1m</p>|
|Number of SMTP Format Based Blocks|<p>Number of format based blocks</p>|`SNMP agent`|smtp-format-blocked<p>Update: 1m</p>|
|Number of POP3 PUPs Detected from Outside|<p>Number of potentially unwanted programs detected from outside</p>|`SNMP agent`|pop3-from-outside-pups-detected<p>Update: 1m</p>|
|SMTP Total Connections|<p>Total connections used</p>|`SNMP agent`|smtp-TotalConnections<p>Update: 1m</p>|
|Number of POP3 Viruses Detected from Outside|<p>Number of viruses detected from outside</p>|`SNMP agent`|pop3-from-outside-virus-detected<p>Update: 1m</p>|
|Total of SMTP Packers Detected|<p>Total number of packers detected</p>|`SNMP agent`|smtp-packers-detected<p>Update: 1m</p>|
|Number of SMTP Signed Messages Blocked|<p>Number of signed messages blocked</p>|`SNMP agent`|smtp-signed-message-blocked<p>Update: 1m</p>|
|Number of POP3 Packers Detected from Outside|<p>Number of packers detected from outside</p>|`SNMP agent`|pop3-from-outside-packers-detected<p>Update: 1m</p>|
|Total of Recipients Rejected After Permit SMTP Recipient Check or LDAP Lookup|<p>Total number of recipients rejected after permit recipient check or LDAP lookup</p>|`SNMP agent`|smtp-permit-rcpt-rejected<p>Update: 1m</p>|
|Total of SMTP Emails Rejected For Exceeding The Cumulative Threshold Score|<p>Total number of emails rejected for exceeding the cumulative threshold score (sum of all cumulative rejects)</p>|`SNMP agent`|smtp-threshold-exceeded-rejected<p>Update: 1m</p>|
|Total of SMTP Emails Rejected Based on The Denied Sender List|<p>Total number of emails rejected based on the denied sender list</p>|`SNMP agent`|smtp-deny-rejected<p>Update: 1m</p>|
|SMTP State|<p>The health of the SMTP protocol</p>|`SNMP agent`|smtp-state<p>Update: 1m</p>|
|Total of SMTP PUPs Detected|<p>Total number of potentially unwanted programs detected</p>|`SNMP agent`|smtp-pups-detected<p>Update: 1m</p>|
|Hostname|<p>The hostname of the SNMP Agent module</p>|`SNMP agent`|agent-hostname<p>Update: 1h</p>|
|Number of Messages in the Deferred Queue|<p>Number of messages in the deferred queue</p>|`SNMP agent`|deferred-smtp-mails<p>Update: 1m</p>|
|POP3 State|<p>The health of the POP3 protocol</p>|`SNMP agent`|pop3-state<p>Update: 1m</p>|
|Number of POP3 Viruses Detected from Inside|<p>Number of viruses detected from inside</p>|`SNMP agent`|pop3-from-inside-virus-detected<p>Update: 1m</p>|
|Number of SMTP Spam Blocked by SpamKiller|<p>Number of spam blocked by SpamKiller</p>|`SNMP agent`|smtp-spam-blocked<p>Update: 1m</p>|
|POP3 Blocked Connections|<p>Connections that have been blocked</p>|`SNMP agent`|pop3-BlockedConnections<p>Update: 1m</p>|
|Number of SMTP Corrupted Contents Blocked|<p>Number of corrupted contents blocked</p>|`SNMP agent`|smtp-corrupt-content-blocked<p>Update: 1m</p>|
|Number of SMTP Mails Blocked After Sender Authentication Check|<p>Number of mails blocked after sender authentication check</p>|`SNMP agent`|smtp-sender-auth-blocked<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

