#   Zabbix Template for Unbound DNS Server

##  Author

https://github.com/Rochelly/

## Description


This template adds monitoring capabilities for the Unbound DNS server to Zabbix. It allows you to collect metrics related to the number of queries, cache hits and misses, recursion time, and answer codes.

## User Parameters
The following User Parameters have been added to the template to collect the corresponding metrics:

| Key | Description|
|-|-|
|unbound.total.num.queries | Total number of queries.|
unbound.total.num.cachehits | Total number of cache hits.
unbound.total.num.cachemiss | Total number of cache misses.
unbound.total.num.recursivereplies | Total number of recursive replies.
unbound.total.recursion.time.avg | Average recursion time.
unbound.num.answer.rcode.NOERROR | Number of answers with NOERROR RCODE.
unbound.num.answer.rcode.FORMERR | Number of answers with FORMERR RCODE.
unbound.num.answer.rcode.SERVFAIL | Number of answers with SERVFAIL RCODE.
unbound.num.answer.rcode.NXDOMAIN | Number of answers with NXDOMAIN RCODE.
unbound.num.answer.rcode.NOTIMPL | Number of answers with NOTIMPL RCODE.
unbound.num.answer.rcode.REFUSED | Number of answers with REFUSED RCODE.
unbound.num.answer.secure | Number of secure answers.
unbound.num.rrset.bogus | Number of bogus RRsets.
unbound.num.query.type.A | Number of A record queries.
unbound.num.query.type.PTR | Number of PTR record queries.
unbound.num.query.type.MX | Number of MX record queries.
unbound.num.query.type.TXT | Number of TXT record queries.
unbound.num.query.type.AAAA | Number of AAAA record queries.
unbound.num.query.type.SRV | Number of SRV record queries.
unbound.num.query.type.NAPTR | Number of NAPTR record queries.
unbound.num.query.type.TYPE64 | Number of TYPE64 record queries.
unbound.num.query.type.TYPE65 | Number of TYPE65 record queries.


The metrics are collected by executing the corresponding command using the sudo command and the unbound control stats_noreset option. The output is then filtered using grep and cut to extract the specific metric value.

# Requirements
To use this template, you need to have the Unbound DNS server installed on the target machine and the sudo command configured to allow the Zabbix agent to execute the unbound|control command with the stats_noreset option.

## Usage
To use this template, import it into your Zabbix server and assign it to the host that runs the Unbound DNS server. The metrics will be automatically collected by the Zabbix agent and displayed in the Zabbix frontend. You can use these metrics to monitor the performance and availability of your Unbound DNS server.

Additionally, before using this template, it is necessary to add the "unbound-control.conf" file to the "/etc/zabbix/zabbix_agentd.conf.d/" directory on the host running the Zabbix agent. This configuration file contains the necessary commands to execute the user parameters defined in this template. After adding the file, it is necessary to restart the Zabbix agent for the changes to take effect.

## Note about units of measurement in the template
Note that there are no units of measurement specified in this template, as the units are configured on your Unbound DNS server using the "statistics-interval" parameter. It is important to ensure that the units configured on the Unbound DNS server match the units used in the metrics collected by this template, in order to accurately interpret the data.