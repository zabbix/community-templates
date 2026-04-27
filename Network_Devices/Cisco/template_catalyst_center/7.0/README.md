# Cisco Catalyst Center Templates for Zabbix

Version 26.04.09

Cisco Catalyst Center aggregates assurance data across sites, wired access, wireless access, controllers, and infrastructure roles. Zabbix provides long-term retention, alerting, and visualization. This template set connects those capabilities by collecting Catalyst Center assurance data in bulk and exposing it in Zabbix for operational monitoring.

## Design model

The templates are built around a single monitored object per Catalyst Center instance.

- One Zabbix host represents one Catalyst Center.
- All polling happens on that host only.
- No hosts are created for sites, devices, or controllers.
- Discovery creates items, not hosts.

This model keeps the installation scalable and avoids host proliferation.

## Architecture

Each domain is implemented as a linked template.

Each domain template uses:
- one fast HTTP source item for monitoring data
- one separate HTTP source item for LLD refresh
- one dependent LLD rule
- dependent item prototypes

The fast `*.health.master` item is used for monitoring values.  
The slower `*.health.lld` item is used only as the source for discovery.

This separation is intentional. Discovery is inventory synchronization, not telemetry collection.

## Proxy requirement

A reverse proxy is required.

The proxy is responsible for:
- handling authentication
- caching authentication tokens
- handling pagination
- forwarding requests to Catalyst Center

Refer to the proxy README for implementation details.

## Included templates

- Cisco Catalyst Center by HTTP
- Cisco Catalyst Center - Site by HTTP
- Cisco Catalyst Center - Wireless by HTTP
- Cisco Catalyst Center - Access by HTTP
- Cisco Catalyst Center - Core by HTTP
- Cisco Catalyst Center - Distribution by HTTP
- Cisco Catalyst Center - Router by HTTP
- Cisco Catalyst Center - WLC by HTTP

## Installation guide

### 1. Create host

Create one host in Zabbix per Catalyst Center instance.

- Host name: free choice, typically the Catalyst Center FQDN
- Groups: assign as needed

### 2. Configure interface

Add a single interface with the following configuration:

- Type: Agent
- IP or DNS: set to Catalyst Center or the proxy target as preferred
- Port: 0

The interface is required by Zabbix but is not used for data collection.

### 3. Attach template

Attach only the main template:

- `Cisco Catalyst Center by HTTP`

All subtemplates are linked automatically.

### 4. Configure macros

Navigate to:

Host → Macros → Inherited and host macros

At minimum, configure these macros:

- `{$CATC.PROXY.URL}`  
  URL of the deployed proxy, for example `http://proxy:8080`

- `{$CATC.HOST}`  
  Catalyst Center hostname or IP

- `{$CATC.USER}`  
  Catalyst Center username

- `{$CATC.PASS}`  
  Catalyst Center password

Also review these operational macros:

- `{$CATC.LLD.INTERVAL}`  
  How often low-level discovery refreshes inventory. Default: `24h`

- `{$CATC.AP.BULK.LIMIT}`
- `{$CATC.ACCESS.BULK.LIMIT}`
- `{$CATC.CORE.BULK.LIMIT}`
- `{$CATC.DISTRIBUTION.BULK.LIMIT}`
- `{$CATC.ROUTER.BULK.LIMIT}`
- `{$CATC.WLC.BULK.LIMIT}`
- `{$CATC.SITE.BULK.LIMIT}`

## Discovery behavior

Discovery is intentionally decoupled from the fast monitoring source items.

Each subtemplate contains:
- one fast item such as `catc.ap.health.master`
- one slower LLD source item such as `catc.ap.health.lld`

The discovery rule is linked to the `*.health.lld` item, not to the fast `*.health.master` item.

Default discovery cadence is controlled by:

- `{$CATC.LLD.INTERVAL}` = `24h`

This reduces unnecessary API load and avoids repeated discovery churn.

## Manual discovery refresh

If an operator adds, removes, or reclassifies devices in Catalyst Center, discovery can be run manually in Zabbix instead of waiting for the next scheduled LLD refresh.

Use:

Configuration → Hosts → `<Catalyst Center host>` → Discovery → Execute now

This is the recommended way to refresh inventory immediately after Catalyst Center inventory changes.

## Deep links in item descriptions

Device item descriptions include a direct Catalyst Center inventory link using the device UUID.

Format:

`https://{$CATC.HOST}/dna/provision/devices/inventory/device-details?deviceId=<uuid>`

This is intended as an operational shortcut from Zabbix to the originating Catalyst Center inventory object.

## Scope

This package focuses on assurance-oriented monitoring:
- site health
- wired and wireless health
- role-based infrastructure health
- summary metrics and counts

It does not:
- create Zabbix hosts per device or site
- perform per-client or MAC-level monitoring
- mirror Catalyst Center inventory into Zabbix hosts

## Data model

Each Catalyst Center instance is represented by one Zabbix host.

- The main template links all domain templates.
- Each domain template performs bulk collection.
- Discovery creates items on the same host.

Sites and devices are represented as discovered entities, not hosts.

## Notes

These templates are intentionally conservative and based on verified Catalyst Center payloads used in this project. Unsupported or unverified metrics are excluded.

## Disclaimer

This project is provided as a community contribution.

- Not affiliated with Cisco Systems or Zabbix
- No guarantees of correctness, stability, or fitness for purpose
- No support is provided

This template depends on Catalyst Center APIs, which may change without notice. Such changes may break functionality without warning.

This template is not production-certified and has not undergone formal QA validation.

Use it only after validating it in your own environment.

## License

MIT License

Copyright (c) 2026 mbechc
