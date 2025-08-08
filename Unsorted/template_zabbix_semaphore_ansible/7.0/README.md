# Zabbix Template Semaphore Ansible Task Monitoring

This Zabbix template enables agentless monitoring of Ansible Semaphore via its REST API. It dynamically discovers Semaphore templates in a project, fetches each template’s last task status, maps statuses to numeric values, and can trigger alerts on failures.

---

## Requirements

- **Zabbix Server** version 7.0 or higher  
- Ansible Semaphore instance with API access  
- Valid API token set in macro `{$API_TOKEN}`  
- Host macros defined on the Zabbix host object (see “Macros” section)

---

## 1. Create an API Token in Semaphore

1. **Log in**  
   - Open the Ansible Semaphore web interface and authenticate.

2. **Generate the Token**  
   - Navigate to **User → API Tokens** (or similar in your Semaphore version) and click **Create Token**.  
---

## Installation

1. **Import into Zabbix**  
   - In Zabbix go to **Configuration → Templates → Import** and select the YAML file.

2. **Create a Host**  
   - Go to **Configuration → Hosts → Create host**  
     - **Host name:** `semaphore01`  
     - **Groups:** e.g. `Templates`  
     - **Interfaces:** leave empty  
     - **Templates:** **Zabbix Template Semaphore Task Monitoring**

3. **Configure Macros**  
   - On the host’s **Macros** tab, set required values (see next section).

---

## Usage

1. Ensure your Semaphore API token and URL are reachable from the Zabbix server.  
2. Verify the host is linked to **Zabbix Template Semaphore Task Monitoring**.  
3. On the host’s **Template** tab, populate macros for API credentials, project ID, and triggers.  
4. Check data under **Monitoring → Latest data** for `semaphore.raw` and `task.status[{#ID}]`.  
5. Review alerts under **Monitoring → Triggers**.

---

## Macros

### Required Macros

| Macro                 | Example Value                           | Description                                       |
|-----------------------|-----------------------------------------|---------------------------------------------------|
| `{$API_TOKEN}`        | **SECRET_TEXT**                         | Semaphore API token (Bearer token)                |
| `{$SEMAPHORE_URL}`    | `http://192.168.10.105:3000`            | Base URL of the Semaphore API (including port)    |
| `{$PROJECT_NUMBER}`   | `1`                                     | ID of the Semaphore project to monitor            |

### Optional Trigger Macro

| Macro               | Default | Description                                      |
|---------------------|---------|--------------------------------------------------|
| `{$ENABLE_TRIGGER}` | `1`     | Enable task-failure alerts (1 = enabled, 0 = off)|

---

## Contents of the Template

### Items

- **semaphore.raw**  
  - **Type:** HTTP agent  
  - **Key:** `semaphore.raw`  
  - **Fetches:** `{$SEMAPHORE_URL}/api/project/{$PROJECT_NUMBER}/templates`

### Discovery Rule

- **semaphor-discover**  
  - **Type:** Dependent on `semaphore.raw`  
  - **LLD macros:** `{#ID}`, `{#NAME}`, `{#LAST_TASK_ID}`, `{#STATUS}`  
  - **Item prototype:**  
    - **task.status[{#ID}]** – extracts and maps `last_task.status` to numeric values

### Trigger Prototypes

- **Task {#NAME} Task-ID {#LAST_TASK_ID} failed**  
  ```
  {last(/Zabbix Template Semaphore Task Monitoring/task.status[{#ID}])=2  
   and {$ENABLE_TRIGGER:"{#ID}"}=1}  
  ```  
  - **Severity:** Warning  
  - **Manual close:** Yes  

---

## Value Maps

- **Task-status**  

| Value | Meaning  |
|-------|----------|
| `0`   | stopped  |
| `1`   | success  |
| `2`   | error    |
| `3`   | running  |
| `4`   | waiting  |

---

> **Source:** https://github.com/Garfieldttt/zabbix-semaphore/tree/zabbix
