# Apache Airflow by HTTP (Zabbix 7.2 Template)

This Zabbix 7.2 template monitors the **Apache Airflow** service via its `/api/v2/monitor/health` endpoint.  
It collects component health statuses using HTTP agent and dependent items, and includes triggers for failure detection.

---

## Template Overview

| Component | Item Key | Type | Description |
|------------|-----------|------|--------------|
| DAG Processor | `airflow.dag_processor.status` | Dependent | Monitors the DAG Processor component status |
| Scheduler | `airflow.scheduler.status` | Dependent | Monitors the Scheduler component status |
| Triggerer | `airflow.triggerer.status` | Dependent | Monitors the Triggerer component status |
| Metadatabase | `airflow.metadatabase.status` | Dependent | Monitors the Airflow Metadata DB component status |
| Health Check | `airflow.health.raw` | HTTP Agent | Fetches raw health data from `/api/v2/monitor/health` |

---

## Required Macro

| Macro | Default Value | Description |
|--------|----------------|--------------|
| `{$AIRFLOW.URL}` | `http://localhost:8080` | Base URL of the Airflow API endpoint |

---

## Triggers

| Name | Expression | Severity | Description |
|------|-------------|-----------|--------------|
| Airflow API not reachable | `nodata(/Apache Airflow by HTTP/airflow.health.raw,10m)=1` | High | No API response for over 10 minutes |
| Airflow DAG processor unhealthy | `last(...dag_processor.status,#1)<>"healthy"` | Average | DAG Processor not healthy |
| Airflow scheduler unhealthy | `last(...scheduler.status,#1)<>"healthy"` | Average | Scheduler not healthy, DAG execution may fail |
| Airflow triggerer unhealthy | `last(...triggerer.status,#1)<>"healthy"` | Average | Triggerer component not healthy |
| Airflow metadatabase unhealthy | `last(...metadatabase.status,#1)<>"healthy"` | Average | Metadatabase component not healthy |

---

## Installation

1. Open **Data collection → Templates** in Zabbix UI.  
2. Click **Import**, select `airflow_template.yaml`.  
3. Ensure version compatibility (**Zabbix 7.2** or higher).  
4. Assign the template to a host that can reach the Airflow API.

---

## Source

Created by **foksk76**.  
Template repository: [https://github.com/foksk76/airflow_template](https://github.com/foksk76/airflow_template)
