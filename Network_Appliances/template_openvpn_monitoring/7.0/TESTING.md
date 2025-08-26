# OpenVPN Monitoring Template Testing Guide

## Overview

This guide provides comprehensive testing procedures for the OpenVPN monitoring template before production deployment or community contribution.

## Prerequisites

### Environment Requirements
- Zabbix Server 7.0+ with API access
- OpenVPN server with status file logging enabled
- Zabbix Agent 2 installed on OpenVPN server
- Test VPN clients for live testing
- Administrative access to both servers

### Test Environment Setup
- **Zabbix Server**: https://zabbix.braustube.ddnss.de
- **OpenVPN Server**: 192.168.0.2 (user: kamienc)
- **OpenVPN Service**: `openvpn-server@braustube-ecc.service`
- **Status Files**: `/var/log/openvpn/status-ecc.log`

## Phase 1: Deploy Enhanced Components

### 1.1 Update Discovery Script
```bash
# Copy enhanced discovery script to OpenVPN server
scp Network_Appliances/template_openvpn_monitoring/7.0/openvpn-discovery.sh kamienc@192.168.0.2:/tmp/

# Install on server
ssh kamienc@192.168.0.2
sudo cp /tmp/openvpn-discovery.sh /opt/zabbix/
sudo chmod 755 /opt/zabbix/openvpn-discovery.sh
sudo chown root:zabbix /opt/zabbix/openvpn-discovery.sh
```

### 1.2 Deploy Enhanced UserParameters
```bash
# Copy enhanced UserParameters configuration
scp Network_Appliances/template_openvpn_monitoring/7.0/userparameter_openvpn.conf kamienc@192.168.0.2:/tmp/

# IMPORTANT: Check for existing duplicate UserParameters first
ssh kamienc@192.168.0.2
find /etc/zabbix -name '*.conf' -exec grep -l openvpn {} \;
grep openvpn /etc/zabbix/zabbix_agent2.conf

# Remove any existing duplicates from main config to avoid conflicts
sudo sed -i '/UserParameter=openvpn/d' /etc/zabbix/zabbix_agent2.conf

# Install enhanced configuration
sudo cp /tmp/userparameter_openvpn.conf /etc/zabbix/zabbix_agent2.d/
sudo systemctl restart zabbix-agent2

# Verify restart successful (should be active, not failed)
sudo systemctl status zabbix-agent2
sudo journalctl -u zabbix-agent2 -n 20
```

### 1.3 Verify Permissions
```bash
# Ensure zabbix user can read OpenVPN status files
sudo ls -la /var/log/openvpn/
# Expected: status-ecc.log should be readable by zabbix group

# Test zabbix user access
sudo -u zabbix cat /var/log/openvpn/status-ecc.log
```

## Phase 2: Test UserParameters (No Active Clients)

### 2.1 Basic System Parameters
```bash
# Test OpenVPN version detection
sudo -u zabbix zabbix_agent2 -t openvpn.version
# Expected: OpenVPN version string (e.g., "2.6.14")

# Test user count (should be 0 with no connections)
sudo -u zabbix zabbix_agent2 -t openvpn.user.number.new
# Expected: 0

# Test discovery (should return empty array)
sudo -u zabbix zabbix_agent2 -t openvpn.discovery
# Expected: {"data":[]}
```

### 2.2 Security Monitoring Parameters
```bash
# Test authentication failure monitoring
sudo -u zabbix zabbix_agent2 -t openvpn.auth_failures
# Expected: Number (likely 0 if no recent failures)

# Test reconnection monitoring
sudo -u zabbix zabbix_agent2 -t openvpn.reconnections
# Expected: Number (recent restart events)
```

### 2.3 User-Specific Parameters (Error Handling)
```bash
# Test user-specific parameters with non-existent user
sudo -u zabbix zabbix_agent2 -t "openvpn.user.status.new[testuser]"
# Expected: 0

sudo -u zabbix zabbix_agent2 -t "openvpn.user.duration.new[testuser]"
# Expected: 0

sudo -u zabbix zabbix_agent2 -t "openvpn.user.real_address.new[testuser]"
# Expected: Empty string or error handled gracefully

sudo -u zabbix zabbix_agent2 -t "openvpn.user.virtual_address.new[testuser]"
# Expected: Empty string or error handled gracefully
```

### 2.4 Documentation of Results
Create test log with results:
```bash
# Create test results file
cat > test-results-phase2.txt << EOF
Phase 2 Test Results - $(date)
=====================================

openvpn.version: [RESULT]
openvpn.user.number.new: [RESULT] 
openvpn.discovery: [RESULT]
openvpn.auth_failures: [RESULT]
openvpn.reconnections: [RESULT]

User parameter error handling:
openvpn.user.status.new[testuser]: [RESULT]
openvpn.user.duration.new[testuser]: [RESULT]

Notes:
- [Any errors or unexpected behavior]
- [Performance observations]
EOF
```

## Phase 3: Import Enhanced Template to Zabbix

