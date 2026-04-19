# Cisco Catalyst Center Templates for Zabbix
---

## Overview

Cisco Catalyst Center aggregates assurance data across sites, wired access, wireless access, controllers, and infrastructure roles. Zabbix provides long-term retention, alerting, and visualization.

This template set connects those capabilities by collecting Catalyst Center assurance data in bulk and exposing it in Zabbix for operational monitoring.

---

## Design Model

The templates are built around a **single monitored object per Catalyst Center instance**.

- One Zabbix host represents one Catalyst Center
- All data collection happens on that host only
- No hosts are created for sites, devices, or controllers
- Discovery creates items, not hosts

This model ensures scalability and avoids host proliferation.

---

## Architecture

Each domain is implemented as a linked template.

Each template uses:
- one HTTP master item
- dependent low-level discovery (LLD)
- dependent item prototypes

Matching is performed using stable identifiers (UUIDs), avoiding cross-request correlation.

---

## Proxy Requirement

A reverse proxy is required.

The proxy is responsible for:

- handling authentication
- caching authentication tokens
- handling pagination
- forwarding requests to Catalyst Center

Refer to the proxy README for implementation details.

---

## Included Templates

- Cisco Catalyst Center by HTTP
- Cisco Catalyst Center - Site by HTTP
- Cisco Catalyst Center - Wireless by HTTP
- Cisco Catalyst Center - Access by HTTP
- Cisco Catalyst Center - Core by HTTP
- Cisco Catalyst Center - Distribution by HTTP
- Cisco Catalyst Center - Router by HTTP
- Cisco Catalyst Center - WLC by HTTP

---

## Installation Guide

### 1. Create Host

Create one host in Zabbix per Catalyst Center instance.

- Host name: free choice (recommended: Catalyst Center FQDN)
- Groups: assign as needed

### 2. Configure Interface

Add a single interface with the following configuration:

- Type: Agent
- IP or DNS: set to Catalyst Center or proxy target (not used for polling)
- Port: 0

> Note: The interface is required by Zabbix but is not used for data collection.

### 3. Attach Template

Attach only the main template:

- `Cisco Catalyst Center by HTTP`

All other templates are linked automatically.

### 4. Configure Macros

Navigate to:

Host → Macros → **Inherited and host macros**

At minimum, configure the following macros:

- `{$CATC.PROXY.URL}`  
  URL of the deployed proxy (e.g. http://proxy:8080)

- `{$CATC.HOST}`  
  Catalyst Center hostname or IP

- `{$CATC.USER}`  
  Catalyst Center username

- `{$CATC.PASSWORD}`  
  Catalyst Center password

These macros are required for all HTTP requests.

---

## Scope

This package focuses on assurance-oriented monitoring:

- site health
- wired and wireless health
- role-based infrastructure health
- summary metrics and counts

It does NOT:

- create Zabbix hosts per device or site
- perform per-client or MAC-level monitoring
- mirror Catalyst Center inventory into Zabbix hosts

---

## Data Model

Each Catalyst Center instance is represented by one Zabbix host.

- The main template links all domain templates
- Each domain template performs bulk collection
- Discovery creates items on the same host

Sites and devices are represented as **discovered entities**, not hosts.

---

## Site Template Behavior

The site template maps directly to the Catalyst Center `site-health` payload.

- Only sites with assurance data are discovered
- Empty hierarchy nodes are skipped
- Missing role metrics are treated as nullable

This prevents preprocessing failures and unnecessary item creation.

---

## Notes

These templates are intentionally conservative and based only on verified Catalyst Center payloads.

Unsupported or unverified metrics are excluded.

---

## Disclaimer

This project is provided as a community contribution.

- Not affiliated with Cisco Systems or Zabbix
- No guarantees of correctness, stability, or fitness for purpose
- No support is provided

This template depends on Catalyst Center APIs, which may change without notice.

Such changes may break functionality without warning.

This template is not production-certified and has not undergone formal QA validation.

USE AT YOUR OWN RISK.

By using this template, you agree that:

- You are responsible for validating it in your environment
- You assume all risks associated with its use

---

## License

MIT License

Copyright (c) 2026 mbechc

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND...

IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE...

