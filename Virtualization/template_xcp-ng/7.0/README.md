
# XenOrchestra

## Overview

This template is designed for the effortless deployment of both XenOrchestra and XCP-NG monitoring and doesn't require any external scripts.

The "XCP-NG Host via Xen Orchestra" and "XCP-NG VM via Xen Orchestra" templates are used by discovery and normally should not be manually linked to a host.

## Requirements

Zabbix version: 6.0 and higher.

## Tested versions

This template has been tested on:
- XenOrchestra 5 CE (from sources)
- Zabbix 6.0
- Zabbix 7.0
- Zabbix 7.2

## Author

Thorsten Liepert

## Setup

1. [Generate](https://docs.xcp-ng.org/management/manage-at-scale/xo-api/#authentication) an access token at XenOrchestra for a [user](https://xen-orchestra.com/docs/users.html) with read access.
2. Create a host for the XenOrchestra host and link template "Xen Orchestra by HTTP"
3. Configure macro "{$XOA.AUTH.TOKEN}" with generated access token
4. Configure macro "{$XOA.URL}" with url to XenOrchestra e.g. https://xen.mydomain.com
5. (optional) Configure macro "{$XOA.PROXY.URL}" to use a proxy.

### Macros used

|Name|Description|Default|
|----|-----------|-------|
|{$XOA.AUTH.TOKEN}|<p>authentication token for XenOrchestra API</p>||
|{$XOA.URL}|<p>URL to XenOrchestra (https://xen.mydomain.com)</p>||
|{$XOA.PROXY.URL}|<p>Proxy URL if needed to reach {$XOA.URL}</p>||
|{$XOA.SR.THRESHOLD.CRIT}|<p>Critical threshold for storage repository usage in percent</p>||
|{$XOA.SR.THRESHOLD.WARN}|<p>Warning threshold for storage repository usage in percent</p>||
|{$XOA.RESPONSE.TIME.SLOW}|<p>Warning threshold for slow API responses</p>||
|{$XOA.VM.IGNORE}|<p>Regular expression to ignore VM in discovery</p>||
|{$XOA.BACKUP.NOT_MATCHES}|<p>Regular expression to ignore backup in discovery</p>||
|{$XEN.SR.IGNORE}|<p>Regular expression to ignore SR in discovery</p>||


## Feedback

Please report any issues with the template at [`https://github.com/bufanda/zabbix--template-xenorchestra`](https://github.com/bufanda/zabbix--template-xenorchestra)
