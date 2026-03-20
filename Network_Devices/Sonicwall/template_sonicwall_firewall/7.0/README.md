# SonicWall Firewall Enhanced Template

## Overview

Comprehensive enterprise-grade template for monitoring SonicWall Firewall appliances with dynamic discovery rules, advanced VPN monitoring, security services tracking, and flexible interface analysis. This template addresses the limitations of model-specific templates by providing a universal, dynamic, and enterprise-ready monitoring solution.

**Template Version:** 7.0  
**Compatible Models:** Universal SonicWall firewall series (TZ, NSA, NSa, SuperMassive, NSv)  
**Compatible Zabbix:** 7.0+  
**SNMP Support:** SNMPv2c / SNMPv3  
**Author:** Simon Jackson / @sjackson0109

## Key Improvements

### Dynamic Discovery vs. Hard-coded Items
- **Problem Solved**: Replaces rigid model-specific monitoring with flexible discovery rules
- **Universal Compatibility**: Works across multiple SonicWall models and firmware versions
- **Scalable Monitoring**: Auto-discovers interfaces, VPN tunnels, processors, and security policies
- **Enterprise Ready**: Supports multi-device deployments and HA clusters

### Comprehensive Interface Monitoring  
- **Auto-Discovery**: Dynamic detection of Ethernet, Fiber, VLAN, LAG/Bonded interfaces
- **Multi-Type Support**: Physical (Ethernet, Fiber), Virtual (VLAN, VTI), Aggregated (LAG)
- **Traffic Analysis**: Comprehensive traffic monitoring with error tracking and utilization
- **Operational Status**: Real-time interface state monitoring with administrative control
- **Flexible Filtering**: Configurable interface exclusion patterns (HA-Link, unassigned ports)

### Advanced VPN Monitoring
- **Policy-Based VPN**: Security association monitoring with subnet pair tracking
- **Route-Based VPN**: Virtual Tunnel Interface (VTI) performance and connection health
- **L2TP Tunnels**: Layer 2 tunneling protocol monitoring with traffic analysis
- **PPTP Tunnels**: Point-to-Point tunneling protocol performance tracking
- **SSL-VPN Monitoring**: User session tracking and connection analysis
- **IPSec Group VPN**: WAN Group VPN session monitoring
- **SSTP Monitoring**: Secure Socket Tunneling Protocol session tracking

### Security Services Monitoring
- **Gateway AntiVirus (GAV)**: Scan count, virus detection, and performance metrics
- **Intrusion Detection/Prevention (IDS/IPS)**: Attack detection, blocking statistics
- **Anti-Spyware**: Scan requests, threats blocked/detected, processing time
- **Mail Security**: Email scanning, spam/virus detection, throughput analysis
- **Real-time Statistics**: Performance metrics with configurable heartbeat discard

### System Health & Performance Monitoring
- **Multi-Core CPU**: Per-processor utilization with load balancing analysis
- **System Performance**: CPU utilization, memory usage, connection tracking
- **Connection Management**: Active connections, maximum capacity, usage percentage
- **Routing Intelligence**: IP route table monitoring and analysis
- **Device Management**: Administrator tracking, device identification

## Template Features

### Discovery Rules (9 Active LLD Rules)
1. **Processors Discovery**
   - **Key**: `cpu.discovery`
   - **Scope**: Multi-core CPU enumeration for load balancing analysis
   - **Update**: Hourly discovery with 2-minute utilization polling

2. **Interfaces (Ethernet) Discovery** 
   - **Key**: `ethernet.discovery`
   - **Types**: Physical RJ-45, vendor-specific Ethernet (ifType=6,117,127,128,161,560,561,800)
   - **Filters**: Excludes HA-Link interfaces and unassigned ports
   - **Update**: Hourly discovery with 2-minute traffic monitoring

3. **Interfaces (Fibre) Discovery**
   - **Key**: `fiber.discovery` 
   - **Types**: Fiber optic connections (ifType=56)
   - **Scope**: High-speed fiber interface monitoring
   - **Update**: Hourly discovery with traffic analysis

