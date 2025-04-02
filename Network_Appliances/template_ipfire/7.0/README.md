# IPFire by Zabbix Agent Active

## Description

This template monitors an [IPFire](https://www.ipfire.org/) [appliance](https://www.lightningwirelabs.com/products/ipfire/appliances) or [instance](https://www.ipfire.org/download)

## Overview

For Zabbix version: 7.0

Supports monitoring of:
- IPFire general stats (Number of current DHCPd clients)
- IPFire services (default IPFire services and possible Addon services)
- Pakfire status (Installed version, Available update(s))
- Network stats (Line quality, Open Connections, Firewall hits)
- OpenVPN clients and stats (OpenVPN client discovery, OpenVPN client properties, Traffic stats, Client/Server/CA Certificate validation)
- IPS throughput stats (Scanned, Bypassed, Whitelisted)
- Guardian blocked IPs (count)

Use in conjunction with a default Template OS Linux-template for CPU/Memory/Storage monitoring of the IPFire appliance/instance.

This template was created for:

- IPFire 2.29 - Core update 191

**Warning**: This template will *NOT* work on earlier versions of IPFire.

## Author

Robin Roevens

## Setup

- Install and configure [IPFire addon `zabbix_agentd`](https://www.ipfire.org/docs/addons/zabbix_agentd) using Pakfire
- Make sure the IPFire builtin specific userparameters are enabled in `/etc/zabbix_agentd/zabbix_agentd.conf` (which should be by default)

### Upgrade note:
This template no longer requires a custom script to be installed for the discovery and monitoring of IPFire services as this is now natively supported by the IPFire zabbix_agentd addon since Core Update 189. So when ugrading this template, you should also delete the now deprecated custom script and userparameter-config from your IPFire instance:
  * `/etc/zabbix_agentd/script/ipfire_services.pl`
  * `/etc/zabbix_agentd/zabbix_agentd.d/template_ipfire_services.conf`
And remove the script from the `/etc/sudoers.d/zabbix_agentd_user` file.

## Zabbix configuration

No specific Zabbix configuration is required.

Note on usage of the Zabbix default Linux by Zabbix agent (active) template: the item `system.sw.packages.get` of that template will fail as IPFire has no package manager that is natively supported by Zabbix Agent. Package management on IPFire is done by pakfire and is monitored separately in this template using the IPFire specific `pakfire.status` item.

### Macros used
|Name|Description|Default|
|----|-----------|-------|
|{$IPFIRE.CONN.MAX.WARN} |<p>Max percentage of max open connections used before triggering warning</p>|`95` |
|{$IPFIRE.CONN.MAX.RESOLVE} |<p>Percentage of max open connections used before resolving trigger</p>|`85` |
|{$IPFIRE.FW_CHAIN.MATCHES} |<p>Only discover firewall chains matching this regex</p>|`^.*$` |
|{$IPFIRE.FW_CHAIN.NOT_MATCHES} |<p>Do not discover firewall chains matching this regex</p>|`CHANGE_IF_NEEDED` |
|{$IPFIRE.SERVICE.TRIGGER} |<p>Whether Zabbix needs to trigger when an IPFire service is down. This variable can be used with context to exclude specific services.</p>|`1` |
|{$IPFIRE.SERVICENAME.MATCHES} |<p>All services matching this regex will be discovered</p>|`^.*$` |
|{$IPFIRE.SERVICENAME.NOT_MATCHES} |<p>Services matching this regex will not be discovered</p>|`CHANGE_IF_NEEDED` |
|{$IPFIRE.OVPN.COMMONNAME.MATCHES} |<p>OpenVPN clients with common name matching this regex will be discovered</p>|`^.*$` |
|{$IPFIRE.OVPN.COMMONNAME.NOTMATCHES} |<p>OpenVPN clients with common name matching this regex will not be discovered</p>|`CHANGE_IF_NEEDED` |
|{$IPFIRE.OVPN.STATE.MATCHES} |<p>OpenVPN clients with a state (on/off) matching this regex will be discovered.</p>|`on` |
|{$IPFIRE.OVPN.CERT.EXPIRY.WARN} |<p>Number of days until the OpenVPN server or CA certificate expires.</p>|`7` |

#### Notes about $IPFIRE.SERVICE.TRIGGER
This template does not 'detect' if you have manually disabled a service in IPFire, so by default it will alarm you when any service is down. This is done on purpose so that you will also be notified if a service is unintentionly disabled.

To disable the trigger for a specific service (because it is disabled or you just don't want notifications about that service) add a host macro `{$IPFIRE.SERVICE.TRIGGER:"<service>"}` to the IPFire host and set it to `0`. 

For example to disable the OpenVPN service trigger add `{$IPFIRE.SERVICE.TRIGGER:"openvpn"}` to the host. Check the discovered IPFire service item-keys for the correct service-name of each service.

Or you could opt to use the variables `{$IPFIRE.SERVICENAME.MATCHES}` and/or `{$IPFIRE.SERVICENAME.NOT_MATCHES}` to filter out services
you don't want to be monitored at all.

#### OpenVPN Client discovery
This template is actually a set of 2 and includes a second template `IPFire OpenVPN Client by Zabbix agent` specificaly for use by the OpenVPN Client discovery defined in the main template `IPFire by Zabbix agent active`.

If the OpenVPN Service of the IPFire instance is enabled, the main template will discover any configured OpenVPN clients (see `{$IPFIRE.OVPN.*}` macro's to set filters), create those as new hosts in Zabbix and link the `IPFire OpenVPN Client by Zabbix agent` template to them.
Those client hosts will then start collecting OpenVPN statistics specific to those clients.

## Credits

[Alexander Koch](https://community.ipfire.org/t/looking-for-the-zabbix-agent-template/1459/2) for the app Pakfire template.

[IPFire Team](https://www.ipfire.org) for the IPFire distro and for accepting my contributions to allow easier/better monitoring using Zabbix Agent.

## Feedback

Please report any issues with the template at https://github.com/RobinR1/zbx-template-ipfire/issues
