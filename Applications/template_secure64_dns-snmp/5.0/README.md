# App Secure64 SNMP

## Description

By Ahrar Ahmad Khan

## Overview

**Visit the github link for Readme file**



## Author

Ahrar Khan

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|CacheLatency2048to4095ms|<p>-</p>|`SNMP agent`|s64CacheLatency2048to4095ms.0<p>Update: 60</p>|
|S64 - SRV Queries|<p>-</p>|`SNMP agent`|numRRInQueries.33<p>Update: 60</p>|
|CacheNumAnswersNXDOMAIN|<p>"Number of NXDOMAIN (non-existent domain) answers. This number should be a small percentage of the overall number of queries. A high number of NXDOMAIN answers can indicate a misconfiguration or a possible attack."</p>|`SNMP agent`|s64CacheNumAnswersNXDOMAIN.0<p>Update: 60</p>|
|CacheNumAnswersNODATA|<p>Number of NODATA/NOERROR answers. These occur when the queried domain exists but the query for a particular type resulted in zero answer records.</p>|`SNMP agent`|s64CacheNumAnswersNODATA<p>Update: 60</p>|
|S64 - NS Queries|<p>-</p>|`SNMP agent`|numRRInQueries.2<p>Update: 60</p>|
|CacheNumFailedValidations|<p>Number of failed validation attempts. Numerous failed validations can indicate configuration issues with trust anchors, a DLV, or keys. It can also indicate upstream chain of trust or key/signature problems.</p>|`SNMP agent`|s64CacheNumFailedValidations<p>Update: 60</p>|
|CacheNumAnswersSERVFAIL|<p>Number of SERVFAIL (server failure) answers. SERVFAIL responses can occur when validation fails and the data is bogus or when a bad packet is received.</p>|`SNMP agent`|s64CacheNumAnswersSERVFAIL<p>Update: 1m</p>|
|Secure64 Uptime|<p>-</p>|`SNMP agent`|s64CacheUptime<p>Update: 5m</p>|
|Number of Non Validating Lookups|<p>-</p>|`SNMP agent`|s64CacheNumNonValidatingLookups<p>Update: 60</p>|
|S64 - MX Queries|<p>-</p>|`SNMP agent`|numRRInQueries.15<p>Update: 60</p>|
|CacheNumNXDOMAINRedirects|<p>Number of NXDOMAIN responses that are redirected by attributes provided in the caching server configuration.</p>|`SNMP agent`|s64CacheNumNXDOMAINRedirects<p>Update: 60</p>|
|No of Query Rate Limited By Type|<p>-</p>|`SNMP agent`|s64CacheNumQueriesRateLimitedByType<p>Update: 60</p>|
|CacheLatencyLT64ms|<p>Number of lookups performed that took less than 64 milliseconds</p>|`SNMP agent`|s64CacheLatencyLT64ms<p>Update: 60</p>|
|Number of Validating Lookups|<p>-</p>|`SNMP agent`|s64CacheNumValidatingLookups<p>Update: 60</p>|
|CacheLatency1024to2047ms|<p>-</p>|`SNMP agent`|s64CacheLatency1024to2047ms.0<p>Update: 60</p>|
|S64 - TXT Queries|<p>-</p>|`SNMP agent`|numRRInQueries.16<p>Update: 60</p>|
|S64 - PTR Queries|<p>-</p>|`SNMP agent`|numRRInQueries.12<p>Update: 60</p>|
|S64 - AAAA Queries|<p>-</p>|`SNMP agent`|numRRInQueries.28<p>Update: 60</p>|
|CacheReferralCacheSize|<p>-</p>|`SNMP agent`|s64CacheReferralCacheSize<p>Update: 5m</p>|
|Secure64 Cache Hits|<p>-</p>|`SNMP agent`|s64CacheNumHits<p>Update: 60</p>|
|CacheLatency128to255ms|<p>Number of lookups performed that took more than 128 milliseconds and up to 256 milliseconds.</p>|`SNMP agent`|s64CacheLatency128to255ms.0<p>Update: 60</p>|
|CacheNumPrefetchQueries|<p>Number of cache entries that were refreshed before their TTL expires. This is a performance enhancement intended to decrease the latency by prefetching popular entries to avoid cache misses. An entry is prefetched if it is queried with the last 10% of its TTL.</p>|`SNMP agent`|s64CacheNumPrefetchQueries<p>Update: 60</p>|
|S64 - A Queries|<p>-</p>|`SNMP agent`|numRRInQueries.1<p>Update: 60</p>|
|S64 - SOA Queries|<p>-</p>|`SNMP agent`|numRRInQueries.6<p>Update: 60</p>|
|S64 - CNAME Queries|<p>-</p>|`SNMP agent`|numRRInQueries.5<p>Update: 60</p>|
|CacheLatency512to1023ms|<p>-</p>|`SNMP agent`|s64CacheLatency512to1023ms.0<p>Update: 60</p>|
|CacheLatency256to511ms|<p>-</p>|`SNMP agent`|s64CacheLatency256to511ms.0<p>Update: 60</p>|
|S64 - ANY Queries|<p>-</p>|`SNMP agent`|numRRInQueries.255<p>Update: 60</p>|
|CacheAnswerCacheSize|<p>Message cache size, in kb</p>|`SNMP agent`|s64CacheAnswerCacheSize.0<p>Update: 5m</p>|
|Secure64 Cache Version|<p>-</p>|`SNMP agent`|s64CacheVersion<p>Update: 1h</p>|
|S64 - DS Queries|<p>-</p>|`SNMP agent`|numRRInQueries.43<p>Update: 60</p>|
|Secure64 Status|<p>-</p>|`SNMP agent`|s64CacheRunning<p>Update: 60</p>|
|Secure64 Cache Misses|<p>-</p>|`SNMP agent`|s64CacheNumMises<p>Update: 60</p>|
|S64 - SPF Queries|<p>-</p>|`SNMP agent`|numRRInQueries.99<p>Update: 60</p>|
|CacheLatencyGT4095ms|<p>-</p>|`SNMP agent`|s64CacheLatencyGT4095ms.0<p>Update: 60</p>|
|CacheLatency64to127ms|<p>Number of lookups performed that took more than 64 milliseconds and up to 128 milliseconds.</p>|`SNMP agent`|s64CacheLatency64to127ms.0<p>Update: 60</p>|
|Average QPS|<p>Average number of queries per second (QPS), since the last time this value was queried. Each time this value is queried, we determine the amount of elapsed time since the last SNMP query for it, and the total number of DNS queries since the last SNMP query for it, and calculate the number of queries per second over that interval.</p>|`SNMP agent`|s64CacheQPS<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

