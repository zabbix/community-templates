# Zabbix Template Proxmox VE REST API

This Zabbix template enables full monitoring of a Proxmox VE environment via the official REST API (Proxmox VE > 7.0). It collects host and container metrics, backup jobs, storage status, tasks, and user information, and automatically generates discovery rules for nodes, LXC containers, QEMU VMs, storage pools, running tasks, and API users.

---

## Requirements

- **Zabbix Server** version 7.0 or higher  
- **HTTP Agent** module enabled on the Zabbix server  
- Proxmox VE API token with read permissions for Nodes, Tasks, Storage, LXC, QEMU, and Access  
- Host macros defined on the Zabbix host object (see “Macros” section)
  
## 1. Create the Zabbix API User

1. **Log in**  
   - Open the Proxmox web interface.

2. **Create the user**  
   - Navigate to **Datacenter → Permissions → Users** → **Add**  
   - **User name:** `zabbix@pam`  
   - **Password:** (choose a strong password)  
   - **Email:** (optional)  
   - Click **Add**.

3. **Assign read-only role**  
   - Under **Datacenter → Permissions**, click **Add → User Permission**  
     - **Path:** `/`  
     - **User:** `zabbix@pam`  
     - **Role:** `PVEAuditor`  
   - Click **Add**.

---

## 2. Create the API Token with Privilege Separation

1. **Generate the token**  
   - Go to **Datacenter → API Tokens** → **Add**  
     - **User:** `zabbix@pam`  
     - **Token ID:** `Zabbix`  
   - Click **Add** and note the **Token Secret**.

2. **Grant token-specific permission**  
   - Go to **Datacenter → Permissions** → **Add**  
     - **Type:** **API Token**  
     - **Path:** `/`
     - **User/Group/API Token:** `Zabbix@pam!zabbix`  
     - **Role:** `PVEAuditor`
     - **Propagate:**  
   - Click **Add**.

## Installation

1. Download the template `Template Proxmox VE REST API.yaml`.  
2. In the Zabbix web interface, go to **Configuration → Templates → Import** and import the template.  
3. Create a new host:  
   - Go to **Configuration → Hosts → Create host**  
   - Enter a **Host name** (e.g. `proxmox01`)  
   - Assign the template **Template Proxmox VE REST API**  
   - Set the appropriate **Group** (e.g. `Linux servers`)  
   - Leave the **Interfaces** section empty (the template uses the API, not an agent)  
4. Configure the required host macros (see the “Macros” section of the documentation).

## Usage

1. Create an API token on the Proxmox host.  
2. Add or select the host in Zabbix.  
3. Assign the “Template Proxmox VE REST API” to the host.  
4. Configure macros on the host’s Template tab (API credentials, node name, etc.).  
5. Enable monitoring and check initial metrics under **Monitoring → Latest data**.

## Macros

### Required Macros

| Macro                   | Example Value      | Description                                          |
|-------------------------|--------------------|------------------------------------------------------|
| `{$PVE_IP}`             | `192.168.1.1`      | IP address or hostname of the Proxmox VE API server  |
| `{$PVE_PORT}`           | `8006`             | TCP port of the Proxmox API (default: 8006)          |
| `{$PVE_NODE}`           | `pve`              | Identifier of the Proxmox node                       |
| `{$PVE_API_USER}`       | `root@pam`         | API username including realm                         |
| `{$PVE_API_TOKEN_ID}`   | `Zabbix`           | Name/ID of the API token                             |
| `{$PVE_API_TOKEN}`      | **SECRET_TEXT**    | API token (store as a secret macro on the host)      |

### Optional Trigger Macros

| Macro                             | Example Value | Description                                                             |
|-----------------------------------|---------------|-------------------------------------------------------------------------|
| `{$ENABLE_BACKUP_ALERT}`          | `1`           | 1 = enable backup trigger, 0 = disable                                 |
| `{$ENABLE_NODE_STATUS_ALERT}`     | `1`           | 1 = enable node offline trigger, 0 = disable                           |
| `{$ENABLE_STORAGE_AVAILABLE_ALERT}`   | `1`       | 1 = enable low-space trigger, 0 = disable                              |
| `{$ENABLE_STORAGE_INACTIVE_ALERT}`    | `1`       | 1 = enable inactive storage trigger, 0 = disable                       |
| `{$ENABLE_TASK_ALERT}`            | `1`           | 1 = enable task failure trigger, 0 = disable                           |
| `{$ENABLE_TASK_STATUS_ALERT}`     | `1`           | 1 = enable general task status trigger, 0 = disable                   |
| `{$ENABLE_VM_STOP_ALERT}`         | `1`           | 1 = enable VM/LXC stop trigger, 0 = disable                            |
| `{$USER_EXPIRE_TIME}`             | `2d`          | Lead time (in days) for user-expiry trigger warning                    |

## Contents of the Template

### 2. Discovery Rules

| Discovery Rule       | Description                                                 |
|----------------------|-------------------------------------------------------------|
| **discover.nodes**   | Automatic detection of all Proxmox nodes                    |
| **discover.lxc**     | Detection of all LXC containers on the host                 |
| **discover.qemu**    | Detection of all QEMU/KVM VMs with LLD macros               |
| **discover.storage** | Listing of all storage pools and their status               |
| **discover.backup**  | Grouping and formatting of VZDUMP backup jobs               |
| **discover.tasks**   | Monitoring of all running tasks (excluding VZDUMP)          |
| **discover.users**   | Detection of all users and their expiration dates           |

### 3. Trigger Prototypes

- Backup failure  
- Node offline  
- Low storage & inactive storage  
- Task failure  
- VM/LXC stopped  
- User expiration (warning at configured lead time)

### Screenshots

<img width="2321" height="1147" alt="image" src="https://github.com/user-attachments/assets/d41f3f60-8220-4326-a2c2-6f28f1ffae57" />  
<img width="2321" height="1147" alt="image" src="https://github.com/user-attachments/assets/9d4975cd-bf00-4f17-a92f-a67c3d66f162" />  
<img width="2321" height="1147" alt="image" src="https://github.com/user-attachments/assets/0b1d7b96-e4a2-4b65-9879-0bf9dc69270b" />  
<img width="2321" height="1147" alt="image" src="https://github.com/user-attachments/assets/d95a382b-00eb-439c-9250-7e0b340ec453" />  
<img width="2321" height="1147" alt="image" src="https://github.com/user-attachments/assets/48d17e9c-71ae-4e27-8fbe-eb64c666a917" />
