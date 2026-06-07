# zabbix-template-nexaVM

Zabbix Template for NexaVM 
A professional-grade Zabbix template for monitoring NexaVM  using a hybrid approach: REST API for inventory/logical states and SNMP for deep performance metrics.

Overview
This template provides comprehensive monitoring of NexaVM infrastructures by leveraging the  API and the nexaVM-MIB. It is designed for efficiency, using a single Master Item to poll API data, thus reducing the load on the NexaVM Controller.

Features
Access Key Authentication: Securely connects using accessKeyId and accessKeySecret.

Automatic Discovery (LLD):

Automatically discovers and monitors all Virtual Machines.

Automatically discovers and monitors Compute Hosts.

Hybrid Metrics:

API-based: Real-time VM status (Running, Stopped, Paused).

SNMP-based: High-granularity performance data for Hosts (CPU Package Temp, Network Throughput, Disk I/O).

Optimized Performance: Preprocessing is used to convert raw SNMP counters into human-readable rates (bps, Bps).

Monitored Metrics
Virtual Machines
Status: Current operational state.

Inventory: UUID and Instance Name.

Compute Hosts (via SNMP)
CPU: Total Package Utilization (%) and Package Temperature.

Memory: Used percentage, Free/Available bytes.

Network: Inbound and Outbound traffic (bps).

Storage: Disk Read/Write throughput (Bps) and Total Used Capacity (%).

Requirements
Zabbix Version: 6.0 LTS or higher.

NexaVM Credentials: An Access Key ID and Access Key Secret with at least read-only permissions.

Connectivity: The Zabbix Server/Proxy must reach the NexaVM Controller on port 8080.

SNMP Setup: SNMP must be enabled on the Compute Hosts, and the Zabbix IP must be allowed in the SNMP configuration.

Installation & Setup
Import Template:

Download nexavm_template.yaml.

In Zabbix, navigate to Data collection > Templates > Import and upload the file.

Create Host:

Create a new Host in Zabbix representing the NexaVM Controller.

Assign the NexaVM by HTTP and SNMP template to this host.

Add an SNMP interface using the IP of the controller or the specific hosts.

Configure Macros:

Navigate to the Macros tab on the Host and fill in the following:

{$NEXAVM.URL}: The base URL (e.g., http://192.168.1.10:8080).

{$NEXAVM.user}: Your username

{$NEXAVM.password}: Your password encrypted SHA 512 ( echo -n "testo" | shasum -a 512 ) 

{$SNMP_COMMUNITY}: Your SNMP community string (default: public).

Verification:

Check Monitoring > Latest data to ensure the Master Item is receiving JSON data.

Wait for the Discovery rules to populate the VM and Host items.

License
This project is licensed under the MIT License - see the LICENSE file for details.

Author
Template created for the Zabbix Community.
