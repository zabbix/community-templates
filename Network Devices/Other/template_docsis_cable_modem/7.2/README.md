# DOCSIS Cable Modem Monitoring Template for Zabbix

A comprehensive Zabbix monitoring template for DOCSIS cable modems providing extensive monitoring capabilities through SNMP.

## Features

### Physical Layer Monitoring
- Downstream/Upstream signal power levels
- Signal-to-Noise Ratio (SNR) measurements
- Microreflection detection
- Channel width and frequency tracking
- Pre-equalization data analysis

### DOCSIS Parameters
- Operating mode (DOCSIS 1.0-3.1)
- Channel bonding status
- Registration state monitoring
- Configuration file tracking
- Maximum CPE limits

### Security Monitoring
- BPI+ authentication status
- Traffic Encryption Key (TEK) state
- Security certificate status
- Authorization failures
- Encryption capabilities

### Performance Metrics
- Codeword error rates
- Timeout events (T1-T4)
- Channel utilization
- Network interface statistics
- System uptime

## Monitored Parameters

### Key Metrics
- Signal power levels (DS/US)
- Signal-to-Noise Ratio
- Pre-equalization data
- BPI+ security states
- Channel statistics
- Error counters
- System performance

### Pre-Equalization Analysis
- Comprehensive 24-tap analysis
- Main tap positioning verification
- Pre/post cursor evaluation
- Distance-to-fault estimation
- Microreflection detection
- Plant response analysis
- Expert interpretation of tap values
- Automated recommendations based on patterns
- Historical trend tracking
- Distance calculations for fault locations
- Group delay analysis
- Frequency domain insights
- Pattern recognition for common issues
- Detailed tap-by-tap breakdowns

### Advanced Signal Analysis
- Channel frequency response
- Group delay variation
- Adaptive equalizer convergence
- Microreflection amplitude/delay
- In-channel frequency response
- Plant resonance detection
- Impedance mismatch identification
- Echo path analysis

## Template Triggers

Key triggers include:

### Signal Quality
- DS Power Level Out of Range (Warning)
- US Power Level Out of Range (Warning)
- Low SNR on DS Channel (Warning)
- High Microreflections (Warning)

### Security
- BPI+ Authentication Rejected (High)
- BPI+ Privacy Disabled (High)
- TEK Not Operational (Warning)

### Performance
- High T1-T4 Timeouts (Warning)
- Multiple Sync Losses (High)
- High Uncorrectable Codewords (Warning)
- Modem Reset Detected (High)

### System
- High CPU Usage (Warning)
- No SNMP Data Collection (Warning)
- Event Throttling Active (Warning)
- System Name Changed (Info)

### Interface
- Network Interface Down (Warning)
- High Interface Utilization (Warning)
- Interface Errors Detected (Warning)

## Pre-Equalization Statistics

![Pre-Equalization Analysis Example](files/img/preeq.png)

> **DISCLAIMER:** The pre-equalization analysis features described below are based on preliminary deployment data. Continuous monitoring, data collection, and user feedback are required to validate and improve the accuracy of these measurements. Interpretation of results should be done with caution as the system's precision is still being evaluated through real-world deployments.

The template provides extensive pre-equalization analysis capabilities:

- Main tap energy distribution
- Pre/post cursor tap analysis
- Adaptive equalizer coefficient tracking
- Micro-reflection amplitude/delay correlation
- Distance-to-fault calculations
- Plant response characterization
- Echo profile analysis
- Group delay variation tracking
- Frequency domain analysis
- Historical trend comparison
- Pattern-based fault identification
- Automated severity assessment
- Expert system recommendations
- Tap correlation analysis

### Analysis Capabilities
- 24-tap coefficient analysis
- Complex tap magnitude/phase
- Main tap position verification
- Pre/post cursor energy ratios
- Micro-reflection identification
- Distance calculations
- Echo profile characterization
- Group delay analysis
- Frequency response insights
- Historical trending
- Pattern recognition
- Automated troubleshooting

### Key Metrics Tracked
- Tap magnitudes (dB)
- Phase relationships
- Group delay variation
- Echo profiles
- Frequency response
- Adaptive convergence
- Energy distribution
- Pattern signatures
- Historical stability
- Trend analysis

## Requirements

- Zabbix 7.2 or newer
- SNMP v2c access to cable modem
- Cable modem must support standard DOCSIS MIBs:
  - DOCS-IF-MIB
  - DOCS-CABLE-DEVICE-MIB
  - DOCS-BPI-PLUS-MIB
  - HOST-RESOURCES-MIB

## Self-Contained Processing

This template is completely self-contained and requires no external scripts or additional installations. All processing is handled through built-in Zabbix functionality:

### Pre-Equalization Analysis
The template includes embedded JavaScript preprocessing for real-time pre-equalization analysis:

```javascript
// Built-in JavaScript preprocessor handles:
- Hex data parsing from SNMP responses
- Complex tap calculations (magnitude/phase)
- Main tap identification
- Energy distribution analysis
- Distance calculations
- Automated health assessment
- Dynamic recommendations
```

Key JavaScript Functions:
- `parsePreEQ()`: Analyzes upstream pre-equalization data
- `parseSigQEQ()`: Processes signal quality equalization metrics

The preprocessing logic:
1. Converts hex strings to numerical values
2. Calculates tap magnitudes and phases
3. Identifies main tap position
4. Computes relative power levels
5. Determines tap status (OK/Marginal/Poor)
6. Estimates physical distances to faults
7. Generates human-readable analysis
8. Provides specific troubleshooting recommendations

Everything is processed within Zabbix's native preprocessing pipeline, requiring no external dependencies or maintenance.

## Built-in Documentation and Troubleshooting