### 3.1 Backup Current Template
```bash
# Export current template for backup
python3 -c "
import requests
import json

# Login to Zabbix API
api_data = {
    'jsonrpc': '2.0',
    'method': 'user.login',
    'params': {'username': 'Admin', 'password': '!02Chaos2012'},
    'id': 1
}

headers = {'Content-Type': 'application/json'}
response = requests.post('https://zabbix.braustube.ddnss.de/api_jsonrpc.php', 
                        json=api_data, headers=headers, verify=False)
auth_token = response.json()['result']

# Get existing template
template_data = {
    'jsonrpc': '2.0',
    'method': 'template.get',
    'params': {
        'filter': {'name': ['OpenVPN by Zabbix Agent 2']},
    },
    'auth': auth_token,
    'id': 2
}

response = requests.post('https://zabbix.braustube.ddnss.de/api_jsonrpc.php', 
                        json=template_data, headers=headers, verify=False)

if response.json()['result']:
    template_id = response.json()['result'][0]['templateid']
    print(f'Existing template found: {template_id}')
    
    # Export for backup
    export_data = {
        'jsonrpc': '2.0',
        'method': 'configuration.export',
        'params': {
            'format': 'yaml',
            'options': {'templates': [template_id]}
        },
        'auth': auth_token,
        'id': 3
    }
    
    response = requests.post('https://zabbix.braustube.ddnss.de/api_jsonrpc.php', 
                            json=export_data, headers=headers, verify=False)
    
    with open('backup-template-before-test.yaml', 'w') as f:
        f.write(response.json()['result'])
    print('Backup saved to backup-template-before-test.yaml')
else:
    print('No existing template found')
"
```

### 3.2 Import Enhanced Template
```bash
# Import the enhanced template
python3 -c "
import requests
import json

# Login
api_data = {
    'jsonrpc': '2.0',
    'method': 'user.login',
    'params': {'username': 'Admin', 'password': '!02Chaos2012'},
    'id': 1
}

headers = {'Content-Type': 'application/json'}
response = requests.post('https://zabbix.braustube.ddnss.de/api_jsonrpc.php', 
                        json=api_data, headers=headers, verify=False)
auth_token = response.json()['result']

# Read enhanced template
with open('Network_Appliances/template_openvpn_monitoring/7.0/template_openvpn_monitoring.yaml', 'r') as f:
    template_content = f.read()

# Import enhanced template
import_data = {
    'jsonrpc': '2.0',
    'method': 'configuration.import',
    'params': {
        'format': 'yaml',
        'rules': {
            'templates': {'createMissing': True, 'updateExisting': True},
            'items': {'createMissing': True, 'updateExisting': True},
            'triggers': {'createMissing': True, 'updateExisting': True},
            'discoveryRules': {'createMissing': True, 'updateExisting': True},
            'graphs': {'createMissing': True, 'updateExisting': True}
        },
        'source': template_content
    },
    'auth': auth_token,
    'id': 4
}

result = requests.post('https://zabbix.braustube.ddnss.de/api_jsonrpc.php', 
                      json=import_data, headers=headers, verify=False)
print('Import result:', result.json())
"
```

### 3.3 Verify Template Import
1. **Web Interface Check**:
   - Navigate to Data collection → Templates
   - Search for "OpenVPN by Zabbix Agent 2"
   - Verify all new items are present:
     - OpenVPN authentication failures (24h)
     - OpenVPN reconnections (24h)
     - Per-user connection duration items
     - Per-user IP address items

2. **Host Linking Verification**:
   - Navigate to Data collection → Hosts
   - Find host 192.168.0.2
   - Verify template is linked
   - Check that all items show "Enabled" status

### 3.4 Initial Data Collection Test
```bash
# Wait 5 minutes for initial data collection, then check
# via Monitoring → Latest data for host 192.168.0.2
```

## Phase 4: Live Testing with VPN Connections

### 4.1 Establish Test VPN Connection
```bash
# Connect a VPN client to generate live data
# Method depends on your VPN client setup

# Verify connection in status file
ssh kamienc@192.168.0.2
sudo cat /var/log/openvpn/status-ecc.log
# Should now show CLIENT_LIST entries
```

### 4.2 Test User Discovery with Live Data
```bash
# Test discovery with connected clients
sudo -u zabbix zabbix_agent2 -t openvpn.discovery
# Expected: {"data":[{"{#VPN.USER}":"client1"},{"{#VPN.USER}":"client2"}]}

# Test user count
sudo -u zabbix zabbix_agent2 -t openvpn.user.number.new
# Expected: Number of connected clients
```

### 4.3 Test Per-User Metrics with Live Data
```bash
# Replace "client1" with actual client name from discovery
CLIENT_NAME="[actual_client_name]"

# Test connection status
sudo -u zabbix zabbix_agent2 -t "openvpn.user.status.new[$CLIENT_NAME]"
# Expected: 1

# Test connection duration
sudo -u zabbix zabbix_agent2 -t "openvpn.user.duration.new[$CLIENT_NAME]"
# Expected: Seconds since connection

# Test IP addresses
sudo -u zabbix zabbix_agent2 -t "openvpn.user.real_address.new[$CLIENT_NAME]"
# Expected: Client's real IP address

sudo -u zabbix zabbix_agent2 -t "openvpn.user.virtual_address.new[$CLIENT_NAME]"
# Expected: Client's VPN IP address

# Test bandwidth metrics
sudo -u zabbix zabbix_agent2 -t "openvpn.user.received.new[$CLIENT_NAME]"
# Expected: Bytes received

sudo -u zabbix zabbix_agent2 -t "openvpn.user.sent.new[$CLIENT_NAME]"
# Expected: Bytes sent
```

