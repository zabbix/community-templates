# OpenVPN monitoring

## Description

This template monitors OpenVPN servers with comprehensive user discovery and traffic monitoring.

## Overview

For Zabbix version: 7.0

Supports monitoring of:
- OpenVPN service status and version changes
- Connected users count with automatic discovery
- Per-user bandwidth monitoring (upload/download with change-per-second calculations)
- Individual user connection status tracking
- **Connection duration tracking** per user
- **Real and virtual IP address tracking** per user
- **Authentication failure monitoring** (24-hour window)
- **Connection stability tracking** (reconnection monitoring)
- Service down alerts and comprehensive security monitoring

Use in conjunction with a default Template OS Linux-template for CPU/Memory/Storage monitoring of the OpenVPN server.

This template was created for:
- Zabbix Server 7.0.0 or higher
- OpenVPN servers with status file logging enabled
- Zabbix Agent 2 (Agent 1 compatible)

## Author

Enhanced for Zabbix 7.0 compatibility from community contributions.

## Setup

### Prerequisites
- OpenVPN server with status file logging enabled
- Zabbix Agent 2 on OpenVPN server (Agent 1 compatible)
- Read permissions for Zabbix user on OpenVPN log directory

### OpenVPN Configuration
Add to your OpenVPN server configuration:
```conf
status /var/log/openvpn/status.log 10
status-version 2
```

### Install Client Components

1. **Deploy Discovery Script**:
```bash
sudo mkdir -p /opt/zabbix
sudo cp files/openvpn-discovery.sh /opt/zabbix/
sudo chmod 755 /opt/zabbix/openvpn-discovery.sh
sudo chown root:zabbix /opt/zabbix/openvpn-discovery.sh
```

2. **Configure UserParameters**:
```bash
sudo cp files/userparameter_openvpn.conf /etc/zabbix/zabbix_agent2.d/
sudo systemctl restart zabbix-agent2
```

3. **Set Log Permissions**:
```bash
sudo usermod -a -G adm zabbix  # Add zabbix to log group
sudo chmod 750 /var/log/openvpn
sudo chmod 640 /var/log/openvpn/status*.log

# For security monitoring (auth failures, reconnections)
sudo chgrp zabbix /var/log/openvpn/server-*.log
sudo chmod 640 /var/log/openvpn/server-*.log
```

## Zabbix configuration

Import the template and link to your OpenVPN host.

### Testing
Validate installation:
```bash
# Test discovery
sudo -u zabbix /opt/zabbix/openvpn-discovery.sh

# Test UserParameters  
zabbix_agent2 -t openvpn.version
zabbix_agent2 -t openvpn.user.number.new
```

## Items collected

### Regular Items
- **OpenVPN: Connected users count** - Total active VPN connections
- **OpenVPN: Version** - Server version with change detection trigger  
- **OpenVPN: Service status** - Process count monitoring

### Discovery Items (per connected user)
- **Bytes received per second** - Download bandwidth per user (with preprocessing)
- **Bytes sent per second** - Upload bandwidth per user (with preprocessing)
- **Connection status** - Individual user connection state (1=connected, 0=disconnected)
- **Connection duration** - Time in seconds since user connected
- **Real IP address** - Client's actual external IP address
- **Virtual IP address** - Client's VPN internal IP address

### Security & Monitoring Items
- **Authentication failures (24h)** - Count of failed authentication attempts
- **Reconnections (24h)** - Count of connection restart events

## Triggers

| Name | Severity | Description |
|------|----------|-------------|
| OpenVPN: Service is down | High | No OpenVPN processes running |
| OpenVPN: Version has changed | Information | Server version changed (manual close) |
| OpenVPN User [{#VPN.USER}]: User disconnected | Information | Per-user disconnection (manual close) |
| OpenVPN: High authentication failure rate | Warning | More than 10 authentication failures in 24 hours |
| OpenVPN: High reconnection rate | Warning | More than 20 reconnections in 24 hours |

## Graphs

- **OpenVPN: Connected users overview** - Timeline of total connections
- **Per-user traffic graphs** - Individual bandwidth usage charts
- **Per-user connection status** - Connection state visualization
- **Per-user connection duration** - Individual connection time tracking

## Testing

All components have been tested and validated on:
- Zabbix Server 7.0.17
- OpenVPN Server 2.6.14  
- Debian/Ubuntu systems

Testing included:
- UserParameter validation without active clients  
- Live testing with VPN connections
- Security monitoring validation
- Permission configuration
- Template import verification

## Macros used

There are no macros used in this template.

## Template links

There are no template links in this template.

## Discovery rules

| Name | Description | Type | Key |
|------|-------------|------|-----|
| OpenVPN: Users discovery | Discovers connected OpenVPN users | Zabbix agent | openvpn.discovery |

The discovery rule runs every 10 minutes and creates monitoring items for each connected user automatically.

## Requirements

- Zabbix Server 7.0.0 or higher
- Zabbix Agent 2 on OpenVPN server (Agent 1 compatible)  
- OpenVPN server with status file logging enabled
- Read permissions for Zabbix user on OpenVPN log directory (`/var/log/openvpn`)

## Installation files

- `template_openvpn_monitoring.yaml` - Zabbix 7.0 template
- `files/openvpn-discovery.sh` - User discovery script for `/opt/zabbix/`
- `files/userparameter_openvpn.conf` - UserParameters for `/etc/zabbix/zabbix_agent2.d/`

**Structure follows Zabbix community template standards:**
- Main template file (YAML/XML) in root directory
- Additional files (scripts, configs) in `files/` subdirectory
- Documentation in README.md

## Version History

- **1.1.0** (2024-08-26): Enhanced version with security and connection tracking  
  - **NEW**: Connection duration tracking per user
  - **NEW**: Real and virtual IP address monitoring
  - **NEW**: Authentication failure monitoring (24h window)
  - **NEW**: Connection stability tracking (reconnection monitoring)
  - **NEW**: Security-focused triggers for suspicious activity
  - Fixed UserParameter parsing with simplified grep+cut approach
  - Improved discovery script with reliable JSON output
  - Comprehensive testing guide with live connection validation
  - Enhanced log permission configuration for security monitoring

- **1.0.0** (2024-08-26): Initial release for Zabbix 7.0
  - Modern tag structure (no deprecated Applications)
  - Enhanced discovery script with error handling  
  - Zabbix 7.0 compatible YAML format
  - Comprehensive per-user monitoring via LLD

## Author

**claymore666** - [GitHub](https://github.com/claymore666)

## License

This template is provided under MIT License for community use.