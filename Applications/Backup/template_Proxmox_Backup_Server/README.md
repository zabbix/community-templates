# Zabbix Template: Proxmox Backup Server via HTTPS API

Official-style Zabbix template for monitoring **Proxmox Backup Server (PBS)** using the HTTPS API.

---

## Overview

This template collects key metrics from a Proxmox Backup Server using its built-in HTTPS REST API. 
It includes items, triggers, and discovery rules for:

- Datastores (size, usage, available space)
- Verification status
- GC & pruning logs
- System information (uptime, version, hostname)

Tested with:
- PBS v3.x and Zabbix 6.0/6.4
- HTTPS-only communication

---

## Features

| Feature                  | Description                                    |
|--------------------------|------------------------------------------------|
| ✅ API-based             | Uses token-based HTTPS authentication         |
| 📦 Datastore discovery  | Auto-discovers all datastores                 |
| 🚨 Trigger support       | Warnings for low space, failed verifications |
| 📈 Graphs & preprocessing| Built-in calculation of free space %         |
| 🧪 Last verify check     | Monitors latest snapshot verification status |

---

## Requirements

| Component | Version          |
|-----------|------------------|
| Zabbix    | 6.0 LTS or newer |
| PBS       | 3.x              |

PBS must have the API accessible from the Zabbix server/proxy. 

**Authentication uses a PBS API token.**

---

## Setup Instructions

1. **Import the Template**
   - Go to **Configuration → Templates → Import**
   - Upload the file: `template_PBS_by_https.yaml`

2. **Create a new Host**
   - Add a PBS host in Zabbix
   - Assign this template
   - Set the following **Macros**:

| Macro                         | Description                        |
|------------------------------|------------------------------------|
| `{$PBS.URL}`                 | Full PBS API URL (e.g. `https://pbs01:8007`) |
| `{$PBS.TOKEN_ID}`            | PBS API Token ID (e.g. `zabbix@pbs!monitor`) |
| `{$PBS.TOKEN_SECRET}`        | PBS API Token Secret               |

3. **Optional Macros** (with defaults in template):

| Macro                         | Description                        |
|------------------------------|------------------------------------|
| `{$PBS.DS.FREE.MIN.CRIT}`    | Min. free space % before CRIT     |
| `{$PBS.DS.FREE.MIN.WARN}`    | Min. free space % before WARN     |

---

## Screenshots

> Add screenshots of graphs, triggers, etc. if available.

---

## Author

Created by Jan Paulzen 
Licensed under the [MIT License](LICENSE) or other open license of your choice.

---

## Known Limitations

- Only HTTPS API is supported (no SSH or SNMP).
- PBS Token must have read access to datastores and system status.

---

## Feedback & Contributions

Pull requests and improvements welcome! 
This is a community-maintained template.


