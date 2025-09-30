# LibraESVA Mail Gateway by SNMP

## Author
Pietro Mingo

## Macros used
|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$LIBRAESVA.QUEUE.HIGH}|High threshold for mail queue|`100`|Text macro|
|{$LIBRAESVA.QUEUE.WARN}|Warning threshold for mail queue|`50`|Text macro|
|{$SNMP_COMMUNITY}|SNMP community string|`public`|Text macro|

## Template links
There are no template links in this template.

## Discovery rules
There are no discovery rules in this template.

## Items collected
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Cluster Status|Cluster status (0=up, 2=down, -1=unavailable)|`SNMP agent`|libraesva.cluster.status<p>Update: 60s</p>|
|License Accounting: Mailbox|Mailbox licenses|`SNMP agent`|libraesva.license.accounting.mailbox<p>Update: 300s</p>|
|License Accounting: Total|Total licenses|`SNMP agent`|libraesva.license.accounting.total<p>Update: 300s</p>|
|License: Count|License count|`SNMP agent`|libraesva.license.count<p>Update: 3600s</p>|
|License: Expires|License expiration date|`SNMP agent`|libraesva.license.expires<p>Update: 3600s</p>|
|License Accounting: Overuse|Licenses in overuse|`SNMP agent`|libraesva.license.overuse<p>Update: 300s</p>|
|License: Registered To|License registered to|`SNMP agent`|libraesva.license.registered_to<p>Update: 3600s</p>|
|License: Type|License type|`SNMP agent`|libraesva.license.type<p>Update: 3600s</p>|
|Mail Flow: Bounced|Number of emails bounced|`SNMP agent`|libraesva.mail.bounced<p>Update: 60s</p>|
|Mail Flow: Infected|Number of infected emails|`SNMP agent`|libraesva.mail.infected<p>Update: 60s</p>|
|Mail Flow: Received|Number of emails received|`SNMP agent`|libraesva.mail.received<p>Update: 60s</p>|
|Mail Flow: Rejected|Number of emails rejected|`SNMP agent`|libraesva.mail.rejected<p>Update: 60s</p>|
|Mail Flow: Sent|Number of emails sent|`SNMP agent`|libraesva.mail.sent<p>Update: 60s</p>|
|Mail Flow: Spam|Number of emails classified as spam|`SNMP agent`|libraesva.mail.spam<p>Update: 60s</p>|
|Mail Queue: Incoming|Emails in incoming queue|`SNMP agent`|libraesva.queue.incoming<p>Update: 60s</p>|
|Mail Queue: Outgoing|Emails in outgoing queue|`SNMP agent`|libraesva.queue.outgoing<p>Update: 60s</p>|
|Mail Queue: Total|Total emails in queue|`SNMP agent`|libraesva.queue.total<p>Update: 60s</p>|

## Triggers
|Name|Severity|Expression|Description|
|----|--------|----------|-----------|
|LibraESVA Cluster is down|HIGH|`last(/LibraESVA Mail Gateway/libraesva.cluster.status)<>0`|LibraESVA cluster status is not up|
|LibraESVA License in overuse|WARNING|`last(/LibraESVA Mail Gateway/libraesva.license.overuse)>0`|LibraESVA license is in overuse state|
|LibraESVA Mail queue is growing|WARNING|`last(/LibraESVA Mail Gateway/libraesva.queue.total)>{$LIBRAESVA.QUEUE.WARN}`|Mail queue has more than {$LIBRAESVA.QUEUE.WARN} emails|
|LibraESVA Mail queue is high|HIGH|`last(/LibraESVA Mail Gateway/libraesva.queue.total)>{$LIBRAESVA.QUEUE.HIGH}`|Mail queue has more than {$LIBRAESVA.QUEUE.HIGH} emails|

## Graphs
|Name|Description|
|----|-----------|
|LibraESVA Mail Flow|Shows mail flow statistics (sent, received, rejected, spam, infected)|
|LibraESVA Mail Queues|Shows mail queue status (total, incoming, outgoing)|