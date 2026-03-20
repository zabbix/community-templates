# Zabbix Template Dell SmartFabric OS10 by SNMP

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This Zabbix template enables full monitoring of a Dell Switch which runs SmartFabric OS10 via SNMP. It collects host metrics, interface metrics, board status, fan status, power supply status, and automatically generates discovery rules for chassis, interfaces, fans and power supplies.

---

## Requirements

- **Zabbix Server** version 7.4 or higher
- **SNMP Agent** module enabled on the Zabbix server
  
## 1. Enable SNMP on Switch

1. **Log in**  
   - Serial interface or SSH.

2. **Configure SNMP**
   - Enter **configure terminal**
   - **snmp-server community public ro**
   - **snmp-server contact user@example.com**
   - **snmp-server location "Network rack"**

## Installation

1. Download the template `template_smartfabric_os10_snmp.yaml`.  
2. In the Zabbix web interface, go to **Configuration → Templates → Import** and import the template.  
3. Create a new host:
   - Go to **Configuration → Hosts → Create host**
   - Enter a **Host name** (e.g. `pbs01`)
   - Assign the template **Dell SmartFabric OS10 by SNMP**
   - Set the appropriate **Group** (e.g. `Switches`)
   - Click **Add** in **Interfaces** section and choose **SNMP**
4. Configure SNMP parameters.

## Usage

1. Configure SNMP on Switch.
2. Add or select the host in Zabbix.
3. Assign the “Dell SmartFabric OS10 by SNMP” to the host.
4. Configure macros on the host’s Template tab.
5. Enable monitoring and check initial metrics under **Monitoring → Latest data**.

## Contents of the Template

### 1. Discovery Rules

| Discovery Rule                   | Description                                                 |
|----------------------------------|-------------------------------------------------------------|
| **chassis.discovery**            | Detection of all chassis                                    |
| **chassis.card.discovery**       | Detection of all cards in a chassis                         |
| **cpu.discovery[snmp]**          | Detection of all cpus                                       |
| **fan.discovery**                | Detection of all fans                                       |
| **fan.tray.discovery**           | Detection of all fan trays                                  |
| **psu.discovery**                | Detection of all power supplies                             |
| **net.if.discovery**             | Detection of all network interfaces                         |
| **net.if.duplex.discovery**      | Detection of all network interface duplex capabilities      |
| **vfs.fs.discovery[snmp]**       | Detection of all file systems                               |

### 2. Trigger Prototypes

- Chassis card status and temperature
- Fan status
- Fan tray status
- Power supply status
- Filesystem health
- Network interface connection and performance issues

## Related Projects

- [Official Zabbix Templates](https://www.zabbix.com/integrations)

## License

This project is licensed under the MIT License.

## Author

Bernd Krumböck (krumboeck@universalnet.at)

## Disclaimer

This template is provided as-is. Test thoroughly in your environment before production use. The author is not responsible for any issues that may arise from using this template.

