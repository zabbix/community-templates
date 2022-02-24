# ESA-CISCO

## Description

Cisco IronPort Email and Web Security

## Overview

-- *****************************************************************  
-- ASYNCOS-MAIL-MIB  
-- Copyright (c) 2005-2011 by Cisco Systems, Inc.  
-- All rights reserved.  
-- Cisco IronPort Email and Web Security Customer Service  
-- *****************************************************************


Adicione as MIBs no servidor de monitoramento antes de executar o template nos appliances 


<https://www.cisco.com/web/ironport/tools/email/ASYNCOS-MAIL-MIB.txt>  
<https://www.cisco.com/web/ironport/tools/email/IRONPORT-SMI.txt>



## Author

Lauro de Paula

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|updateServiceName|<p>-</p>|`SNMP agent`|updateServiceName<p>Update: 1h</p>|
|keyDescription|<p>-</p>|`SNMP agent`|keyDescription<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|oldestMessageAge|<p>-- ***************************************************************** -- ASYNCOS-MAIL-MIB -- Copyright (c) 2005-2011 by Cisco Systems, Inc. -- All rights reserved. -- Cisco IronPort Email and Web Security Customer Service -- *****************************************************************</p>|`SNMP agent`|oldestMessageAge.0<p>Update: 180s</p>|
|mailTransferThreads|<p>-- ***************************************************************** -- ASYNCOS-MAIL-MIB -- Copyright (c) 2005-2011 by Cisco Systems, Inc. -- All rights reserved. -- Cisco IronPort Email and Web Security Customer Service -- *****************************************************************</p>|`SNMP agent`|mailTransferThreads.0<p>Update: 180s</p>|
|resourceConservationReason|<p>-- ***************************************************************** -- ASYNCOS-MAIL-MIB -- Copyright (c) 2005-2011 by Cisco Systems, Inc. -- All rights reserved. -- Cisco IronPort Email and Web Security Customer Service -- *****************************************************************</p>|`SNMP agent`|resourceConservationReason.0<p>Update: 180s</p>|
|perCentDiskIOUtilization|<p>-- ***************************************************************** -- ASYNCOS-MAIL-MIB -- Copyright (c) 2005-2011 by Cisco Systems, Inc. -- All rights reserved. -- Cisco IronPort Email and Web Security Customer Service -- *****************************************************************</p>|`SNMP agent`|perCentDiskIOUtilization.0<p>Update: 45s</p>|
|queueAvailabilityStatus|<p>-- ***************************************************************** -- ASYNCOS-MAIL-MIB -- Copyright (c) 2005-2011 by Cisco Systems, Inc. -- All rights reserved. -- Cisco IronPort Email and Web Security Customer Service -- *****************************************************************</p>|`SNMP agent`|queueAvailabilityStatus.0<p>Update: 180s</p>|
|perCentMemoryUtilization|<p>-- ***************************************************************** -- ASYNCOS-MAIL-MIB -- Copyright (c) 2005-2011 by Cisco Systems, Inc. -- All rights reserved. -- Cisco IronPort Email and Web Security Customer Service -- *****************************************************************</p>|`SNMP agent`|perCentMemoryUtilization.0<p>Update: 45s</p>|
|memoryAvailabilityStatus|<p>-- ***************************************************************** -- ASYNCOS-MAIL-MIB -- Copyright (c) 2005-2011 by Cisco Systems, Inc. -- All rights reserved. -- Cisco IronPort Email and Web Security Customer Service -- *****************************************************************</p>|`SNMP agent`|memoryAvailabilityStatus.0<p>Update: 180s</p>|
|perCentCPUUtilization|<p>-- ***************************************************************** -- ASYNCOS-MAIL-MIB -- Copyright (c) 2005-2011 by Cisco Systems, Inc. -- All rights reserved. -- Cisco IronPort Email and Web Security Customer Service -- *****************************************************************</p>|`SNMP agent`|perCentCPUUtilization.0<p>Update: 45s</p>|
|openFilesOrSockets|<p>-- ***************************************************************** -- ASYNCOS-MAIL-MIB -- Copyright (c) 2005-2011 by Cisco Systems, Inc. -- All rights reserved. -- Cisco IronPort Email and Web Security Customer Service -- *****************************************************************</p>|`SNMP agent`|openFilesOrSockets.0<p>Update: 180s</p>|
|outstandingDNSRequests|<p>-- ***************************************************************** -- ASYNCOS-MAIL-MIB -- Copyright (c) 2005-2011 by Cisco Systems, Inc. -- All rights reserved. -- Cisco IronPort Email and Web Security Customer Service -- *****************************************************************</p>|`SNMP agent`|outstandingDNSRequests.0<p>Update: 180s</p>|
|pendingDNSRequests|<p>-- ***************************************************************** -- ASYNCOS-MAIL-MIB -- Copyright (c) 2005-2011 by Cisco Systems, Inc. -- All rights reserved. -- Cisco IronPort Email and Web Security Customer Service -- *****************************************************************</p>|`SNMP agent`|pendingDNSRequests.0<p>Update: 180s</p>|
|asyncOSMailObjects|<p>-- ***************************************************************** -- ASYNCOS-MAIL-MIB -- Copyright (c) 2005-2011 by Cisco Systems, Inc. -- All rights reserved. -- Cisco IronPort Email and Web Security Customer Service -- *****************************************************************</p>|`SNMP agent`|asyncOSMailObjects.27.0<p>Update: 180s</p>|
|perCentQueueUtilization|<p>-- ***************************************************************** -- ASYNCOS-MAIL-MIB -- Copyright (c) 2005-2011 by Cisco Systems, Inc. -- All rights reserved. -- Cisco IronPort Email and Web Security Customer Service -- *****************************************************************</p>|`SNMP agent`|perCentQueueUtilization.0<p>Update: 30s</p>|
|updateFailures $1|<p>-</p>|`SNMP agent`|updateFailures[{#SNMPVALUE}]<p>Update: 2h</p><p>LLD</p>|
|updateServiceName $1|<p>-</p>|`SNMP agent`|updateServiceName[{#SNMPVALUE}]<p>Update: 2h</p><p>LLD</p>|
|updates $1|<p>-</p>|`SNMP agent`|updates[{#SNMPVALUE}]<p>Update: 2h</p><p>LLD</p>|
|keyDescription $1|<p>-</p>|`SNMP agent`|keyDescription[{#SNMPVALUE}]<p>Update: 3h</p><p>LLD</p>|
|keyIsPerpetual $1|<p>-</p>|`SNMP agent`|keyIsPerpetual[{#SNMPVALUE}]<p>Update: 3h</p><p>LLD</p>|
|keySecondsUntilExpire $1|<p>-</p>|`SNMP agent`|keySecondsUntilExpire[{#SNMPVALUE}]<p>Update: 3h</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

