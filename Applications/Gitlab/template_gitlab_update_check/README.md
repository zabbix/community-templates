# Gitlab Update Check

## Overview

Check if a Gitlab server instance is running the latest software version



## Author

John W Kerns (https://github.com/PackeTsar)

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$GITLAB_TOKEN}| Gitlab personal access token | None | Text macro |


## Template links

- [zabbix_template_gitlab_update_check.xml](zabbix_template_gitlab_update_check.xml)

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
| Update Status | Status of the Gitlab software (ie: "up-to-date") | `External check` | gitlab_update_check.sh["{HOSTNAME}", "{$GITLAB_TOKEN}"] |


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
| Gitlab Update Available | A non-critical software update is available | `{gitlab.verticalcomputers.com:gitlab_update_check.sh["{HOSTNAME}", "{$GITLAB_TOKEN}"].str(up-to-date)}<>1` | Warning |
| Gitlab Critical Update Available | A critical software update is available | `{gitlab.verticalcomputers.com:gitlab_update_check.sh["{HOSTNAME}", "{$GITLAB_TOKEN}"].str(update asap)}=1` | High |
