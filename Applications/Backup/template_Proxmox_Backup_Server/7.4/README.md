# Zabbix Template: Proxmox Backup Server via HTTPS API

Zabbix template for monitoring **Proxmox Backup Server (PBS)** using the HTTPS API.

---

## Overview

This template collects key metrics from a Proxmox Backup Server using its built-in HTTPS REST API. 
It includes items, triggers, and discovery rules for:

- Datastores (size, usage, available space)
- Verification status
- GC & pruning logs

Tested with:
- PBS v3.4.2 and Zabbix 7.4

---


PBS must have the API accessible from the Zabbix server/proxy. 

**Authentication uses a PBS API token.**

---

## Setup Instructions

1. **Import the Template**
   - Go to **Data collection → Templates → Import**
   - Upload the file: `template_PBS_by_https.yaml`

2. **Create a new Host**
   - Add a PBS host in Zabbix
   - Assign this template
   - Set the following **Macros**:

| Macro                         | Description                        |
|------------------------------|------------------------------------|
| `{$PBS.HOST}`                 | PBS IP/FQDN  |
| `{$PBS.TOKEN_ID}`            | PBS API Token ID  |
| `{$PBS.TOKEN.SECRET}`        | PBS API Token Secret               |

---

## Author

This template was originally developed by nikosch86 and then heavily modified and extended by Voltkraft


---
