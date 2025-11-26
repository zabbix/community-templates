# Pi-hole Monitoring Template for Zabbix (APP-Pi-hole by HTTP)

## Description

This Zabbix template allows you to monitor your Pi-hole instance using its HTTP API. It retrieves various metrics related to Pi-hole's performance, system health, and DNS query statistics.

Key features include:
* Monitoring of DNS query statistics (total, blocked, cached, forwarded).
* Tracking of client activity and top lists (clients, domains, blocked domains).
* System health monitoring (CPU, memory, swap, temperature, uptime).
* Status of Pi-hole services (blocking, DHCP, DNSSEC).
* Version tracking for Pi-hole components (Core, FTL, Web, Docker).
* Detection of API errors and important Pi-hole messages.

**Important:**
* Ensure you configure the necessary macros: `{$PIHOLE.API.URL}` and `{$PIHOLE.PASSWORD}`.
* Some metrics might not be collected depending on your specific Pi-hole setup and usage.

## Template Group

* Templates

## Macros

The following macros need to be configured for the template to function correctly:

| Macro                          | Description                                                                 | Default Value |
| :----------------------------- | :-------------------------------------------------------------------------- | :------------ |
| `{$PIHOLE.API.URL}`            | The Pi-hole API endpoint URL (e.g., `<scheme>://<host/fqdn>:<port>/api`). |               |
| `{$PIHOLE.PASSWORD}`           | The password for the Pi-hole web interface.                         |               |
| `{$PIHOLE.SYSTEM.CPU.MAX.WARN}` | CPU utilization warning threshold (%).                              | `90`          |
| `{$PIHOLE.SYSTEM.MEMORY.MAX.WARN}` | Memory utilization warning threshold (%).                             | `90`          |
| `{$PIHOLE.SYSTEM.SWAP.MAX.WARN}` | Swap utilization warning threshold (%).                               | `90`          |

## Items

This template utilizes a master item (`pihole.get.metrics`) which is a script that fetches data from the Pi-hole API. All other items are dependent on this master item and use JSONPath preprocessing to extract specific values.

Key item categories and examples:

**Client Statistics:**
* `pihole.clients.active`: Active clients.
* `pihole.clients.total`: Total clients.

**System & Health:**
* `pihole.dhcp.status`: DHCP status (triggers if not "enabled").
* `pihole.dnssec.status`: DNSSEC status (triggers if not "true").
* `pihole.get.errors`: Errors from API requests (triggers if errors are present).
* `pihole.get.messages`: Severity of messages from Pi-hole (triggers on "Warning" or "Error").
* `pihole.status.blocking`: Blocking status (triggers if not "enabled").
* `pihole.system.cpu.temp`: CPU temperature (Celsius).
* `pihole.system.cpu.util`: CPU utilization (%).
* `pihole.system.node_name`: Host name of the Pi-hole node.
* `pihole.system.ram.available`: Available memory (Bytes).
* `pihole.system.ram.free`: Free memory (Bytes).
* `pihole.system.ram.pused`: Used memory (%).
* `pihole.system.ram.total`: Total memory (Bytes).
* `pihole.system.ram.used`: Used memory (Bytes).
* `pihole.system.swap.free`: Free swap (Bytes).
* `pihole.system.swap.pused`: Used swap (%).
* `pihole.system.swap.total`: Total swap (Bytes).
* `pihole.system.swap.used`: Used swap (Bytes).
* `pihole.system.uptime`: System uptime (seconds).

**Gravity & Top Lists:**
* `pihole.gravity.domains_being_blocked`: Domains on the blocklist.
* `pihole.gravity.top_blocked`: Top blocked domain.
* `pihole.gravity.top_client`: Top client.
* `pihole.gravity.top_domain`: Top domain.

**Query Statistics:**
* `pihole.queries.blocked`: Queries blocked.
* `pihole.queries.cached`: Queries cached.
* `pihole.queries.forwarded`: Queries forwarded.
* `pihole.queries.pblocked`: Queries blocked (%).
* `pihole.queries.total`: Total queries.
* `pihole.queries.unique_domains`: Unique domains queried.

**Query Reply Types (e.g.):**
* `pihole.queries.replies_blob`: Query reply: BLOB.
* `pihole.queries.replies_cname`: Query reply: CNAME.
* `pihole.queries.replies_dnssec`: Query reply: DNSSEC.
* `pihole.queries.replies_domain`: Query reply: DOMAIN.
* `pihole.queries.replies_ip`: Query reply: IP.
* `pihole.queries.replies_nodata`: Query reply: NODATA.
* `pihole.queries.replies_nxdomain`: Query reply: NXDOMAIN.
* `pihole.queries.replies_servfail`: Query reply: SERVFAIL.
* ... and many others.

