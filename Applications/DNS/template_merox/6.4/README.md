# Merox

## Description

This template uses the [Merox](https://www.merox.io/) API to retrieve domain information and create alerts in the event of changes.

## Overview

For Zabbix version: 6.4

Supports monitoring of:
- Discovering domains configured in Merox
- Retrieve statistics related to your domains in Merox
- Retrieve information for each domain (Score, Status, etc.)
- Execute DNS queries and monitor MX, DMARC, SPF and BIMI records

## Author

Romain Tiennot - ManoMano

## Setup

- Generate an API key from the Merox interface
- Replace `{$MEROX.API.TOKEN}`, `{$MEROX.API.USER}` macros with API identifiers
- You can replace the `{$DNS.IP}` macros if you wish to change the DNS server
- You can override the Merox API version and URL from the `{$MEROX.API.VERSION}` and `{$MEROX.API.URL}` macros.
- Assign the template to a host.

## Zabbix configuration

No specific Zabbix configuration is required

### Macros used
|Name|Description|Default|
|----|-----------|-------|
|{$DNS.IP} |<p>DNS server IP for retrieving MX, DMARC, SPF and BIMI record values</p>|`8.8.8.8` |
|{$MEROX.API.URL} |<p>Base Merox API URL</p>|`https://api.merox.io` |
|{$MEROX.API.VERSION} |<p>Merox API version</p>|`0.1` |
|{$MEROX.API.USER} |<p>Email of Merox user who generated API key</p>||
|{$MEROX.API.TOKEN} |<p>Merox API key token</p>||

## Feedback

Please report any issues with the template at https://github.com/ManoManoTech/zabbix_template_merox
