# Sophos XG/SFOS IPsec Site-to-Site VPN Discovery

## Summary

This template is an enhanced version of the official community template for Sophos XG v18.

Starting with version 20, it is possible to monitor IPsec VPN tunnels, but manually by creating each item. I created the discovery rule for VPNs so that connections are discovered and reported in moni[...]  

* **Original template source:** [https://github.com/zabbix/community-templates/tree/main/Network_Devices/template_sophos_xg_firewall_version_18.0.x/6.0](https://github.com/zabbix/community-templates/t[...]  

This version includes all the original features, plus a new Low-Level Discovery (LLD) rule for IPsec Site-to-Site VPN tunnels.

## Zabbix Version

Tested on **Zabbix 7.0**.

---

### New Feature Added: IPsec Site-to-Site VPN Discovery

This LLD rule automatically discovers all IPsec tunnels configured on a Sophos firewall (SFOS) and creates items and triggers to monitor their status.

**Discovered Items:**
* **Connection Status:** Monitors the real-time connection status (Active, Inactive, Partially Active) using the OID `1.3.6.1.4.1.2604.5.1.6.1.1.1.1.9`.
* **Activation Status:** Monitors whether the tunnel is enabled or disabled in the firewall configuration using the OID `1.3.6.1.4.1.2604.5.1.6.1.1.1.1.10`.

**Trigger Prototypes:**
* Includes a smart trigger that only fires if a tunnel is **Enabled**, but its connection status is **Not Active (1)**. This logic prevents false positives for backup or intentionally disabled VPN lin[...]  

---

### Configuration Instructions

1. **Import the template file** (`template_sophos_xg_ipsec_vpn.yaml`) into your Zabbix instance under `Configuration -> Templates`. 2. Value maps already created in the templates:

* **Name:** `Sophos VPN Connection Status`
* `0` -> `Inactive`
* `1` -> `Active`
* `2` -> `Partially Active`

* **Name:** `Sophos VPN Activation Status`
* `0` -> `Inactive`
* `1` -> `Active`

3. **Link the template** to your Sophos Firewall host.
4. **Configure the `{$SNMP_COMMUNITY}` macro on the host with your SNMP community string.