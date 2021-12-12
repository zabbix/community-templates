# Gitlab Update Check

## Overview

Check if a Gitlab server instance is running the latest software version



## Author

John W Kerns (https://github.com/PackeTsar)

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|`{$GITLAB_TOKEN}`| Gitlab personal access token | None | Text macro |

## Template links
- [zabbix_template_gitlab_update_check.xml](zabbix_template_gitlab_update_check.xml)

## Script Links
- [gitlab_update_check.sh](gitlab_update_check.sh)

## Instructions
- Log into your Gitlab instance
- Navigate to your user settings page by clicking your name/avatar in the top right and then clicking **Preferences**
- In the left pane click on **Access Tokens**
- Create a new Personal Access Token
  - Give it a descriptive **name** like "Update Checker"
  - Under **Select scopes** check the `read_api` checkbox
  - Click the **Create personal access token** button to create the token
  - Copy the token value from the returned page
- Download the [gitlab_update_check.sh](gitlab_update_check.sh) script from this repository and place it in `/usr/lib/zabbix/externalscripts/`
- Run `chmod +x /usr/lib/zabbix/externalscripts/gitlab_update_check.sh` to make the script executable
- Test executing the script from the CLI of your Zabbix server by running the bash script inputting the gitlab hostname and your access token like `./gitlab_update_check.sh gitlab.example.com "PeRSoNaLaCcEsStOkEn"`
  - Make sure the output is either "up-to-date", "new version out", or "update asap"
- Once the script works OK, download the [zabbix_template_gitlab_update_check.xml](zabbix_template_gitlab_update_check.xml) Zabbix template from this repository and import it into your Zabbix server
- In Zabbix, navigate to the host you want to perform checks on
- Create a new **macro** on the host called `{$GITLAB_TOKEN}`, in the value field put the personal access token you generated on the Gitlab server
- Make sure the URL hostname of the host is in the "Host name" field setting for the host (ie: gitlab.example.com) if your server is accessed via https://zabbix.example.com/
- Apply the imported template (called "Template Gitlab Update Check") to the host
- Find the new item on the host called "Update Status" and execute it to test it
- Check the latest data to make sure you are getting the proper value from the script

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
