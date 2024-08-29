# Template_App_Newreleases
Checks newreleases.io for software updates you're subscribed too
# Author
Todd Blake
# Requirements:
* Zabbix version 6.4 or later
* A newreleases.io account and API key
# Installation:
1. Import the Template_App_Newreleases.yaml template into your Zabbix instance (Configuration --> Templates --> Import), and apply the template to a host
2. Sign up for an account at newrelease.io.
3. Generate an API key and copy it into the {$APIKEY} macro
4. Subscribe to software releases you're interested in on newreleases.io

## Macros used

|Macro|Default Value|Description|
|-----|-------------|-----------|
|{$APIKEY}|N/A|Your newreleases.io API key|


## Discovery Rule
|Rule|Type|Description|
|----|----|-----------|
|Newreleases JSON|HTTP agent|The raw JSON for all projects you're subscribed too|

## Item prototypes
|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Release JSON for {#PROVIDER} {#NAME}|URL: {#URL} newreleases.io Project ID - {#ID}|HTTP Agent|newreleases.project.json[{#PROVIDER},{#NAME}]|
|Release Date for {#PROVIDER} {#NAME}|Release Date for {#PROVIDER} {#NAME}|Dependent Item|newreleases.project.date[{#PROVIDER},{#NAME}]|
|Release Version for {#PROVIDER} {#NAME}|Release Version for {#PROVIDER} {#NAME}|Dependent Item|newreleases.project.version[{#PROVIDER},{#NAME}]|

## Trigger prototypes
|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Recent release for {#PROVIDER} {#NAME}|There has been a recent release for {#PROVIDER} {#NAME}|fuzzytime(/Template App Newreleases/newreleases.project.date[{#PROVIDER},{#NAME}],86400)=1|Information|