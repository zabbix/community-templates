# APC PowerChute Business Edition (PCBE) Zabbix Template

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Zabbix](https://img.shields.io/badge/Zabbix-7.x-red.svg)](https://www.zabbix.com)
[![APC](https://img.shields.io/badge/APC-PCBE-7ed957.svg)](https://www.se.com/ww/en/product-range/61932-powerchute-business-edition/)

A comprehensive Zabbix template for monitoring APC PowerChute Business Edition (PCBE) UPS systems via SNMPv3.

## Features

### Monitored Parameters
- **Input Power**
  - Input voltage
  - Input frequency
- **Output Power**
  - Output voltage
  - Output frequency
  - Output load percentage
  - Output current
  - Output status (with text mapping)
- **Battery**
  - Battery capacity percentage
  - Battery runtime remaining
- **Environmental**
  - Internal temperature

### Status Mapping
The template includes comprehensive output status mapping:
- `onLine` - Normal operation
- `onBattery` - Running on battery power
- `onSmartBoost` - Voltage regulation active
- `timedSleeping` - Scheduled shutdown
- `softwareBypass` - Bypass mode
- `off` - UPS is off
- `rebooting` - UPS is restarting
- `switchedBypass` - Manual bypass
- `hwFailureBypass` - Hardware failure bypass
- `sleepUntilPowerReturn` - Waiting for power restoration

## Configuration

### Configurable Macros
The template uses macros for easy threshold customization:

| Macro | Default Value | Description |
|-------|---------------|-------------|
| `{$PCBE_INPUT_VOLT_MIN}` | 203V | Minimum acceptable input voltage |
| `{$PCBE_INPUT_VOLT_MAX}` | 253V | Maximum acceptable input voltage |
| `{$PCBE_OUTPUT_LOAD_WARN}` | 80% | Output load warning threshold |
| `{$PCBE_BATTERY_CAP_LOW}` | 20% | Low battery capacity threshold |
| `{$PCBE_TEMP_HIGH}` | 40°C | High temperature threshold |

## Installation

1. **Import Template**
   ```
   Configuration → Templates → Import
   ```
   Select the `apc_pcbe_snmpv3.yaml` file

2. **Configure SNMP**
   - Create a new host or select existing host
   - Configure SNMP interface with your UPS IP address
   - Set up SNMPv3 credentials (user, authentication, privacy)

3. **Link Template**
   - Link the "APC PCBE by SNMP (v3)" template to your host
   - Adjust macro values if needed for your environment

4. **Verify**
   - Check that items are collecting data
   - Verify triggers are working correctly

## Requirements

- **Zabbix Server**: 7.x or higher
- **SNMP**: v3 support required
- **Network**: SNMP access to APC PCBE device
- **Permissions**: Read access to APC SNMP OIDs

## SNMP OIDs Used

| Parameter | OID | Description |
|-----------|-----|-------------|
| Input Voltage | 1.3.6.1.4.1.318.1.1.1.3.2.1.0 | Advanced input voltage |
| Input Frequency | 1.3.6.1.4.1.318.1.1.1.3.2.4.0 | Advanced input frequency |
| Output Voltage | 1.3.6.1.4.1.318.1.1.1.4.2.1.0 | Advanced output voltage |
| Output Load | 1.3.6.1.4.1.318.1.1.1.4.2.6.0 | Advanced output load |
| Output Current | 1.3.6.1.4.1.318.1.1.1.4.2.4.0 | Output current |
| Output Frequency | 1.3.6.1.4.1.318.1.1.1.4.2.2.0 | Output frequency |
| Output Status | 1.3.6.1.4.1.318.1.1.1.4.1.1.0 | Basic output status |
| Battery Capacity | 1.3.6.1.4.1.318.1.1.1.2.2.1.0 | Battery charge percentage |
| Battery Runtime | 1.3.6.1.4.1.318.1.1.1.2.2.3.0 | Estimated runtime |
| Internal Temperature | 1.3.6.1.4.1.318.1.1.1.2.2.2.0 | Internal temperature |

## Contributing

Contributions are welcome! Please feel free to:
- Report issues
- Suggest improvements
- Submit pull requests
- Share your experience with different APC models

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

**arch3rek**
- Website: [https://arch3r.eu](https://arch3r.eu)
- GitHub: [@arch3rek](https://github.com/arch3rek)

## Related Projects

- [Official Zabbix Templates](https://www.zabbix.com/integrations)
- [PowerChute Business Edition](https://www.se.com/pl/pl/product-range/61932-powerchute-business-edition/#products)

## Disclaimer

This template is provided as-is. Test thoroughly in your environment before production use. The author is not responsible for any issues that may arise from using this template.

