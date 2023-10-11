# Template Module Zypper updateinfo by Zabbix trapper

## Overview

For Zabbix version: 5.0

This template monitors a host for available patches and general package updates by repository. Using discovery it will create items and
triggers for all required patch categories/severities and/or package repositories, configurable using macro's. 
Additionally it will feed Zabbix with a list of known vulnerabilities (as known by Zypper) and package names of the available updates.

This template was tested on:

- openSUSE Leap 15.2, 15.3
but should work on any SLES/openSUSE Leap 15.x

Accompanying script requires Python >= 3.4

## Setup

On all hosts you want to monitor:
- Install packages `python3` and `zabbix-sender` 
- Copy `scripts/zypper-updateinfo.py` to `/etc/zabbix/scripts`
- Check `zabbix_sender_bin`, `zabbix_agent_config` paths and the `hostname_name` variable in `scripts/zypper-updateinfo.py` and adapt if required
- Copy Systemd unit files 
  - `systemd/zabbix-template-module-zypper-updateinfo.service` and 
  - `systemd/zabbix-template-module-zypper-updateinfo.timer` 
  to `/etc/systemd/system`
- By default the systemd timer will execute the script every hour. Change this in the `.timer`-file to your needs.
- If you chose to put the `zypper-updateinfo.py` script somewhere else than `/etc/zabbix/scripts`, adjust the path in the `.service`-file
- Enable and start the Systemd timer:
  ```
  systemctl daemon-reload
  systemctl enable zabbix-template-module-zypper-updateinfo.timer
  systemctl start zabbix-template-module-zypper-updateinfo.timer
  ```
On Zabbix server:
- Import the `template_module_zypper_updateinfo.yaml` template into Zabbix
- Assign the template "Template Module Zypper updateinfo by Zabbix trapper" to the host(s) you want to monitor

## Zabbix configuration

No specific Zabbix configuration is required

### Macros used

|Name|Description|Default|
|----|-----------|-------|
|{$ZYPPER.PATCH.CATEGORY_FILTER} |<p>Patch categories to monitor for new patches</p>|`^(security\|recommended\|optional\|feature\|document\|yast)$` |
|{$ZYPPER.PATCH.SEVERITY_FILTER} |<p>Patch severities to monitor for new patches</p>|`^(critical\|important\|moderate\|low\|unspecified)$` |
|{$ZYPPER.REPO.ALIAS_FILTER} |<p>Filter on alias of repositories to discover</p>| `^(.*)$` |
|{$ZYPPER.REPO.AUTOREFRESH_FILTER} |<p>Filter on 'autorefresh' attribute of repositories to discover</p>|`^(0\|1)$` |
|{$ZYPPER.REPO.ENABLED_FILTER} |<p>Filter on 'enabled' attribute of repositories to discover</p>|`1` |
|{$ZYPPER.UPDATEINFO.MAXAGE} |<p>Max age of available security updates information</p>|`2d` |

#### Notes about $ZYPPER.UPDATEINFO.MAXAGE

The template will trigger a warning if no new information was received within the time set by this macro. Don't set this to 1h if the script is executed only once an hour since the script may take some time to finish collecting information from Zypper so it may take a little longer than that hour for new data to actually reach the Zabbix server.

## Feedback

Please report any issues with the template at https://github.com/RobinR1/zbx-template-zypper-updateinfo/issues