### 4.4 Verify Zabbix Data Collection
1. **Check Latest Data**:
   - Navigate to Monitoring → Latest data
   - Filter by host 192.168.0.2
   - Verify all new items are collecting data

2. **Verify Discovery Items**:
   - Look for discovered user items
   - Check that per-user metrics are being collected
   - Verify connection duration increases over time

3. **Check Graphs**:
   - View per-user bandwidth graphs
   - Verify connection duration graph displays correctly

## Phase 5: Security Testing

### 5.1 Generate Authentication Failures
```bash
# Attempt VPN connection with wrong credentials
# This will generate AUTH_FAILED entries in logs

# Test failure detection
ssh kamienc@192.168.0.2
sudo -u zabbix zabbix_agent2 -t openvpn.auth_failures
# Should show increased count
```

### 5.2 Test Reconnection Monitoring
```bash
# Force reconnection by restarting OpenVPN service
ssh kamienc@192.168.0.2
sudo systemctl restart openvpn-server@braustube-ecc.service

# Test reconnection detection
sudo -u zabbix zabbix_agent2 -t openvpn.reconnections
# Should show increased count
```

### 5.3 Verify Security Triggers
1. **Authentication Failure Trigger**:
   - Generate >10 authentication failures
   - Verify trigger fires in Zabbix
   - Check alert notifications

2. **Reconnection Trigger**:
   - Generate >20 reconnection events (restart service multiple times)
   - Verify trigger fires
   - Check alert recovery when issue resolves

## Phase 6: Template Validation and Documentation

### 6.1 Export Final Template
```bash
# Export the tested template in both formats
python3 -c "
import requests
import json

# Login and export template code here
# Save as both XML and YAML for compatibility
"
```

### 6.2 Performance Testing
```bash
# Monitor Zabbix agent performance
ssh kamienc@192.168.0.2
top -u zabbix
# Check CPU and memory usage

# Check for any error messages
sudo journalctl -u zabbix-agent2 -f
```

### 6.3 Documentation Verification
- [ ] README.md accurately describes all features
- [ ] Version history updated with test results
- [ ] Installation instructions tested and verified
- [ ] All UserParameters documented correctly

## Test Results Documentation

### Test Report Template
```markdown
# OpenVPN Template Test Report - [Date]

## Environment
- Zabbix Server: 7.0.17
- OpenVPN Server: 2.6.14
- Test Duration: [Duration]
- Connected Clients During Test: [Number]

## Phase 1: Deployment
- [ ] Discovery script deployed successfully
- [ ] UserParameters deployed successfully  
- [ ] Permissions configured correctly
- [ ] Zabbix Agent restarted without errors

## Phase 2: Parameter Testing (No Clients)
- [ ] openvpn.version: [Result]
- [ ] openvpn.user.number.new: [Result]
- [ ] openvpn.discovery: [Result]
- [ ] openvpn.auth_failures: [Result]
- [ ] openvpn.reconnections: [Result]

## Phase 3: Template Import
- [ ] Backup created successfully
- [ ] Enhanced template imported successfully
- [ ] All items enabled and collecting data
- [ ] No import errors

## Phase 4: Live Testing
- [ ] User discovery working with live connections
- [ ] Per-user metrics collecting correctly
- [ ] Connection duration calculating properly
- [ ] IP address tracking functional
- [ ] Bandwidth monitoring operational

## Phase 5: Security Testing
- [ ] Authentication failure detection working
- [ ] Reconnection monitoring functional
- [ ] Security triggers firing appropriately
- [ ] Alert recovery working

## Phase 6: Validation
- [ ] Template export successful
- [ ] Performance impact acceptable
- [ ] Documentation accurate
- [ ] Ready for production/contribution

## Issues Identified
[List any issues found and their resolutions]

## Recommendations
[Any improvements or modifications needed]
```

## Troubleshooting Common Issues

### UserParameter Not Found
```bash
# Check if parameter is loaded
zabbix_agent2 -t openvpn.version
# If not found, check configuration file syntax and restart agent
```

### Permission Denied Errors
```bash
# Fix log file permissions
sudo chown -R root:zabbix /var/log/openvpn
sudo chmod 750 /var/log/openvpn
sudo chmod 640 /var/log/openvpn/*.log

# Verify zabbix user group membership
groups zabbix
```

### Template Import Errors
- Check YAML syntax with online validators
- Verify UUID uniqueness
- Ensure all required fields are present

### Discovery Returns Empty
- Verify status file format matches expected CLIENT_LIST structure
- Check if OpenVPN is using status-version 2
- Ensure discovery script has execute permissions

This comprehensive testing guide ensures the OpenVPN monitoring template functions correctly in all scenarios before production deployment or community contribution.