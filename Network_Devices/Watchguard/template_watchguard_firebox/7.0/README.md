# WatchGuard Firebox Enhanced Template

## Overview

Enhanced template for comprehensive monitoring of WatchGuard Firebox appliances with advanced BGP monitoring, hardware sensors, and VPN tracking. This template provides complete visibility into system health, network performance, VPN tunnels, high availability status, and hardware components across physical and virtual firewall deployments.

**Template Version:** 7.0  
**Compatible Firmware:** WatchGuard firmware v12.1+  
**Compatible Zabbix:** 6.0+  
**SNMP Support:** SNMPv2c (fully validated) / SNMPv3 (partially validated)

## Key Features

### 🔄 BGP Monitoring
- **BGP Neighbor Discovery**: Automatic discovery of BGP peers with relationship tracking
- **Session State Monitoring**: BGP session states (Established, Idle, Connect, Active)
- **Route Monitoring**: BGP route advertisement and received route counters
- **Peer Analytics**: BGP peer uptime and last state transition tracking
- **Performance Metrics**: BGP message statistics and error counters

### 🌐 Enhanced Interface Monitoring  
- **Multi-Interface Support**: Ethernet, Fiber (SFP/SFP+), VLAN, and BoVPN interfaces
- **Operational Status**: Real-time interface state monitoring with change detection
- **Traffic Analysis**: Detailed traffic monitoring with error rate calculations
- **Auto-Discovery**: Configurable interface filtering for HA-Link and unused ports
- **Performance Graphs**: Traffic overlays with trend analysis and error visualization

### 🔐 VPN Tunnel Monitoring
- **BoVPN Support**: Bovine VPN tunnel state and performance statistics  
- **Gateway VPN**: IPSec security association monitoring and metrics
- **Policy-Based VPN**: Subnet pair tracking and connection analytics
- **Connection Health**: VPN tunnel uptime and data transfer monitoring
- **Troubleshooting**: Connection failure detection and error reporting

### 🖥️ Hardware Sensor Monitoring
- **Temperature Sensors**: Multiple temperature probes with threshold alerts
- **Fan Monitoring**: Fan speed tracking and failure detection with predictive alerts
- **Power Supply**: PSU status monitoring and health validation
- **CPU & Memory**: Utilization tracking with performance baselines
- **Disk Monitoring**: Storage utilization and health status

### 📊 Monitoring Coverage

**Applications:** 8 monitoring categories
- System Information & Licensing
- BGP Protocol Monitoring  
- Interface Performance & Status
- VPN Tunnel Management
- Hardware Sensors & Health
- High Availability Clustering
- Security Features Status
- Performance Metrics

**Discovery Rules:** 8 active LLD rules
- BGP Neighbor Discovery
- Ethernet Interface Discovery (Physical ports)
- Fiber Interface Discovery (SFP/SFP+ ports)  
- VLAN Interface Discovery (Virtual interfaces)
- BoVPN Interface Discovery (VPN tunnels)
- Hardware Temperature Sensors
- System Fan Monitoring
- Power Supply Units

**Items:** 50+ monitoring items with optimized collection intervals
**Triggers:** 25+ intelligent triggers with configurable thresholds
**Graphs:** 30+ visualization graphs with performance overlays

## Configuration Requirements

### SNMP Configuration
Configure SNMP on your WatchGuard device:

```bash
# Enable SNMP v2c
configure snmp community public readonly
configure snmp sysLocation "Data Center Location"
configure snmp sysContact "network-admin@company.com"
```

### BGP Configuration
For BGP monitoring, ensure BGP is configured:

```bash
# Example BGP configuration
configure bgp as-number 65001
configure bgp neighbor 192.168.1.1 remote-as 65002
configure bgp neighbor 192.168.1.1 description "ISP-Connection"
```

### Interface Filtering
Customize interface discovery by modifying the interface filter regex in the discovery rule:
- **Default Filter**: `^(eth|en|em|p\d+p\d+)`
- **Exclude HA-Link**: `^(?!.*ha-link).*`
- **Exclude Virtual**: `^(?!.*(vif|virtual)).*`

## Monitoring Capabilities

### System Health
- Device uptime and availability monitoring
- Firmware version tracking and compliance
- Serial number and hardware identification
- Feature licensing status and expiry monitoring

### Network Performance
- Interface utilization with baseline comparison
- Traffic pattern analysis and anomaly detection
- Error rate monitoring with threshold alerting  
- VLAN performance tracking across virtual interfaces

### Security Features
- Application Control licensing and status
- Content Filtering feature monitoring
- Gateway AV status and signature updates
- Feature expiry notifications with advance warning

### High Availability
- Cluster synchronization status monitoring
- Primary/secondary member health validation
- Failover detection and alert notifications
- Member role identification and status tracking

## Troubleshooting

### Common Issues

**SNMP Connection Problems:**
- Verify SNMP community string configuration
- Check firewall rules for SNMP traffic (UDP 161)
- Validate WatchGuard firmware version compatibility

**BGP Discovery Issues:**
- Ensure BGP is enabled and configured on the device
- Verify BGP neighbor relationships are established
- Check SNMP OID support for BGP MIB on your firmware version

**Interface Discovery Problems:**
- Review interface filter regex patterns
- Check interface naming conventions on your model
- Verify SNMP interface table population

**VPN Monitoring Issues:**
- Confirm VPN tunnels are configured and active
- Validate SNMP access to VPN statistics MIBs
- Check tunnel naming conventions for discovery rules

### Performance Optimization

**Collection Intervals:**
- **High Priority Items**: 60 seconds (CPU, Memory, Interface status)
- **Medium Priority Items**: 300 seconds (Temperature, Fan speed)
- **Low Priority Items**: 3600 seconds (Firmware version, Serial number)

**Discovery Intervals:**
- **Network Interfaces**: 3600 seconds (hourly discovery)
- **BGP Neighbors**: 3600 seconds (BGP peer changes are infrequent)
- **Hardware Sensors**: 86400 seconds (daily discovery)

## Template History

- **v7.0**: Enhanced template with BGP monitoring, hardware sensors, and VPN tracking
- **v6.0**: Original template (replaced by this enhanced version)

## Support and Documentation

For additional configuration examples and troubleshooting:
- WatchGuard SNMP Documentation: https://www.watchguard.com/help/docs/wsm/xtm_11/en-us/content/en-us/basicadmin/snmp_about_mibs_c.html
- BGP Configuration Guide: https://www.watchguard.com/help/docs/fireware/12/en-us/content/en-us/dynamic_routing/bgp_configure_c.html
- VPN Configuration: https://www.watchguard.com/help/docs/fireware/12/en-us/content/en-us/bovpn/bovpn_about_c.html

## License

This template is provided under the same license as the Zabbix Community Templates repository.