4. **Interfaces (LAG/Bonded) Discovery**
   - **Key**: `lag.discovery`
   - **Types**: Link Aggregation Groups (ifType=161)
   - **Scope**: Bonded interface performance and load distribution
   - **Update**: Hourly discovery with aggregated traffic monitoring

5. **Interfaces (VLAN) Discovery**
   - **Key**: `vlan.discovery`
   - **Types**: Virtual LAN interfaces (ifType=53,135)
   - **Scope**: Layer 2 and Layer 3 VLAN subinterface monitoring
   - **Update**: Hourly discovery with VLAN-specific traffic analysis

6. **VPN Tunnels (L2TP Based) Discovery**
   - **Key**: `l2tp.discovery`
   - **Types**: Layer 2 tunneling interfaces (ifType=131)
   - **Scope**: L2TP tunnel performance and error tracking
   - **Update**: Hourly discovery with real-time tunnel monitoring

7. **VPN Tunnels (PPTP Based) Discovery**
   - **Key**: `pptp.discovery`
   - **Types**: Point-to-Point tunneling interfaces (ifType=131)
   - **Scope**: PPTP tunnel performance and connection analysis
   - **Update**: Hourly discovery with tunnel health monitoring

8. **VPN Tunnels (Route-based/VTI) Discovery**
   - **Key**: `vti.discovery`
   - **Types**: Virtual Tunnel Interfaces (ifType=131)
   - **Scope**: Route-based VPN configuration and persistent monitoring
   - **Update**: Hourly discovery with VTI traffic analysis

9. **VPN Policy Discovery**
   - **Key**: `vpn.policy.discovery`
   - **Types**: IPSec Security Association table monitoring
   - **Scope**: Policy-based VPN with subnet pair mapping
   - **Update**: Hourly discovery with SA lifecycle tracking

### Items (130+ Monitoring Items)

#### Security Services Statistics (15 Items)
- **AntiSpyware**: Scan requests, threats blocked/detected, scan time
- **Gateway AntiVirus**: Scan count, virus detection
- **IDS/IPS**: Attacks blocked/detected for both intrusion detection and prevention
- **Mail Security**: Total count, good allowed, spam/virus detected

#### VPN Master Items (15 Items)  
- **Policy-Based**: SA table data, tunnel status tracking
- **SSL-VPN**: User sessions table monitoring
- **IPSec Group VPN**: WAN Group VPN session tracking  
- **L2TP/PPTP/SSTP**: User session table monitoring for each protocol
- **WAN Interfaces**: External interface monitoring

#### System Performance (20 Items)
- **CPU**: Total utilization and per-processor monitoring
- **Connections**: Active, maximum, usage percentage
- **Routing**: IP route table analysis
- **Device**: Administrator info, model identification
- **SNMP**: Agent responsiveness and availability

#### Discovery Prototypes (80+ Item Prototypes)
- **Network Interfaces**: Traffic (in/out bytes/packets), errors, status, utilization
- **VPN Tunnels**: Traffic analysis, status monitoring, connection health
- **Processors**: Per-CPU utilization with load distribution analysis

### Triggers (45+ Intelligent Triggers)

#### Interface Monitoring Triggers
- **State Changes**: Immediate alerting on operational/administrative state transitions
- **High Error Rates**: Configurable thresholds for inbound/outbound error detection  
- **Traffic Anomalies**: Interface utilization and performance degradation alerts

#### VPN Tunnel Triggers
- **Connection State**: Policy-based and route-based tunnel status monitoring
- **Tunnel Stability**: VPN flap detection with configurable sensitivity
- **Traffic Interruption**: Tunnel throughput and connectivity health alerts

#### System Health Triggers  
- **CPU Utilization**: Per-processor threshold alerting with load distribution
- **Performance Degradation**: System responsiveness and health monitoring
- **Connection Limits**: Active connection threshold monitoring

### Graphs (35+ Visualization Graphs)

