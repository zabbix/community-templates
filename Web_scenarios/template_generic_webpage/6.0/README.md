
# Generic webpage by Web scenarios

## Overview

Generic webpage monitoring by a basic Web scenario, easy to configure. Alerting on unavailability.

Add the target webpage in Macros:
{$URL}, full URL of the page to monitor. (For example : https://mywebpage.com)

## Author
Patxi Andueza 

## Macros used

|  Macro|Default value|Description|
|--|--|--|
| {$URL} | < Put the page URL here > |Full URL of the page to monitor. (For example : https://www.mywebpage.com/)|
|{$UPDATE.INTERVAL}|1m|Every so often a request is made to the website.|
|{$TRIES.UNTIL.TRIGGER}|2|Attempts until the trigger is fired. (Minimum value 1, so that it is triggered immediately).|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

There are no items in this template other than those predefined by the web scenario.


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|Webpage not available|<p>The website has failed to return the status code 200 (OK) on {$TRIES.UNTIL.TRIGGER} occasions.</p>|<p>**Expression**: last(/Generic webpage by Web scenarios/web.test.fail[Webpage availability],{$TRIES.UNTIL.TRIGGER})<>0</p><p>**Recovery expression**: </p>|High|
