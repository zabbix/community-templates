# Zabbix Template for AdGuard Home

<div align="right">

![License](https://img.shields.io/badge/License-GPL3-blue?logo=opensourceinitiative&logoColor=fff)
![Version](https://img.shields.io/badge/Version-6410-blue?logo=AdGuard&color=0aa8d2)

</div>
<BR>


### OVERVIEW

[AdGuard Home](https://github.com/AdguardTeam/AdGuardHome) is a network-wide ad blocking and tracking software. Once you've set it up, it will cover your devices without the need for any client-side software.

If you want to monitor your AdGuard Home instance with Zabbix, this template provides some useful monitoring items. \
The monitoring is done via "REST-ish" API as [AdGuard Home offers an OpenAPI specification](https://github.com/AdguardTeam/AdGuardHome/tree/master/openapi).

The main focus is on monitoring statistics from AdGuard Home.

<BR>

---
### ➡️ [Download (latest)](https://github.com/diasdmhub/AdGuard_Home_Zabbix_Template/releases)
---
#### ➡️ [*How to import templates*](https://www.zabbix.com/documentation/current/en/manual/xml_export_import/templates#importing)
---

<BR>


### TEMPLATES

For more flexibility, the release includes templates that cover **two monitoring methods**, one for native HTTP data retrieval and another for Zabbix Agent Active. Both methods provide the same monitoring items, but with different item types. **They should not be used together on the same host**.

There are also **two independent template types**. One is for HTTP AdGuard Home general **status and statistics**, and the other is for **filter parameters** discovery. \
In total, the released `yaml` file contains **four** templates.

- `AdGuard Home Stats by HTTP`
- `AdGuard Home Stats by Zabbix Agent Active`
- `AdGuard Home Filters by HTTP`
- `AdGuard Home Filters by Zabbix Agent Active`

<BR>


### REQUIREMENTS

- AdGuard Home
  - Zabbix Agent required only for active monitoring
  > _**The template uses the `system.run[*]` parameter for active monitoring with the Zabbix Agent**_

<BR>


### TESTED VERSION

This template has been tested with AdGuard Home version `> 0.107` on an Asus RT-AX86U router running an [Asus Merlin](https://www.asuswrt-merlin.net) firmware. It should work with any recent version of AdGuard Home.

<BR>


### SETUP

> **If the AdGuard Home web user is password protected, the client must use an authentication mechanism when sending requests to the server. Basic access authentication is the offered method. A client must include an `Authorization` HTTP header along with all requests:**
> ```
> Authorization: Basic BASE64_DATA
> ```
> **Where *`BASE64_DATA`* is a base64-encoded data for your *`username:password`* string.**

<BR>

---
1️⃣ After importing the template to Zabbix and creating AdGuard's host, encode **your** AdGuard Authorization string `username:password` to Base64. \
**Examples:**
  - Shell
> ```shell
> echo -n 'username:password' | base64
> ```

  - Python
> ```python
> import base64
> string = 'username:password'
> base64.b64encode(bytes(string, 'utf-8'))
> ```

  - PowerShell
> ```pwsh
> $string = 'username:password'
> [Convert]::ToBase64String([System.Text.Encoding]::UTF8.GetBytes($string))
> ```

<BR>

2️⃣ Copy and paste the encoded string into your host's macro `{$ADGUARD.AUTH}`.

---

<BR><BR>


### MACROS USED

| Macro                | Default Value | Description                                                                                    |
| -------------------- | ------------- | ---------------------------------------------------------------------------------------------- |
| {$ADGUARD.AUTH}      |               | HTTP header `Basic` authorization string. A Base64 encoded string of your `username:password`. |
| {$ADGUARD.PORT}      | 3000          | AdGuard Home HTTP port                                                                         |
| {$ADGUARD.WEB}       | http          | Web protocol. Either `http` or `https`                                                         |
| {$ADGUARD.STAT.DAYS} | 30            | The configured statistics period in days (*AdGuard Home Stats only*)                           |
| {$ADGUARD.FILTER_ENABLED} | true     | True to discover only enabled filters, leave empty to discover all filters (*AdGuard Home Filters only*) |

<BR>


### ITEMS (*AdGuard Home Stats*)

| Name                                                              |
| ----------------------------------------------------------------- |
| AdGuard Home General Status                                       |
| AdGuard Home General Status: AdGuard Home Status Protection       |
| AdGuard Home General Status: AdGuard Home Status Running          |
| AdGuard Home General Status: AdGuard Home Version                 |
| AdGuard Home Statistics                                           |
| AdGuard Home Statistics: AdGuard Home Average Processing Time     |
| AdGuard Home Statistics: AdGuard Home DNS Queries per Second      |
| AdGuard Home Statistics: AdGuard Home Total DNS Blocks by Period  |
| AdGuard Home Statistics: AdGuard Home Total DNS Blocks Today      |
| AdGuard Home Statistics: AdGuard Home Total DNS Queries by Period |
| AdGuard Home Statistics: AdGuard Home Total DNS Queries Today     |

<BR>


### TRIGGERS (*AdGuard Home Stats*)

| Name                                         |
| -------------------------------------------- |
| AdGuard Home Abnormally High Processing Time |
| AdGuard Home Has NO DNS Queries              |
| AdGuard Home Protection Stopped              |
| AdGuard Home Stopped                         |
| AdGuard Home Version Changed                 |

<BR>


### ITEMS (*AdGuard Home Filters*)

| Name                                                              |
| ----------------------------------------------------------------- |
| AdGuard Home Filters                                              |
| AdGuard Home Filter Rules Count Sum                               |

<BR>


### DISCOVERY RULE (*AdGuard Home Filters*)

| Name                                            |
| ----------------------------------------------- |
| AdGuard Home Filters: AdGuard Filters Discovery |

<BR>


### ITEM PROTOTYPES (*AdGuard Home Filters*)

| Name                                                   |
| ------------------------------------------------------ |
| AdGuard Home Filter Last Update Time - {\#FILTER.NAME} |
| AdGuard Home Filter Rules Count - {\#FILTER.NAME}      |
| AdGuard Home Filter Status - {\#FILTER.NAME}           |

<BR>


### TRIGGER PROTOTYPES (*AdGuard Home Filters*)

| Name                                                                  |
| --------------------------------------------------------------------- |
| AdGuard Home Filter is Disabled - {\#FILTER.NAME}                     |
| AdGuard Home Filter not Updated in more than 7 days - {\#FILTER.NAME} |

<BR>


### DASHBOARD EXAMPLE
![Dashboard example](https://github.com/diasdmhub/AdGuard_Home_Zabbix_Template/raw/main/images/dash_example1.png)