**Query Types (e.g.):**
* `pihole.queries.type_a`: Query type: A.
* `pihole.queries.type_aaaa`: Query type: AAAA.
* `pihole.queries.type_any`: Query type: ANY.
* `pihole.queries.type_https`: Query type: HTTPS.
* `pihole.queries.type_ptr`: Query type: PTR.
* ... and many others.

**Version Information:**
* `pihole.version.core`: Core version (triggers on change).
* `pihole.version.docker`: Docker version (triggers on change).
* `pihole.version.ftl`: FTL version (triggers on change).
* `pihole.version.web`: Web version (triggers on change).

## Triggers

The template includes several triggers to alert on various conditions:

**Service Health & Configuration:**
* `DHCP is disabled`: Fires if DHCP is not reported as "enabled". Priority: HIGH.
* `DNSSEC is disabled`: Fires if DNSSEC is not reported as "true". Priority: WARNING.
* `Blocking is disabled`: Fires if blocking is not reported as "enabled". Priority: AVERAGE.
* `There are errors in requests to API`: Fires if the API reports errors. Priority: HIGH.
* `Message severity Error`: Fires if Pi-hole reports messages with error severity. Priority: HIGH.
* `Message severity Warning`: Fires if Pi-hole reports messages with warning severity. Priority: WARNING.

**Performance & System:**
* `High CPU usage`: Fires if CPU utilization exceeds `{$PIHOLE.SYSTEM.CPU.MAX.WARN}`. Priority: WARNING.
* `High memory utilization`: Fires if memory utilization exceeds `{$PIHOLE.SYSTEM.MEMORY.MAX.WARN}`. Priority: WARNING.
* `High swap utilization`: Fires if swap utilization exceeds `{$PIHOLE.SYSTEM.SWAP.MAX.WARN}`. Priority: WARNING.

**DNS Query Behavior:**
* `Low percentage of blocked queries`: Fires if the percentage of blocked queries is below 15%. Priority: WARNING.
* `NOTIMP DNS replies detected`: Fires if "NOTIMP" (Not Implemented) DNS replies are detected. Priority: HIGH.
* `REFUSED DNS replies detected`: Fires if "REFUSED" DNS replies are detected. Priority: HIGH.
* `SERVFAIL DNS replies detected`: Fires if "SERVFAIL" DNS replies are detected. Priority: HIGH.
* `UNKNOWN DNS replies detected`: Fires if "UNKNOWN" DNS replies are detected. Priority: HIGH.
* `Unusual high NODATA rate`: Fires if the rate of NODATA replies is unusually high compared to total queries. Priority: HIGH.
* `Unusual high NXDOMAIN rate`: Fires if the rate of NXDOMAIN replies is unusually high compared to total queries. Priority: HIGH.

**Version Changes (Informational):**
* `Core Version has changed`: Priority: INFO.
* `Docker Version has changed`: Priority: INFO.
* `FTL Version has changed`: Priority: INFO.
* `Web Version has changed`: Priority: INFO.

## Discovery Rules

This template does not use Low-Level Discovery (LLD) rules.

## Dashboards

The template includes a dashboard named "Pi-hole" with two pages:
1.  **Statistics:** Displays widgets for total queries, queries blocked, queries blocked %, domains on blocklist, active clients, top client, top blocked domain, DNS query types (pie chart), DNS query replies (pie chart), and queries over the last 24 hours (graph).
2.  **System:** Displays gauges for CPU, RAM, and Swap utilization, as well as honeycomb widgets for a system overview and system health, summarizing various items.

## Graphs

The template provides several predefined graphs:
* **Memory:** Shows available, free, used, and total memory.
* **Queries Upstream:** Displays blocked, cached, forwarded, and total queries.
* **Query replies:** Shows counts for various DNS reply types (BLOB, CNAME, DNSSEC, etc.).
* **Query types:** Shows counts for various DNS query types (A, AAAA, ANY, etc.).
* **Swap:** Shows free, total, and used swap space.

## Setup

1.  Import the template into your Zabbix server.
2.  Link the template to the host representing your Pi-hole instance.
3.  Configure the User Macros on the host:
    * `{$PIHOLE.API.URL}`: Set this to your Pi-hole API endpoint (e.g., `http://pi.hole/admin/api.php` or `http://<your-pihole-ip>/admin/api.php` if using the older API, or the new API format `<scheme>://<host/fqdn>:<port>/api` as per the macro description). The script seems tailored for the newer `/api/...` structure.
    * `{$PIHOLE.PASSWORD}`: Set this to your Pi-hole web interface password.
4.  Adjust other macros like `{$PIHOLE.SYSTEM.CPU.MAX.WARN}` if needed.
5.  Allow some time for Zabbix to start collecting data.

## Value Maps
A value map named `Message severity` is defined for the `pihole.get.messages` item:
* `0`: No error
* `1`: Warning
* `2`: Error

## Ideas
* Simple Checks for availability of NTP, DHCP and DNS Service
* Observe Upstream DNS Performance
