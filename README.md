# FortiClient EMS by HTTP

A Zabbix 7.0 template for monitoring FortiClient EMS over HTTPS. Tested with EMS 7.4.8. It collects license usage, endpoint status, EMS and FortiClient versions, certificate expiry, security findings, and server performance. The template includes triggers and a host dashboard.

![FortiClient EMS 7.4.8 host dashboard](docs/images/dashboard.png)

[More screenshots](docs/images/) · [API coverage](API_COVERAGE.md)

## Setup

1. Import [the template](template_forticlient_ems_http.yaml) into Zabbix 7.0 and link it to an EMS host. No SNMP interface is needed.
2. Set these macros on the host:

   | Macro | Value |
   | --- | --- |
   | `{$EMS.API.URL}` | EMS base URL, such as `https://ems.example.com` |
   | `{$EMS.API.SITE}` | EMS site name, usually `default` |
   | `{$EMS.API.USERNAME}` | EMS administrator username |
   | `{$EMS.API.PASSWORD}` | EMS password; use Zabbix **Secret text** |

3. Open the host's **Dashboards** tab and select **EMS: Overview**.

**EMS role:** Use a dedicated **Super Administrator** account for full coverage. In our EMS 7.4.8 tests, Performance, client certificate, and site inventory requests needed this role; lower roles received HTTP 403. Client certificate and inventory collection are disabled by default. A lower role can collect other groups, but Performance will be unavailable. Use Secret text to keep the password hidden in Zabbix.

**Polling:** Each group has one Script master item and dependent metrics. To stop requests for a group, disable its master item and any related no-data trigger. Alerts, inventory, and extended Performance diagnostics are optional and disabled by default. If monitoring several EMS sites, collect global groups on only one host.

## Compatibility

EMS **7.4.8** is the tested target. Performance collection uses EMS's internal Grafana interface, so that part may need changes for other EMS versions.

In a limited EMS **7.2.14** test, licenses, endpoints, EMS version and uptime, FortiClient version counts, and fabric activity worked. Performance and Security collection returned HTTP 404. Disable their master items and related triggers on 7.2.14; CPU, RAM, disk, and Security metrics will then be unavailable. Other routes have not been fully validated on 7.2.14.

## Data and license

The template stores normalized monitoring values, not complete EMS API responses. It is maintained by Nilleftw and is not an official Fortinet template. [MIT license](LICENSE).
