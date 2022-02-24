# App PowerDNS dnsdist

## Description

Self-contained Zabbix template to get information about PowerDNS dnsdist. Source: https://github.com/frei-style/zabbix-powerdns-dnsdist-template/

## Overview

Self-contained Zabbix template to get information about PowerDNS dnsdist.


For installation instructions see: [https://github.com/frei-style/zabbix-powerdns-dnsdist-template](cat-app/dns/app-powerdns-dnsdist/visit)



## Author

Manuel Frei

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$PDNS.DNSDIST.APIKEY}|<p>-</p>|`changeme`|Text macro|
|{$PDNS.DNSDIST.WEBSERVER.IP}|<p>-</p>|`127.0.0.1`|Text macro|
|{$PDNS.DNSDIST.WEBSERVER.PORT}|<p>-</p>|`8083`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|latency-slow|<p>Number of queries answered in more than 1 second.</p>|`Dependent item`|pdns.dnsdist.statistics[latency-slow]<p>Update: 0</p>|
|rule-nxdomain|<p>Number of NXDomain answers returned because of a rule.</p>|`Dependent item`|pdns.dnsdist.statistics[rule-nxdomain]<p>Update: 0</p>|
|latency-sum|<p>Total response time of all queries combined in milliseconds since the start of dnsdist. Can be used to calculate the average response time over all queries.</p>|`Dependent item`|pdns.dnsdist.statistics[latency-sum]<p>Update: 0</p>|
|real-memory-usage|<p>Current memory usage.</p>|`Dependent item`|pdns.dnsdist.statistics[real-memory-usage]<p>Update: 0</p>|
|latency-avg10000|<p>Average response latency in microseconds of the last 10'000 packets.</p>|`Dependent item`|pdns.dnsdist.statistics[latency-avg10000]<p>Update: 0</p>|
|latency-avg100|<p>Average response latency in microseconds of the last 100 packets.</p>|`Dependent item`|pdns.dnsdist.statistics[latency-avg100]<p>Update: 0</p>|
|latency0-1|<p>Number of queries answered in less than 1 ms.</p>|`Dependent item`|pdns.dnsdist.statistics[latency0-1]<p>Update: 0</p>|
|cache-hits|<p>Number of times a response was sent using data found in the packet cache.</p>|`Dependent item`|pdns.dnsdist.statistics[cache-hits]<p>Update: 0</p>|
|cpu-sys-msec|<p>Milliseconds spent by dnsdist in the “system” state.</p>|`Dependent item`|pdns.dnsdist.statistics[cpu-sys-msec]<p>Update: 0</p>|
|noncompliant-responses|<p>Number of answers from a backend dropped as non-compliant.</p>|`Dependent item`|pdns.dnsdist.statistics[noncompliant-responses]<p>Update: 0</p>|
|latency-avg1000|<p>Average response latency in microseconds of the last 1'000 packets.</p>|`Dependent item`|pdns.dnsdist.statistics[latency-avg1000]<p>Update: 0</p>|
|udp-in-errors|<p>From /proc/net/snmp InErrors. New in version 1.5.0.</p>|`Dependent item`|pdns.dnsdist.statistics[udp-in-errors]<p>Update: 0</p>|
|frontend-nxdomain|<p>Number of NXDomain answers sent to clients.</p>|`Dependent item`|pdns.dnsdist.statistics[frontend-nxdomain]<p>Update: 0</p>|
|rule-servfail|<p>Number of ServFail answers returned because of a rule.</p>|`Dependent item`|pdns.dnsdist.statistics[rule-servfail]<p>Update: 0</p>|
|latency-bucket|<p>Number of queries contributing to response time histogram per latency bucket.</p>|`Dependent item`|pdns.dnsdist.statistics[latency-bucket]<p>Update: 0</p>|
|acl-drops|<p>The number of packets (or TCP messages) dropped because of the ACL. If a packet or message is dropped, it is not counted in the queries statistic.</p>|`Dependent item`|pdns.dnsdist.statistics[acl-drops]<p>Update: 0</p>|
|cache-misses|<p>Number of times an answer was not found in the packet cache. Only counted if a packet cache was setup for the selected pool.</p>|`Dependent item`|pdns.dnsdist.statistics[cache-misses]<p>Update: 0</p>|
|latency-avg100000|<p>Average response latency in microseconds of the last 100'000 packets.</p>|`Dependent item`|pdns.dnsdist.statistics[latency-avg100000]<p>Update: 0</p>|
|cpu-user-msec|<p>Milliseconds spent by dnsdist in the “user” state.</p>|`Dependent item`|pdns.dnsdist.statistics[cpu-user-msec]<p>Update: 0</p>|
|cpu-iowait|<p>Time spent waiting for I/O to complete by the whole system, in units of USER_HZ. New in version 1.5.0.</p>|`Dependent item`|pdns.dnsdist.statistics[cpu-iowait]<p>Update: 0</p>|
|latency-count|<p>Number of queries contributing to response time histogram.</p>|`Dependent item`|pdns.dnsdist.statistics[latency-count]<p>Update: 0</p>|
|security-status|<p>The security status of dnsdist. This is regularly polled. 0 = Unknown status or unreleased version 1 = OK 2 = Upgrade recommended 3 = Upgrade required (most likely because there is a known security issue)</p>|`Dependent item`|pdns.dnsdist.statistics[security-status]<p>Update: 0</p>|
|fd-usage|<p>Number of currently used file descriptors.</p>|`Dependent item`|pdns.dnsdist.statistics[fd-usage]<p>Update: 0</p>|
|noncompliant-queries|<p>Number of queries dropped as non-compliant.</p>|`Dependent item`|pdns.dnsdist.statistics[noncompliant-queries]<p>Update: 0</p>|
|API Statistics|<p>-</p>|`HTTP agent`|pdns.dnsdist.api.statistics<p>Update: 1m</p>|
|rule-refused|<p>Number of Refused answers returned because of a rule.</p>|`Dependent item`|pdns.dnsdist.statistics[rule-refused]<p>Update: 0</p>|
|dyn-block-nmg-size|<p>Number of dynamic blocks entries.</p>|`Dependent item`|pdns.dnsdist.statistics[dyn-block-nmg-size]<p>Update: 0</p>|
|frontend-servfail|<p>Number of ServFail answers sent to clients.</p>|`Dependent item`|pdns.dnsdist.statistics[frontend-servfail]<p>Update: 0</p>|
|udp-noport-errors|<p>From /proc/net/snmp NoPorts. New in version 1.5.0.</p>|`Dependent item`|pdns.dnsdist.statistics[udp-noport-errors]<p>Update: 0</p>|
|empty-queries|<p>Number of empty queries received from clients. Every empty-query is also counted as a query.</p>|`Dependent item`|pdns.dnsdist.statistics[empty-queries]<p>Update: 0</p>|
|downstream-timeouts|<p>Number of queries not answer in time by a backend.</p>|`Dependent item`|pdns.dnsdist.statistics[downstream-timeouts]<p>Update: 0</p>|
|uptime|<p>Uptime of the dnsdist process, in seconds.</p>|`Dependent item`|pdns.dnsdist.statistics[uptime]<p>Update: 0</p>|
|cpu-steal|<p>Stolen time, which is the time spent by the whole system in other operating systems when running in a virtualized environment, in units of USER_HZ. New in version 1.5.0.</p>|`Dependent item`|pdns.dnsdist.statistics[cpu-steal]<p>Update: 0</p>|
|rule-drop|<p>Number of queries dropped because of a rule.</p>|`Dependent item`|pdns.dnsdist.statistics[rule-drop]<p>Update: 0</p>|
|latency1-10|<p>Number of queries answered in 1-10 ms.</p>|`Dependent item`|pdns.dnsdist.statistics[latency1-10]<p>Update: 0</p>|
|dyn-blocked|<p>Number of queries dropped because of a dynamic block.</p>|`Dependent item`|pdns.dnsdist.statistics[dyn-blocked]<p>Update: 0</p>|
|downstream-send-errors|<p>Number of errors when sending a query to a backend.</p>|`Dependent item`|pdns.dnsdist.statistics[downstream-send-errors]<p>Update: 0</p>|
|servfail-responses|<p>Number of servfail answers received from backends.</p>|`Dependent item`|pdns.dnsdist.statistics[servfail-responses]<p>Update: 0</p>|
|latency100-1000|<p>Number of queries answered in 100-1000 ms.</p>|`Dependent item`|pdns.dnsdist.statistics[latency100-1000]<p>Update: 0</p>|
|trunc-failures|<p>Number of errors encountered while truncating an answer.</p>|`Dependent item`|pdns.dnsdist.statistics[trunc-failures]<p>Update: 0</p>|
|latency50-100|<p>Number of queries answered in 50-100 ms.</p>|`Dependent item`|pdns.dnsdist.statistics[latency50-100]<p>Update: 0</p>|
|latency10-50|<p>Number of queries answered in 10-50 ms.</p>|`Dependent item`|pdns.dnsdist.statistics[latency10-50]<p>Update: 0</p>|
|self-answered|<p>Number of self-answered responses.</p>|`Dependent item`|pdns.dnsdist.statistics[self-answered]<p>Update: 0</p>|
|latency-avg1000000|<p>Average response latency in microseconds of the last 1'000'000 packets.</p>|`Dependent item`|pdns.dnsdist.statistics[latency-avg1000000]<p>Update: 0</p>|
|rdqueries|<p>Number of received queries with the recursion desired bit set.</p>|`Dependent item`|pdns.dnsdist.statistics[rdqueries]<p>Update: 0</p>|
|frontend-noerror|<p>Number of NoError answers sent to clients.</p>|`Dependent item`|pdns.dnsdist.statistics[frontend-noerror]<p>Update: 0</p>|
|no-policy|<p>Number of queries dropped because no server was available.</p>|`Dependent item`|pdns.dnsdist.statistics[no-policy]<p>Update: 0</p>|
|responses|<p>Number of responses received from backends. Note! This is not the number of responses sent to clients. To get that number, add ‘cache-hits’ and ‘responses’.</p>|`Dependent item`|pdns.dnsdist.statistics[responses]<p>Update: 0</p>|
|queries|<p>Number of received queries.</p>|`Dependent item`|pdns.dnsdist.statistics[queries]<p>Update: 0</p>|
|udp-sndbuf-errors|<p>From /proc/net/snmp SndbufErrors. New in version 1.5.0.</p>|`Dependent item`|pdns.dnsdist.statistics[udp-sndbuf-errors]<p>Update: 0</p>|
|udp-recvbuf-errors|<p>From /proc/net/snmp RcvbufErrors. New in version 1.5.0.</p>|`Dependent item`|pdns.dnsdist.statistics[udp-recvbuf-errors]<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

