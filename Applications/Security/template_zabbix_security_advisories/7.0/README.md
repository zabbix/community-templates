# Zabbix Security Advisories by HTTP Agent

## Overview

Zabbix Security Advisories template for Zabbix 7.0+
===================================================

A small demo how Zabbix can fetch and parse its own security advisories from Jira.

- Fetches Zabbix Security Advisories from Zabbix bug tracker via Jira API
- Generates items using LLD

## Installation

Add a new host to your Zabbix and assign this template for it. No additional configuration needed.

## Author

Janne Pikkarainen <contact@whatsuphome.fi>

## Macros used

11 LLD macros, no need to configure them

|LLD macro|JSONPath|
|---------|--------|
|{#CVECREATED}|$.fields.created|
|{#CVEDESCRIPTION}|$.fields.description|
|{#CVEID}|$.id|
|{#CVEPRIORITY}|$.fields.priority.name|
|{#CVERESOLUTIONDATE}|$.fields.resolutiondate|
|{#CVESTATUS}|$.fields.status.name|
|{#CVESUMMARY}|$.fields.summary|
|{#CVETICKET}|$.key|
|{#CVEUPDATED}|$.fields.updated|
|{#CVEURL}|$.self[]|

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|CVEs list|Discovery of CVEs from Zabbix Jira|HTTP Agent|zabbix-jira-cves.masteritem|Update interval: 1d|

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|-----------------------|
|{#CVETICKET}: Created {#CVECREATED}|Time of ZBX ticket creation|Dependent item|zabbix-jira.cves.created.[{#CVEID}]|
|{#CVETICKET}: CVE Mitre ID {{#CVEDESCRIPTION}.regsub("(CVE-[0-9]+-[0-9]+)", \1)}|CVE Mitre ID, if available|Dependent item|zabbix-jira.cves.mitreid.[{#CVEID}]|
|{#CVETICKET}: Priority {#CVEPRIORITY}|Priority in Zabbix Jira|Dependent item|zabbix-jira.cves.priority.[{#CVEID}]|
|{#CVETICKET}: Resolution date {#CVERESOLUTIONDATE}|Resolution date in Zabbix Jira|Dependent item|zabbix-jira.cves.resolutiondate.[{#CVEID}]|
|{#CVETICKET}: Updated {#CVEUPDATED}|Last updated in Zabbix Jira|Dependent item|zabbix-jira.cves.updated.[{#CVEID}]|
|{#CVETICKET}: {#CVESUMMARY}|CVE summary (subject) in Zabbix Jira|Dependent item|zabbix-jira.cves.summary.[{#CVEID}]|
|{#CVETICKET}: {#CVEURL}|URL to ticket in Zabbix Jira|Dependent item|zabbix-jira.cves.url.[{#CVEID}]|

## Triggers

There are no triggers in this template.