#### Network Performance Graphs
- **Interface Traffic**: Type-specific throughput analysis with error overlays
- **Multi-Interface**: Ethernet, Fiber, VLAN, LAG, and VTI traffic visualization
- **Performance Trends**: Bandwidth utilization and capacity planning analysis

#### VPN Performance Graphs
- **Policy-Based VPN**: Tunnel-specific traffic analysis with SA lifecycle
- **Route-Based VPN**: VTI throughput monitoring with persistent configuration
- **Protocol-Specific**: L2TP, PPTP, SSL-VPN performance tracking

#### System Performance Graphs
- **CPU Utilization**: Multi-processor performance trending and load analysis
- **Security Services**: GAV, IPS/IDS, and Anti-Spyware performance tracking

## Configuration Requirements

### SNMP Configuration
```bash
# Enable SNMP on SonicWall (Web Interface)
Network > SNMP > Enable SNMP Agent
Community: public (read-only)
Contact: admin@company.com  
Location: Network Operations Center

# CLI Configuration (if available)
configure snmp community public readonly
configure snmp sysLocation "Network Operations Center"
configure snmp sysContact "admin@company.com"
```

### Interface Filtering Customization
Customize interface discovery by modifying discovery rule filters:
- **Ethernet Interfaces**: Excludes HA-Link and unassigned ports
- **Virtual Interfaces**: Includes VLAN and VTI interfaces
- **Management Exclusion**: Filters out management interfaces from monitoring

### VPN Monitoring Configuration
**Important**: SonicWall SNMP exposes live Security Association (SA) data for VPN tunnels. This creates dynamic items that may appear and disappear based on tunnel activity.

**Optimization Features:**
- **Rapid Data Purging**: 24-hour retention for transient VPN metrics
- **Heartbeat Discard**: `DISCARD_UNCHANGED_HEARTBEAT` for stable values
- **Intelligent Polling**: Optimized intervals to reduce SNMP load

## Macro Customization

### Performance Thresholds
- `{$SONICWALL_CPU_ERROR}`: CPU utilization warning threshold (default: 80%)
- `{$SONICWALL_INTERFACE_ERROR}`: Interface error rate threshold (default: 5%)

### Discovery Filters  
- `{$SONICWALL_VPN_IGNORE_REGEX}`: VPN tunnel exclusion pattern
- `{$SONICWALL_INTERFACE_IGNORE_REGEX}`: Interface exclusion pattern

### Collection Intervals
- `{$SONICWALL_DISCOVERY_INTERVAL}`: Discovery rule update frequency

## Performance Optimization

### Collection Intervals
- **Critical Items**: 60 seconds (Interface status, VPN tunnel health)
- **Standard Items**: 300 seconds (Traffic counters, security statistics)
- **Low Priority Items**: 3600 seconds (Hardware sensors, system info)

### Discovery Intervals  
- **Network Interfaces**: 3600 seconds (Ethernet, Fiber, VLAN, LAG)
- **VPN Tunnels**: 3600 seconds (Policy, Route-based, L2TP, PPTP)
- **System Components**: 3600 seconds (Processors, device info)

### Storage Optimization
- **Status Items**: `DISCARD_UNCHANGED` to prevent duplicate storage
- **Error Items**: `DISCARD_UNCHANGED_HEARTBEAT: 3600s` for stable values
- **Performance Items**: Optimized history retention (7d-30d based on criticality)

## Device Compatibility

### Supported Hardware Series
- **TZ Series**: TZ270, TZ370, TZ470, TZ570, TZ670 (Small Business/Home Office)
- **NSA Series**: NSA2650, NSA3650, NSA4650, NSA5650, NSA6650 (Mid-Range)  
- **NSa Series**: NSa2700, NSa3700, NSa4700, NSa5700, NSa6700 (High Performance)
- **SuperMassive Series**: SM9200, SM9400, SM9600, SM9800 (Enterprise)
- **Virtual Appliances**: SonicWall NSv Series (Cloud/Virtualized)

### Firmware Compatibility
- **SonicOS 6.5.x**: Full feature support with legacy MIB compatibility
- **SonicOS 7.x**: Enhanced monitoring with expanded SNMP objects
- **Enterprise Features**: HA monitoring, advanced security services

