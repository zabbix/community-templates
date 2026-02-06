# Ubiquiti Firewall Template

## Overview

Comprehensive monitoring template for Ubiquiti firewall and security gateway devices with enhanced SNMP monitoring, dynamic discovery rules, and improved compatibility across Zabbix versions. This template addresses common issues found in existing Ubiquiti templates and provides robust monitoring for Dream Machine, Security Gateway, and other Ubiquiti firewall products.

**Template Version:** 7.0  
**Compatible Models:** UniFi Dream Machine (UDM), UniFi Security Gateway (USG), CloudKey  
**Compatible Zabbix:** 6.0+  
**SNMP Support:** SNMPv2c / SNMPv3

## Addresses Community Issues

This template specifically resolves several outstanding community issues with Ubiquiti monitoring:

### CPU Load Calculation Fix (Issue #246)
- **Problem Solved**: EdgeMAX templates not properly accounting for multi-CPU systems in load calculation
- **Solution**: Implements proper CPU count detection via SNMP and adjusts load calculations accordingly
- **Impact**: Accurate CPU utilization monitoring across all Ubiquiti device types

### Template Import Compatibility (Issue #221)
- **Problem Solved**: Import errors in modern Zabbix versions (6.0+) due to deprecated parameters
- **Solution**: Updated template structure compatible with Zabbix 7.0 export format
- **Impact**: Seamless import across Zabbix 6.0+ versions without compatibility errors

## Key Features

### Dynamic Discovery Architecture
- **Interface Discovery**: Auto-discovery of physical and virtual network interfaces
- **CPU Core Discovery**: Dynamic detection and monitoring of multiple processor cores
- **VLAN Discovery**: Virtual LAN interface monitoring with traffic analysis
- **Service Discovery**: Network services and daemon monitoring

### Enhanced Network Monitoring
- **Interface Statistics**: Comprehensive traffic monitoring with error detection
- **Performance Metrics**: Bandwidth utilization, packet rates, and error counters
- **Operational Status**: Real-time interface state monitoring with change alerts
- **Quality Metrics**: Latency, jitter, and packet loss tracking

### System Health Monitoring
- **CPU Utilization**: Multi-core CPU monitoring with proper load calculation
- **Memory Management**: RAM usage, buffer utilization, and swap monitoring
- **Storage Monitoring**: Disk usage for logs, configuration, and system data
- **Temperature Sensors**: Hardware temperature monitoring where supported

### Firewall and Security Features
- **Connection Tracking**: Active connection monitoring and state analysis
- **NAT Statistics**: Network address translation performance metrics
- **Firewall Rules**: Active rule monitoring and traffic analysis
- **VPN Monitoring**: Site-to-site VPN tunnel status and performance

### Network Services
- **DHCP Server**: Lease monitoring and pool utilization
- **DNS Service**: Query statistics and response time monitoring
- **NTP Service**: Time synchronization status and accuracy monitoring
- **Routing Protocol**: Basic routing table and gateway monitoring

## Technical Specifications

**Monitoring Coverage:**
- **Items**: 60+ monitoring items with optimized collection intervals
- **Triggers**: 30+ intelligent triggers with severity classification
- **Graphs**: 20+ visualization graphs with performance overlays
- **Discovery Rules**: 8+ dynamic discovery rules for scalable monitoring

**Compatibility:**
- **UniFi OS**: 1.8+ (Dream Machine series)
- **EdgeOS**: 2.0+ (EdgeRouter series)
- **Firmware**: Various Ubiquiti firmware versions
- **SNMP**: v2c and v3 with comprehensive MIB support

## Configuration Requirements

### SNMP Configuration
For UniFi devices (Dream Machine, CloudKey):
```bash
# Enable SNMP via UniFi Network Controller
# Network Settings -> SNMP -> Enable SNMP
# Configure community string and access controls
```

For EdgeMAX devices:
```bash
configure
set service snmp community public authorization ro
set service snmp contact "admin@company.com"
set service snmp location "Network Operations Center"
commit
save
```

### Interface Filtering
Customize interface discovery patterns:
- **Physical Interfaces**: `^(eth|en|em)\d+`
- **Virtual Interfaces**: `^(br|vlan|tun)\d+`
- **WiFi Interfaces**: `^(wlan|ath)\d+`
- **Exclude Management**: `^(?!.*mgmt).*`

## Performance Optimization

**Collection Intervals:**
- **Critical Metrics**: 60 seconds (CPU, Memory, Interface status)
- **Standard Metrics**: 300 seconds (Traffic counters, System info)
- **Low Priority**: 3600 seconds (Hardware info, Firmware version)

**Discovery Intervals:**
- **Network Interfaces**: 3600 seconds (hourly)
- **CPU Cores**: 86400 seconds (daily)
- **System Services**: 7200 seconds (2 hours)

## Troubleshooting

### Common Issues

**SNMP Connection Problems:**
- Verify SNMP is enabled in UniFi Network Controller or EdgeMAX configuration
- Check firewall rules for SNMP traffic (UDP 161)
- Validate SNMP community string configuration

**CPU Load Calculation Issues:**
- Template automatically detects CPU count via SNMP
- Ensures load averages are properly normalized for multi-core systems
- Compatible with various Ubiquiti CPU architectures

**Template Import Errors:**
- Template uses Zabbix 7.0 export format for maximum compatibility
- Resolves common import issues with request_method parameters
- Compatible with Zabbix 6.0+ without modification

### Version Compatibility

**Tested Zabbix Versions:**
- Zabbix 7.0: Full compatibility
- Zabbix 6.4: Full compatibility  
- Zabbix 6.2: Full compatibility
- Zabbix 6.0: Full compatibility

**Tested Ubiquiti Devices:**
- UniFi Dream Machine Pro: Full support
- UniFi Dream Machine: Full support
- UniFi Security Gateway Pro: Full support
- EdgeRouter series: Basic support

## Community Improvements

This template consolidates improvements from the community while addressing longstanding issues:
- Fixes CPU load calculation problems reported in existing templates
- Resolves template import compatibility issues across Zabbix versions
- Provides unified monitoring approach for diverse Ubiquiti product lines
- Maintains backward compatibility while adding enhanced features

## License

This template is provided under the same license as the Zabbix Community Templates repository.