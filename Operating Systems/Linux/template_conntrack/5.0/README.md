# Network Performance Conntrack

## Overview

Template for collecting Linux conntrack metrics.


Usefull for monitoring systems doing NAT, for example - Docker/Kubernetes nodes, Linux-based gateways.


Uses system.run but may be altered with userparameter if remote commands are forbidden. Ubuntu Xenial< and Debian Stretch< tested, but may also work on other distro.


Some of the features:


* Single request.
* Minimum host dependencies - lnstat (part of iproute2 package) used.
* No host scripts, only system.run and dependent items.


## Author

Oleg Morozov aka zigmund

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Conntrack found per second|<p>Number of searched entries which were successful.</p>|`Dependent item`|conntrack_stats[found]<p>Update: 0</p>|
|Conntrack expect_create per second|<p>Number of expectations added.</p>|`Dependent item`|conntrack_stats[expect_create]<p>Update: 0</p>|
|Conntrack searched per second|<p>Number of conntrack table lookups performed.</p>|`Dependent item`|conntrack_stats[searched]<p>Update: 0</p>|
|Conntrack insert_failed per second|<p>Number of entries for which list insertion was attempted but failed (happens if the same entry is already present).</p>|`Dependent item`|conntrack_stats[insert_failed]<p>Update: 0</p>|
|Conntrack early_drop per second|<p>Number of dropped conntrack entries to make room for new ones, if maximum table size was reached.</p>|`Dependent item`|conntrack_stats[early_drop]<p>Update: 0</p>|
|Conntrack search_restart per second|<p>Number of conntrack table lookups which had to be restarted due to hashtable resizes.</p>|`Dependent item`|conntrack_stats[search_restart]<p>Update: 0</p>|
|Conntrack delete_list per second|<p>Number of conntrack entries which were put to dying list.</p>|`Dependent item`|conntrack_stats[delete_list]<p>Update: 0</p>|
|Conntrack insert per second|<p>Number of entries inserted into the list.</p>|`Dependent item`|conntrack_stats[insert]<p>Update: 0</p>|
|Conntrack invalid per second|<p>Number of packets seen which can not be tracked.</p>|`Dependent item`|conntrack_stats[invalid]<p>Update: 0</p>|
|Conntrack max|<p>Maximum conntrack entries limit configured.</p>|`Zabbix agent (active)`|system.run["/sbin/sysctl -n net.netfilter.nf_conntrack_max"]<p>Update: 1h</p>|
|Conntrack icmp_error per second|<p>Number of packets which could not be tracked due to error situation. This is a subset of invalid.</p>|`Dependent item`|conntrack_stats[icmp_error]<p>Update: 0</p>|
|Conntrack ignore per second|<p>Number of packets seen which are already connected to a conntrack entry.</p>|`Dependent item`|conntrack_stats[ignore]<p>Update: 0</p>|
|Conntrack expect_delete per second|<p>Number of expectations deleted.</p>|`Dependent item`|conntrack_stats[expect_delete]<p>Update: 0</p>|
|Conntrack drop per second|<p>Number of packets dropped due to conntrack failure. Either new conntrack entry allocation failed, or protocol helper dropped the packet.</p>|`Dependent item`|conntrack_stats[drop]<p>Update: 0</p>|
|Conntrack stats|<p>-</p>|`Zabbix agent (active)`|system.run["lnstat -jc1 -f nf_conntrack | sed 's/{{/{/g' | sed 's/}}/}/g'"]<p>Update: 1m</p>|
|Conntrack expect_new per second|<p>Number of conntrack entries added after an expectation for them was already present.</p>|`Dependent item`|conntrack_stats[expect_new]<p>Update: 0</p>|
|Conntrack delete per second|<p>Number of conntrack entries which were removed.</p>|`Dependent item`|conntrack_stats[delete]<p>Update: 0</p>|
|Conntrack new per second|<p>Number of conntrack entries added which were not expected before.</p>|`Dependent item`|conntrack_stats[new]<p>Update: 0</p>|
|Conntrack entries|<p>Number of entries in conntrack table.</p>|`Dependent item`|conntrack_stats[entries]<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

