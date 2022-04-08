# HPE OneView template for Zabbix

## Overview

This is a Zabbix template for HPE OneView (especially for Synergy frames). It uses native Zabbix features and functions and doesn't require any external scripts or plugins, therefore the footprint is very small. Queries are implemented through the official OneView REST API.

## Setup

1. Import the template file (it contains 4 templates)
2. Set the proper host groups in the main template ("HPE OneView" -> enclosure, logical-enclosure, server discovery -> host prototypes -> groups)
3. Create a host for the OneView appliance (eg.: composer1.local.tld)
4. Link the main template ("HPE OneView") to the host
5. Assign user macros to the host (see below)

The other 3 templates (HPE OneView Enclosure, HPE OneView Logical Enclosure, HPE OneView Server) are automatically assigned to the created hosts.

## Zabbix configuration

These macros are required on your previously created OneView Zabbix host:

- {$ONEVIEW_HOST} - host or IP address of the composer (OneView appliance)
- {$ONEVIEW_USER} - OneView username
- {$ONEVIEW_PASS} - OneView password

## Discovery rules

- Alerts (active and locked)
- Enclosures
    - fan bays
    - psu bays
    - appliance bays
    - manager bays
    - interconnect bays
- Logical-enclosures
- Servers

Hosts (enclosures, logical enclosures and servers) are created dynamically by host prototypes.

## Items collected

- OneView
    - alerts
- Enclosures
    - power (allocated, available, capacity, fans&management modules, interconnect bays, servers)
    - health state
    - support state
    - serial number
    - modules (interconnects, managers, appliances, fans, psus)
        - name
        - model
        - health state
        - presence
        - support state
        - serial number
        - link status (manager modules)
- Logical enclosures
    - status
    - consistency state
- Servers
    - bay position
    - name
    - health state
    - support state
    - serial number
    - managemenet processor (ILO) state
    - operating system
    - power state

## Work in progress

- interconnect traffic metrics with graphs (perhaps possible)
- SAN/storage discovery
- tags
- Zabbix 6.0 support

...PRs are welcomed!

## Compatiblity

Zabbix: 5.2 - 5.4 (tested on 5.2)

OneView: tested on OneView 6.2 (rest api version 3000) but it works with newer versions as well. The api version "3000" is hardcoded in the template. For older versions (<6.2) try rewriting the "req.AddHeader('x-api-version: 3000')" lines in the javascripts in master items.

## How it works

#### Authentication mechanism
The authentiaciton process of OneView rest api based on login-sessions (also known as "bearer tokens"). Zabbix must request a token first by username/password pair then it can launch queries authenticated by this token. This process is handled by the template completely with built-in Zabbix javascript objects, no external solution or configuration needed (scripts, services, etc..).

Each query requests a new token from the api and the received token will be deleted (call a DELETE method on the api) after the query completed. This is necessary because the tokens expire in 24 hours.

#### Performance
Fortunately, the api is really fast so it may be able to high frequency monitoring (not tested yet). The templates only launch a small number of queries using master items<->dependent LLDs structure. Each master item holds all the necessary data (in a huge json response), so OneView doesn't need to filtering data or processing complicated queries, it's processed on Zabbix side. Therefore, the average time of a query (include the token request/delete method) is between 0.05 and 0.2 seconds only.

## Authors

- Csaba Kollar
- Zabbix 6.0's patch by [Yann 'Ze' Richard](https://github.com/Zeuh) for [Université Rennes 2](https://github.com/DSI-Universite-Rennes2/).