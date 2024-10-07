# Template App Postfix by Zabbix Agent

## Overview

For Zabbix version: 6.4

This template monitors a Postfix instance's processes and queues using the Zabbix Agent, 
[pflogsumm.pl](https://jimsun.linxnet.com/postfix_contrib.html), [logtail](https://sourceforge.net/projects/logdigest/), [postqueue](http://www.postfix.org/postqueue.1.html) and a helper script.

Monitored items are:
  - Number of different running Postfix processes
  - CPU and Memory usage of different Postfix processes
  - Postfix version
  - Number of messages in different queue's
  - Bounced, Deferred and Reject reasons
  - Mail volumes delivered/received in bytes

This template is set up to use Zabbix Agent active mode, but can be adapted easily to use passive mode by mass updating all "Zabbix agent (active)" items to "Zabbix agent" items

This template was tested on:
  - openSUSE Leap 15.4, 15.5
  - SLES 15 SP5
but should work on any Linux 

## Requirements
  - Postfix
  - Zabbix Agent or Zabbix Agent 2
  - Bash
  - [Logtail](https://sourceforge.net/projects/logdigest/) (`logtail` system package on Suse and Debian. On CentOS/Fedora and alike, it should be included in the `logcheck` package)
  - Perl 5.004 or higher
  - [pflogsumm.pl](https://jimsun.linxnet.com/postfix_contrib.html)
    (v1.1.3 did not work for me, but v1.1.5 does. Test the script manually as you may need to install extra Perl dependencies 
    like [Date::Calc](http://search.cpan.org/dist/Date-Calc/)).

## Setup

On the host with a running Postfix service you want to monitor:
  - Install the Zabbix Agent or Zabbix Agent 2 package if it is not yet installed on the host.
  - Install `logtail`.
  - Install [pflogsumm.pl](https://jimsun.linxnet.com/postfix_contrib.html) in `/usr/local/bin` and make sure the script is executable.
  - Copy `files/scripts/postfix_get_spool.sh` to `/etc/zabbix/scripts` and ensure it is set executable.
    - Check `postfix_config` variable in `/etc/zabbix/scripts/postfix_get_spool.sh` and adapt if required.
  - Copy `files/sudoers.d/zabbix_postfix` to `/etc/sudoers.d`
  - Copy `files/zabbix_agentd.d/template_app_postfix.conf` to `/etc/zabbix/zabbix_agent.d` or `/etc/zabbix/zabbix_agent2.d` 
    depending on which version of the Zabbix Agent you use and ensure that directory is set as an `Include` in your main Zabbix agent configuration file.

On Zabbix server:
  - Import the `Postfix by Zabbix agent active.yaml` template into Zabbix
  - Assign the template "Postfix by Zabbix agent active" to the host you want to monitor

## Zabbix configuration

No specific Zabbix configuration is required

### Macros used

|Name|Description|Default|
|----|-----------|-------|
|{$POSTFIX.ACTIVE.MAX} |<p>Max number of messages in Active queue</p>|`50` |
|{$POSTFIX.BOUNCE.MAX} |<p>Max number of bounced messages within POSTFIX.TRIGGER.PERIOD</p>|`50` |
|{$POSTFIX.DEFERRED.MAX} |<p>Max number of deferred messages in queue</p>| `50` |
|{$POSTFIX.HOLD.MAX} |<p>Max number of held messages in queue</p>|`200` |
|{$POSTFIX.REJECTED.MAX} |<p>Max number of rejected messages within POSTFIX.TRIGGER.PERIOD</p>|`20` |
|{$POSTFIX.TRIGGER.PERIOD} |<p>Time period to check for too many bounced or rejected mails. Context "bounced" or "rejected" is supported.</p>|`30m` |
|{$POSTFIX_USER} |<p>User running unprivileged postfix processes</p>|`postfix` |

## Feedback

Please report any issues with the template at https://github.com/RobinR1/zbx-template-postfix/issues