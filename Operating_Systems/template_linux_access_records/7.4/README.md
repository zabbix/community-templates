# Linux access records by Zabbix agent active

Collects OS-level **access records** (SSH logins, sudo) from the local auth log via
Zabbix agent (active) `log[]` items — for security auditing and compliance evidence
(e.g. access-logging and audit-trail requirements such as ISO/IEC 27001).

**Author:** saranf

## Overview

The template reads the local auth log on each monitored host and exposes three access-record
streams plus one brute-force trigger. It only **reads** the log — no changes to the host
beyond a Zabbix agent (active) with read access to the log path.

Long-term retention and tamper-proof storage of access records are **out of scope** — forward
the logs to a log store (Loki/SIEM) if your regulation requires 1–2 year retention.

## Requirements

- Zabbix **7.4**
- **Zabbix agent (active)** installed on the host, with `ServerActive` configured
- The `zabbix` user must have **read access** to the auth log path (`{$ACCESSLOG.PATH}`)
- Set `{$ACCESSLOG.PATH}` to your distribution's auth log:
  - RHEL / CentOS / Rocky / Alma: `/var/log/secure`
  - Debian / Ubuntu: `/var/log/auth.log`

## Macros

| Macro | Default | Description |
|---|---|---|
| `{$ACCESSLOG.PATH}` | `/var/log/secure` | Auth log path (see Requirements). |
| `{$ACCESSLOG.ACCEPTED.REGEX}` | `Accepted (password\|publickey\|keyboard-interactive)` | Regex for successful login lines. |
| `{$ACCESSLOG.FAILED.REGEX}` | `Failed password for` | Regex for failed login lines. |
| `{$ACCESSLOG.SUDO.REGEX}` | `sudo:.*COMMAND=` | Regex for sudo command lines. |
| `{$ACCESSLOG.FAILED.WINDOW}` | `5m` | Window used to count failed logins. |
| `{$ACCESSLOG.FAILED.MAX}` | `10` | Failed logins in the window that raise a Warning. |

## Items

| Item | Key | Type |
|---|---|---|
| Access records: accepted logins | `log[{$ACCESSLOG.PATH},"{$ACCESSLOG.ACCEPTED.REGEX}",,,skip]` | Zabbix agent (active), Log |
| Access records: failed logins | `log[{$ACCESSLOG.PATH},"{$ACCESSLOG.FAILED.REGEX}",,,skip]` | Zabbix agent (active), Log |
| Access records: sudo commands | `log[{$ACCESSLOG.PATH},"{$ACCESSLOG.SUDO.REGEX}",,,skip]` | Zabbix agent (active), Log |

## Triggers

| Name | Expression | Severity |
|---|---|---|
| Too many failed logins on {HOST.NAME} | `count(/.../failed-logins,{$ACCESSLOG.FAILED.WINDOW})>{$ACCESSLOG.FAILED.MAX}` | Warning |

## Setup

1. Import the template into Zabbix 7.4 (*Data collection → Templates → Import*).
2. Link the template to your Linux host(s).
3. Override `{$ACCESSLOG.PATH}` on hosts that use `/var/log/auth.log`.
4. Ensure the Zabbix agent runs in **active** mode and can read the log file.

## License

Published under the MIT license.
