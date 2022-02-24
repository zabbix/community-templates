# Linux Services

## Overview

This script detects processes that are running for a while and presumes that these are services that should be running always. The magic is in the regular expression.  
The LLD-template will use the JSON-output to create the item proc.num[{#SERVICE}] for each of these processes and a trigger that will check if it is running or not.


This takes away the need to specify in your template which service is supposed to be running.


If it detects a service that does not need monitoring you can always disable it. If the service should never be monitored it is better to add these to the "Global regular expressions" of Zabbix (or in the script).


 */etc/zabbix/scripts/service\_discovery*


**#!/bin/bash**


**TMPDIR=`mktemp -t -d ${0//*\/}.XXXXXXXXXX`**


**echo '^-**


**^\_****^sleep$****^qmgr$****^showq$****^pickup$****^pigz$****^tar$****^pmm-ras$****^backupmng$****^proxymap$****^cleanup$****^tlsmgr$****^anvil$****^trivial-rewrite$****^dd$****^init$****^php****^perl$****^python$****^lua$****^sh$****^bash$****^auth$****^login$****^imap****^accounts-daemon$****^config$****^ssl-params$****^vlogger$****^ssh$****^zabbix\_agent****^systemd****^proxymap$****zip$****^awk$****^log$****^run-parts$****getty$****^smtp$****^smtpd$****^amavisd****^postgrey****^pure-ftpd****^proftpd****^Passenger****^qsync****^qWatchdogd****^spamd$' >${TMPDIR}/filter**


**ps aux | egrep -io '([a-z]+[0-9]+| 20[0-9][0-9]) +[0-9]+:[0-9]+ [A-Za-z0-9/\_-]*( |:|$)' | \** **sed 's/.*\///g;s/[ :]$//g;s/.* //g' | grep '[a-z]' | \** **grep -vf ${TMPDIR}/filter | sort | uniq >${TMPDIR}/progs**


**if [ -s ${TMPDIR}/progs ] ; then** **echo -e "{\n\t\"data\":["** **while read SERVICE ; do** **[ ${PRINTED} ] && echo ","** **PRINTED=true** **echo -en "\t\t{ \"{#SERVICE}\":\"${SERVICE}\" }"** **done <${TMPDIR}/progs** **echo -e "\n\t]\n}"****fi**  
**rm -r ${TMPDIR}**


 



## Author

Frater

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Linux service discovery|<p>-</p>|`Zabbix agent`|service.discovery<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of processes $1|<p>-</p>|`Zabbix agent`|proc.num[{#SERVICE}]<p>Update: 2m</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Service {#SERVICE} is not running|<p>-</p>|<p>**Expression**: last(/Linux_Services/proc.num[{#SERVICE}])=0</p><p>**Recovery expression**: </p>|high|
|Service {#SERVICE} is not running (LLD)|<p>-</p>|<p>**Expression**: last(/Linux_Services/proc.num[{#SERVICE}])=0</p><p>**Recovery expression**: </p>|high|
