# Zabbix Template Proxmox Backup Server by HTTP

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This Zabbix template enables full monitoring of a Proxmox Proxmox Backup Server via the official REST API. It collects host metrics, datastore status, disk status, services, and subscription information, and automatically generates discovery rules for datastores disks, zfs pools and running services.

---

## Requirements

- **Zabbix Server** version 7.4 or higher  
- **HTTP Agent** module enabled on the Zabbix server  
- Proxmox Backup Server API token with read permissions for System and Datastores
- Host macros defined on the Zabbix host object (see “Macros” section)
  
## 1. Create the Zabbix API User

1. **Log in**  
   - Open the Proxmox Backup Server web interface.

2. **Create the user**  
   - Navigate to **Access Control → User Management → **Add**
   - **User name:** `zabbix@pbs`
   - **Password:** (choose a strong password)
   - **Email:** (optional)
   - Click **Add**.

3. **Assign Audit role**
   - Under **Access Control → Permissions**, click **Add → User Permission**  
     - **Path:** `/`
     - **User:** `zabbix@pbs`
     - **Role:** `Audit`
   - Click **Add**.

4. **Assign DatastoreAudit role**
   - Under **Access Control → Permissions**, click **Add → User Permission**  
     - **Path:** `/datastore`
     - **User:** `zabbix@pbs`
     - **Role:** `DatastoreAudit`
   - Click **Add**.

---

## 2. Create the API Token with Privilege Separation

1. **Generate the token**  
   - Go to **Access Control → API Tokens** → **Add**
     - **User:** `zabbix@pbs`
     - **Token ID:** `Zabbix`
   - Click **Add** and note the **Token Secret**.

2. **Assign Audit role**
   - Go to **Datacenter → Permissions** → **Add → API Token Permission**
     - **Path:** `/`
     - **User/Group/API Token:** `zabbix@pbs!Zabbix`
     - **Role:** `Audit`
   - Click **Add**.

3. **Assign DatastoreAudit role**
   - Go to **Datacenter → Permissions** → **Add → API Token Permission**
     - **Path:** `/datastore`
     - **User/Group/API Token:** `zabbix@pbs!Zabbix`
     - **Role:** `DatastoreAudit`
   - Click **Add**.

## Installation

1. Download the template `template_proxmox_backup_server_by_http.yaml`.  
2. In the Zabbix web interface, go to **Configuration → Templates → Import** and import the template.  
3. Create a new host:
   - Go to **Configuration → Hosts → Create host**
   - Enter a **Host name** (e.g. `pbs01`)
   - Assign the template **Template Proxmox Backup Server by HTTP**
   - Set the appropriate **Group** (e.g. `Linux servers`)
   - Leave the **Interfaces** section empty (the template uses the API, not an agent)
4. Configure the required host macros (see the “Macros” section of the documentation).

## Usage

1. Create an API token on the Proxmox Backup Server.  
2. Add or select the host in Zabbix.
3. Assign the “Template Proxmox Backup Server by HTTP” to the host.
4. Configure macros on the host’s Template tab (API credentials, node name, etc.).
5. Enable monitoring and check initial metrics under **Monitoring → Latest data**.

## Macros

### Required Macros

| Macro                   | Example Value      | Description                                          |
|-------------------------|--------------------|------------------------------------------------------|
| `{$PBS.URL.HOST}`       | `192.168.1.1`      | IP address or hostname of the Proxmox Backup Server  |
| `{$PBS.URL.PORT}`       | `8007`             | TCP port of the Proxmox API (default: 8007)          |
| `{$PBS.TOKEN.ID}`       | `zabbix@pbs!Zabbix`| Name/ID of the API token                             |
| `{$PBS.TOKEN.SECRET}`   | **SECRET_TEXT**    | API token (store as a secret macro on the host)      |

## Contents of the Template

### 1. Discovery Rules

| Discovery Rule                   | Description                                                 |
|----------------------------------|-------------------------------------------------------------|
| **proxmox.datastore.discovery**  | Detection of all datastores                                 |
| **proxmox.node.discovery**       | Detection of all nodes (currently only localhost)           |
| **proxmox.disk.discovery**       | Detection of all disks                                      |
| **proxmox.disk.ssd.discovery**   | Detect if disk is SSD                                       |
| **proxmox.service.discovery**    | Detection of all running services                           |
| **proxmox.zfs.discovery**        | Detection of all zfs pools                                  |

### 2. Trigger Prototypes

- Low space on datastore
- ZFS health
- SSD wearout
- Service failure
- Node performance issues
- Subscription check

## Related Projects

- [Official Zabbix Templates](https://www.zabbix.com/integrations)
- [Proxmox Backup Server API](https://pbs.proxmox.com/docs/api-viewer/index.html)

## License

This project is licensed under the MIT License.

## Author

Bernd Krumböck (krumboeck@universalnet.at)
This template started as clone from Proxmox VE template and was also inspired by "Proxmox Backup Server via HTTPS API" template from nikosch86 and Voltkraft.

## Disclaimer

This template is provided as-is. Test thoroughly in your environment before production use. The author is not responsible for any issues that may arise from using this template.