The template includes comprehensive operational documentation embedded directly within item and trigger descriptions:

### Item Descriptions
- Detailed parameter explanations
- Normal operating ranges
- Common problem indicators
- Impact analysis
- Real-world examples
- Technical background

### Trigger Descriptions
- Problem impact assessment
- Root cause analysis steps
- Recommended actions
- Resolution procedures
- Escalation guidelines

This integrated approach provides:
- Immediate access to troubleshooting steps
- Context-specific guidance
- No need for external documentation
- Operational knowledge at the point of need
- Consistent support information

Example areas covered:
- Signal quality interpretation
- Error code meanings
- Performance thresholds
- Security status analysis
- Configuration validation

## Normal Operating Ranges

### Downstream
- Power: -10 to +15 dBmV
- SNR: >30 dB minimum
- Microreflections: <20 dB

### Upstream
- Power: +35 to +55 dBmV
- Channel width: 0.2-6.4 MHz
- Pre-equalization: <-30 dB optimal

## Template Structure

### Discovery Rules
- Network interfaces
- Downstream channels
- Upstream channels
- BPI+ security parameters
- CPU resources
- Event throttling

### Core Monitoring
- Built-in SNMP v2c monitoring
- ICMP availability checks
- Response time tracking
- Packet loss monitoring
- Agent health verification

### Items
- Software version
- CMTS MAC address
- Operating mode
- Status codes
- Signal levels
- Error rates
- Security states

![Tagging Structure](files/img/tags.png)

### Network Interface Discovery

The template uses Low-Level Discovery (LLD) with filtering to automatically detect and monitor network interfaces. The discovery process uses a customizable filter:

![LLD Filter Configuration](files/img/lld.png)

```yaml
filter:
  evaltype: AND
  conditions:
    - macro: '{#IFOPERSTATUS}'
      value: ^1$
    - macro: '{#IFTYPE}'
      value: ^(6|127|128|129)$
```

Filter Explanation:
- Only discovers operational interfaces (ifOperStatus = 1)
- Default interface types included:
  * 6: ethernetCsmacd (Ethernet)
  * 127: docsCableMaclayer (DOCSIS MAC)
  * 128: docsCableDownstream (DOCSIS Downstream)
  * 129: docsCableUpstream (DOCSIS Upstream)

Value Mapping:
- Predefined mappings for interface states and types
- Service state mapping (Up/Down)
- Automatically translates numeric values to human-readable text
- Example: 0 -> "Down", 1 -> "Up" for interface status

Customization:
- The interface type filter can be extended
- Additional types can be added by modifying the regex
- Example adding WiFi (71): ^(6|71|127|128|129)$
- Any valid IANA ifType can be included

This filtering ensures:
- Only active interfaces are monitored
- Reduces unnecessary items
- Focuses on relevant interfaces
- Flexible for different requirements

### Graphs

The template includes network traffic graphs for discovered interfaces:

- Interface Traffic Graph
  * Shows inbound/outbound bandwidth utilization
  * Green line: Incoming traffic
  * Red line: Outgoing traffic
  * Gradient fill for better visibility
  * Auto-scales based on interface speed

### Triggers
- Signal level violations
- Security state changes
- Performance degradation
- Hardware issues
- Configuration problems

### Graphs
- Signal levels over time
- Error rates
- Channel utilization
- Network traffic

## Troubleshooting Priority

1. Physical Layer Issues
   - Check signal levels
   - Verify cable connections
   - Inspect RF path

2. Configuration Problems
   - Review DOCSIS config
   - Check provisioning
   - Verify security settings

3. Performance Issues
   - Monitor error rates
   - Track timeout events
   - Analyze channel stability

## Support

### MIBs used for reference
> Note: These MIBs are listed for reference only and are not required for template operation since all SNMP queries use direct OID numbers.

- IF-MIB
- SNMPv2-MIB
- DOCS-IF-MIB
- DOCS-CABLE-DEVICE-MIB
- HOST-RESOURCES-MIB
- DOCS-BPI-PLUS-MIB

The template is designed to work without MIB files by using explicit OID numbers in all SNMP queries, making deployment simpler and more portable across different environments.

### Compatibility
- DOCSIS 2.0/3.0/3.1 modems
- Major cable modem vendors
- Standard DOCSIS features

> **Important Note on Device Compatibility:**
> Not all items and features in this template may be available or functional on every cable modem model. Extensive testing has primarily been conducted on:
>
> **Motorola SBG6580**
> ```
> HW_REV: 3
> VENDOR: Motorola Corporation
> BOOTR: 2310
> SW_REV: SBG6580-3.5.8.4-GA-00-505-NOSH
> MODEL: SBG6580
> ```
>
> **Arris SBG10**
> ```
> HW_REV: 1
> VENDOR: ARRIS Group, Inc.
> BOOTR: 2.2.0.45
> SW_REV: 9.1.103AA45C
> MODEL: SBG10
> ```
>
> **Netgear C3700-100NAS**
> ```
> HW_REV: C279T00-01
> VENDOR: NETGEAR
> BOOTR: 2.4.0alpha18
> SW_REV: V1.01.11
> MODEL: C3700-100NAS
> ```
>
> When implementing this template on other models, it is recommended to:
> - Test each metric for availability
> - Verify SNMP OID support
> - Disable unsupported items
> - Adjust triggers as needed for your specific environment

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This template is available under the MIT License.

## Changelog

### Version 1.0.0
- Initial release
- Complete DOCSIS monitoring
- Comprehensive discovery rules
- Standard trigger set

## Contact

````bash
://echo@dla.network [oZark oRChes✝ra✝'d]
````

[☕ Buy me a coffee](https://www.buymeacoffee.com/p_pepp)