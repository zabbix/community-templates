# DNS Name Resolution Monitoring Template (Zabbix 7.0)

## Overview

This Zabbix template provides active monitoring of DNS name resolution by validating a configurable list of A records against one or more DNS servers using an external Python script.

It is designed to detect:

- DNS resolution failures
- DNS latency degradation
- Incorrect or unreachable DNS responses

The template uses Zabbix Low-Level Discovery (LLD) combined with external checks and dependent items for efficient monitoring.

---

## Features

- Automatic discovery of configured domain list
- DNS A record resolution validation
- Response time measurement (ms)
- IP address extraction from DNS response
- Error tracking for failed resolutions
- Triggering on:
  - DNS resolution failure
  - High DNS response latency

---

## Requirements

- Zabbix 7.0+
- Python 3
- Python module: `dnspython` (`pip install dnspython`)
- External scripts enabled in Zabbix server: `EnableExternalScripts=1`
- Script placed in Zabbix external scripts directory: `/usr/lib/zabbix/externalscripts/`

---

## Installation

### 1. Copy Script

Place the script into the Zabbix external scripts directory:

```bash
cp dns-resolver.py /usr/lib/zabbix/externalscripts/
chmod +x /usr/lib/zabbix/externalscripts/dns-resolver.py
```

### 2. Import Template

Import the template file into Zabbix:

> **Configuration → Templates → Import → DNS Name Resolution.yaml**

### 3. Link Template

Assign the template to a host or a dedicated monitoring host.

---

## Macros

The template requires the following macros:

| Macro | Description | Example |
|---|---|---|
| `{$A_RECORD_LIST}` | Comma-separated list of domains to monitor | `google.com,microsoft.com` |
| `{$DNS_SERVER}` | DNS server(s) to query | `8.8.8.8,1.1.1.1` |
| `{$DNS_RTT_THRESHOLD}` | Maximum acceptable DNS response time (ms) | `100` |

---

## How It Works

### 1. Discovery Rule

The discovery rule:

```
dns-resolver.py["discover","{$A_RECORD_LIST}"]
```

Splits the comma-separated domain list and creates LLD objects:

```json
{ "{#HOSTNAME}": "google.com" }
```

### 2. DNS Check Item

For each discovered hostname:

```
dns-resolver.py["check","{#HOSTNAME}","{$DNS_SERVER}"]
```

Returns JSON:

```json
{
  "success": true,
  "ip": "142.250.185.14",
  "response_time_ms": 12.34,
  "error": ""
}
```

### 3. Dependent Items

From the master JSON item, the following are extracted:

- IP Address
- Error message
- Response time
- Success status

---

## Triggers

### 1. DNS Resolution Failure

Triggers when DNS resolution fails for 3 minutes:

```
max(/DNS Name Resolution/dns.resolution.success.[{#HOSTNAME}],3m)=0
```

**Severity:** High

### 2. High DNS Latency

Triggers when response time exceeds threshold:

```
min(/DNS Name Resolution/dns.resolution.responsetime.[{#HOSTNAME}],3m) > {$DNS_RTT_THRESHOLD}
```

**Severity:** High

---

## Script Modes

### Discover Mode

```bash
dns-resolver.py discover "google.com,microsoft.com"
```

Output:

```json
{
  "data": [
    {"{#HOSTNAME}": "google.com"},
    {"{#HOSTNAME}": "microsoft.com"}
  ]
}
```

### Check Mode

```bash
dns-resolver.py check google.com 8.8.8.8,1.1.1.1
```

Output:

```json
{
  "success": true,
  "ip": "142.250.185.14",
  "response_time_ms": 10.2,
  "error": ""
}
```

---

## Use Cases

- Validate public DNS reliability (Google, Cloudflare, etc.)
- Monitor internal DNS resolvers
- Detect DNS outages or latency spikes
- Baseline DNS performance across environments

---

## Troubleshooting

### No discovery results

- Check macro format (comma-separated)
- Ensure script is executable
- Validate Zabbix external scripts path

### DNS resolution fails

- Verify DNS server reachability
- Check firewall rules (UDP/TCP 53)

### High response time spikes

- Check resolver load
- Test DNS server independently:

```bash
dig @8.8.8.8 google.com
```

---

## Notes

- Designed for lightweight external script execution
- Uses JSON-based dependent item parsing
- Suitable for both internal and external DNS monitoring