## Community Issues Addressed

This template specifically addresses multiple community concerns:

### Issue #448 - Enhanced VPN Monitoring
- **Dynamic VPN Discovery**: Replaces static VPN monitoring
- **Multi-Protocol Support**: Policy-based, route-based, L2TP, PPTP, SSL-VPN
- **Tunnel Performance**: Real-time traffic analysis and health monitoring  
- **Connection Stability**: Flap detection and uptime tracking

### Issue #630 - Comprehensive Security Template
- **Security Services**: GAV, IPS/IDS, Anti-Spyware, Mail Security
- **Performance Metrics**: Scan rates, threat detection, blocking statistics
- **Enterprise Features**: Multi-device support, HA monitoring

### Universal Template Benefits
- **Removes Model-Specificity**: Works across SonicWall product lines  
- **Dynamic Discovery**: Eliminates hard-coded items and interfaces
- **Scalable Architecture**: From 29 to 45+ triggers with better coverage
- **Maintainable Design**: Flexible and extensible for future enhancements

## Troubleshooting

### Common SNMP Issues

**Connection Problems:**
- Verify SNMP community string configuration in SonicWall
- Check management interface access rules allow SNMP (UDP 161)
- Validate SonicWall firmware supports required MIB objects

**VPN Discovery Issues:**  
- Confirm at least one VPN tunnel is active for initial discovery
- Review tunnel naming conventions for discovery pattern matching
- Check VPN configuration includes proper SNMP-accessible data

**Interface Discovery Problems:**
- Verify interface naming patterns match your SonicWall model
- Adjust discovery filter regex for model-specific interface types
- Ensure interface table is properly populated via SNMP

**Security Services Monitoring:**
- Confirm security services are licensed and enabled
- Verify SNMP OID support for security statistics in your firmware
- Check service performance counters are accessible via SNMP

### Performance Tuning

**High SNMP Load:**
- Increase discovery intervals for stable environments  
- Enable `DISCARD_UNCHANGED_HEARTBEAT` for slowly changing values
- Adjust collection intervals based on monitoring requirements

**Storage Optimization:**
- Configure appropriate history retention for different item types
- Use trend data for long-term analysis of high-frequency items
- Regular housekeeping of discovery-based items that are no longer active

## Advanced Features

### Enterprise Integration
- **Multi-Device Management**: Centralized monitoring for SonicWall clusters
- **HA Monitoring**: Active/passive cluster health and synchronization tracking
- **Scalable Discovery**: Configurable filters for large-scale deployments
- **Performance Optimization**: Intelligent polling intervals with heartbeat management

### Security Intelligence  
- **Real-Time Threat Detection**: GAV, IPS/IDS threat blocking statistics
- **Service Performance Analysis**: Security scan latency and throughput monitoring
- **Compliance Reporting**: Security policy enforcement and audit trail data
- **License Management**: Security service availability and renewal tracking

### Network Analytics
- **VPN Redundancy**: Multiple tunnel path monitoring and failover detection
- **Interface Optimization**: Type-specific monitoring for diverse connectivity options
- **Traffic Engineering**: Bandwidth analysis and capacity planning intelligence
- **Performance Baselines**: Historical trend analysis for proactive management

## Template Statistics

**Comprehensive Coverage:**
- **Discovery Rules**: 9 active LLD rules for dynamic monitoring
- **Items**: 130+ monitoring items with optimized collection intervals 
- **Triggers**: 45+ intelligent triggers with configurable thresholds
- **Graphs**: 35+ visualization graphs with performance overlays
- **Macros**: 15+ customizable macros for environment adaptation

**Storage Efficiency:**
- **Optimized Intervals**: Intelligent polling based on data criticality
- **Heartbeat Management**: Prevents duplicate storage of unchanged values
- **Retention Policies**: Appropriate history/trend retention for different metrics
- **Discovery Management**: Automated cleanup of obsolete discovered items

## License

This template is provided under the same license as the Zabbix Community Templates repository.