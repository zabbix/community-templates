# Docker Monitoring by Zabbix Active Agent 2

This template provides comprehensive Docker monitoring using Zabbix Active Agent 2 with the Docker plugin. It monitors Docker engine information, containers, CPU usage, memory consumption, and network statistics.

## Features

- Docker engine health monitoring
- Container discovery and monitoring
- CPU and memory usage per container
- Network traffic monitoring (RX/TX)
- Container state tracking (running, stopped, paused)
- Image count monitoring
- Active agent mode (no inbound connections required)

## Requirements

- Zabbix Server 7.4 or higher
- Zabbix Agent 2 installed on the Docker host
- Docker Engine installed and running
- Root or appropriate user permissions to access Docker socket

## Installation

### 1. Prerequisites

Ensure Docker and Zabbix Agent 2 are installed on your system:

```bash
# Verify Docker is installed
docker --version

# Verify Zabbix Agent 2 is installed
zabbix_agent2 --version
```

### 2. Add Zabbix User to Docker Group

The Zabbix agent needs permission to access the Docker socket. Add the `zabbix` user to the `docker` group:

```bash
sudo usermod -aG docker zabbix
```

**Important:** After adding the user to the group, restart the Zabbix Agent 2 service for the changes to take effect:

```bash
# For systemd-based systems (Ubuntu, Debian, RHEL, CentOS)
sudo systemctl restart zabbix-agent2

# For init.d-based systems
sudo service zabbix-agent2 restart
```

### 3. Configure Docker Plugin

Create or edit the Docker plugin configuration file:

```bash
sudo nano -w /etc/zabbix/zabbix_agent2.d/plugins.d/docker.conf
```

Add the following configuration:

```ini
### Option: Plugins.Docker.Endpoint
#       Docker API endpoint.
#
# Mandatory: no
# Default: unix:///var/run/docker.sock
Plugins.Docker.Endpoint=unix:///var/run/docker.sock

### Option: Plugins.Docker.Timeout
#       The maximum time (in seconds) for waiting when a request has to be done.
#
# Mandatory: no
# Range: 1-30
# Default:
# Plugins.Docker.Timeout=<Global timeout>
```

Alternatively, you can copy the provided configuration file from this template's files directory:

```bash
sudo cp files/docker.conf /etc/zabbix/zabbix_agent2.d/plugins.d/docker.conf
sudo chown root:root /etc/zabbix/zabbix_agent2.d/plugins.d/docker.conf
sudo chmod 644 /etc/zabbix/zabbix_agent2.d/plugins.d/docker.conf
```

### 4. Configure Zabbix Agent 2 for Active Mode

Edit the main Zabbix Agent 2 configuration file:

```bash
sudo nano -w /etc/zabbix/zabbix_agent2.conf
```

You have **two options** for hostname configuration:

#### Option A: Static Hostname (Manual Configuration)

Use this if you want to set a specific hostname for each agent:

```ini
# Zabbix Server IP or hostname for active checks
ServerActive=YOUR_ZABBIX_SERVER_IP

# Static hostname - must match the host name in Zabbix frontend EXACTLY
Hostname=YOUR_HOST_NAME

# Optional: Disable passive checks if only using active mode
# Server=

# Enable Docker plugin (usually enabled by default)
Plugins.Docker.Endpoint=unix:///var/run/docker.sock
```

**Important Notes:**

- Replace `YOUR_ZABBIX_SERVER_IP` with your actual Zabbix Server IP address or hostname
- Replace `YOUR_HOST_NAME` with the exact hostname you'll use when creating the host in Zabbix
- The `Hostname` parameter is **case-sensitive** and must match exactly

#### Option B: Dynamic Hostname (Automatic Configuration)

Use this if you want the agent to automatically use the system's hostname:

```ini
# Zabbix Server IP or hostname for active checks
ServerActive=YOUR_ZABBIX_SERVER_IP

# Dynamic hostname - agent will query this item to get the hostname
HostnameItem=system.hostname

# Optional: Disable passive checks if only using active mode
# Server=

# Enable Docker plugin (usually enabled by default)
Plugins.Docker.Endpoint=unix:///var/run/docker.sock
```

**Important Notes:**

- `HostnameItem=system.hostname` will use the system's hostname (output of `hostname` command)
- The host in Zabbix frontend must be created with the **exact same name** as returned by `hostname` command
- Check your system hostname: `hostname` or `hostname -f` (for FQDN)
- Common HostnameItem options:
  - `system.hostname` - Short hostname (e.g., "server01")
  - `system.hostname[fqdn]` - Fully qualified domain name (e.g., "server01.example.com")

**Which option to choose?**

- **Option A (Hostname):** Better for manual control, testing, or when system hostname doesn't match desired Zabbix name
- **Option B (HostnameItem):** Better for automation, consistent naming, and large deployments

### 5. Verify Docker Socket Permissions

Ensure the Docker socket is accessible:

```bash
ls -l /var/run/docker.sock
```

```bash
usermod -aG docker zabbix
```

Expected output should show the `docker` group has read/write permissions:

```
srw-rw---- 1 root docker 0 Nov  4 10:00 /var/run/docker.sock
```

### 6. Test the Configuration

Test that the Zabbix agent can communicate with Docker:

```bash
# Restart the agent
sudo systemctl restart zabbix-agent2

# Check agent status
sudo systemctl status zabbix-agent2

# Test Docker plugin
zabbix_agent2 -t docker.ping
zabbix_agent2 -t docker.info
```

Expected output for `docker.ping` should be `1`, and `docker.info` should return JSON data about your Docker installation.

## Zabbix Frontend Configuration

### 1. Import the Template

1. Log in to your Zabbix frontend
2. Navigate to **Configuration → Templates**
3. Click **Import** in the top right corner
4. Choose the `template_docker_agent_2_active.yaml` file
5. Click **Import**

### 2. Create the Host

1. Navigate to **Configuration → Hosts**
2. Click **Create host** in the top right corner
3. Configure the host:
   - **Host name:** Must match the `Hostname` parameter in `zabbix_agent2.conf` (case-sensitive)
   - **Groups:** Select appropriate host groups
   - **Interfaces:** **DO NOT add any interface** (active agent doesn't need one)
4. Click **Add**

### 3. Link the Template

1. In the host configuration, go to the **Templates** tab
2. Click **Select** next to **Link new templates**
3. Find and select **Docker by Zabbix Active Agent 2**
4. Click **Add** (in the template selection popup)
5. Click **Update** to save the host configuration

### 4. Wait for Data Collection

- Active agents check in with the Zabbix server automatically
- Initial data should appear within 1-2 minutes
- Container discovery runs every 15 minutes by default
- Check **Monitoring → Latest data** to verify data collection

## Template Macros

You can customize container discovery and alerting using the following macros:

| Macro                                        | Default Value      | Description                                                             |
| -------------------------------------------- | ------------------ | ----------------------------------------------------------------------- |
| `{$DOCKER.LLD.FILTER.CONTAINER.MATCHES}`     | `.*`               | Regular expression to match container names for discovery               |
| `{$DOCKER.LLD.FILTER.CONTAINER.NOT_MATCHES}` | `CHANGE_IF_NEEDED` | Regular expression to exclude container names from discovery            |
| `{$DOCKER.CONTAINERS.STOPPED.MAX.WARN}`      | `1`                | Maximum number of stopped containers before warning trigger (threshold) |
| `{$DOCKER.CONTAINERS.STOPPED.MAX.CRIT}`      | `20`               | Critical threshold for stopped containers (high priority alert)         |

### Macro Configuration Examples

#### Example 1: Filter Specific Containers

To monitor only containers starting with "prod-":

1. Go to **Configuration → Hosts**
2. Select your Docker host
3. Click on **Macros**
4. Find `{$DOCKER.LLD.FILTER.CONTAINER.MATCHES}`
5. Change value to: `^prod-.*`
6. Click **Update**

#### Example 2: Exclude Test Containers

To exclude containers with "test" or "dev" in their names:

1. Go to **Configuration → Hosts**
2. Select your Docker host
3. Click on **Macros**
4. Find `{$DOCKER.LLD.FILTER.CONTAINER.NOT_MATCHES}`
5. Change value to: `.*(test|dev).*`
6. Click **Update**

#### Example 3: Adjust Stopped Container Thresholds

To change the warning threshold for stopped containers to 5 and critical to 15:

1. Go to **Configuration → Hosts**
2. Select your Docker host
3. Click on **Macros**
4. Find `{$DOCKER.CONTAINERS.STOPPED.MAX.WARN}` and change to: `5`
5. Find `{$DOCKER.CONTAINERS.STOPPED.MAX.CRIT}` and change to: `15`
6. Click **Update**

**Note:** These thresholds help you manage Docker resource cleanup by alerting when too many containers are stopped but not removed.

## Monitored Metrics

### Docker Engine Metrics

- Docker service status (up/down)
- Docker engine name
- Server version
- Total containers count
- Running containers count
- Stopped containers count
- Paused containers count
- Total images count
- CPU count
- Total memory

### Per-Container Metrics (Auto-discovered)

- Container running state
- Container status (running, exited, created, etc.)
- CPU usage percentage
- Memory usage (bytes)
- Network RX (bits per second)
- Network TX (bits per second)

## Triggers

### Docker Service Level

- **Docker: Service is down** (High priority) - Triggered when Docker engine is not responding
- **Docker: No data received** (Warning) - Triggered when no data received for 30 minutes

### Container Level

- **Docker: Container {#NAME} is not running** (Warning) - Triggered when a discovered container stops

### Container Capacity Management

- **Docker: Too many stopped containers** (Warning) - Triggered when the number of stopped containers exceeds `{$DOCKER.CONTAINERS.STOPPED.MAX.WARN}` (default: 1)
- **Docker: Critical number of stopped containers** (High priority) - Triggered when stopped containers exceed `{$DOCKER.CONTAINERS.STOPPED.MAX.CRIT}` (default: 20)
- **Docker: Stopped containers count increased** (Info) - Informational trigger when new containers are stopped

**Best Practice:** Regularly clean up stopped containers using `docker container prune` to avoid capacity issues and maintain system performance.

## Troubleshooting

### "Docker: No data received for 30m" - CRITICAL ISSUE

If you see this warning on **ALL** hosts, this is the most common issue with active agents. Follow these steps **in order**:

#### Step 1: Verify Hostname Configuration Match

The hostname in the agent configuration **MUST EXACTLY MATCH** the host name in Zabbix frontend (case-sensitive!):

**For Static Hostname (Option A):**

```bash
# Check the hostname in agent config
grep "^Hostname=" /etc/zabbix/zabbix_agent2.conf
```

**For Dynamic Hostname (Option B - HostnameItem):**

```bash
# Check what HostnameItem is configured
grep "^HostnameItem=" /etc/zabbix/zabbix_agent2.conf

# Check the actual value it returns
zabbix_agent2 -t system.hostname
# Or if using FQDN:
zabbix_agent2 -t system.hostname[fqdn]

# Or check system hostname directly
hostname
# Or FQDN:
hostname -f
```

Then verify in Zabbix frontend:

1. Go to **Configuration → Hosts**
2. Check the **Host name** (NOT the "Visible name")
3. They must be **IDENTICAL** (including case)

**Example with Static Hostname:**

```ini
# In /etc/zabbix/zabbix_agent2.conf
Hostname=docker-server-01

# In Zabbix frontend, Host name must be exactly:
docker-server-01
# NOT: Docker-Server-01, docker_server_01, or any other variation!
```

**Example with Dynamic Hostname:**

```bash
# Check what the agent will use:
$ zabbix_agent2 -t system.hostname
system.hostname                              [s|prod-asset-management]

# In Zabbix frontend, Host name must be exactly:
prod-asset-management
# This is what the agent will report to Zabbix!
```

#### Step 2: Verify Agent is Connecting to Server

Check the agent log for active checks:

```bash
sudo tail -f /var/log/zabbix/zabbix_agent2.log | grep -i active
```

**Good output** (agent connecting successfully):

```
active check configuration update from [192.168.1.10:10051] is working
```

**Bad output** (connection problem):

```
cannot connect to [[192.168.1.10]:10051]: [111] Connection refused
no active checks on server [192.168.1.10:10051]: host [docker-server-01] not found
```

If you see "host not found", the hostname doesn't match!

#### Step 3: Check ServerActive Configuration

Verify the server address is correct:

```bash
grep "^ServerActive=" /etc/zabbix/zabbix_agent2.conf
```

The IP/hostname must be reachable from the agent:

```bash
# Test connectivity
telnet YOUR_ZABBIX_SERVER_IP 10051
# Or use nc if telnet is not available
nc -zv YOUR_ZABBIX_SERVER_IP 10051
```

#### Step 4: Verify No Passive Interface is Added

In Zabbix frontend:

1. Go to **Configuration → Hosts**
2. Select your Docker host
3. Go to **Interfaces** section
4. **There should be NO interface listed!**
5. If you see an agent interface (IP:10050), **DELETE IT**

Active agents don't need interfaces - having one can cause issues.

#### Step 5: Restart Agent and Watch Logs

After fixing configuration:

```bash
# Restart agent
sudo systemctl restart zabbix-agent2

# Watch logs for 30 seconds
sudo tail -f /var/log/zabbix/zabbix_agent2.log
```

Look for:

- ✅ `active check configuration update from [SERVER:10051] is working`
- ✅ `sending list of active checks to [SERVER:10051]`
- ❌ `host [NAME] not found` - hostname mismatch!
- ❌ `Connection refused` - ServerActive is wrong or firewall blocking

#### Step 6: Test Docker Plugin Manually

Even if agent connects, verify Docker plugin works:

```bash
# Test as zabbix user
sudo -u zabbix zabbix_agent2 -t docker.ping
sudo -u zabbix zabbix_agent2 -t docker.info
```

**Expected output:**

```
docker.ping                                   [u|1]
docker.info                                   [s|{"ID":"xxxx","Containers":5,...}]
```

**If you get errors:**

```bash
# Add zabbix to docker group (if not done)
sudo usermod -aG docker zabbix

# MUST restart agent after group change!
sudo systemctl restart zabbix-agent2

# Verify group membership
id zabbix
# Should show: groups=... docker ...
```

#### Quick Checklist

Use this checklist to verify everything:

- [ ] **Hostname matches exactly:**
  - [ ] For static: `Hostname` in `/etc/zabbix/zabbix_agent2.conf` matches Zabbix host name
  - [ ] For dynamic: Output of `zabbix_agent2 -t system.hostname` (or configured HostnameItem) matches Zabbix host name
- [ ] `ServerActive` points to correct Zabbix server IP:10051
- [ ] Agent logs show "active check configuration update is working"
- [ ] NO interface added to the host in Zabbix frontend
- [ ] `zabbix` user is in `docker` group: `groups zabbix`
- [ ] Agent restarted after any configuration changes
- [ ] Docker socket accessible: `sudo -u zabbix docker ps` works
- [ ] Test items return data: `zabbix_agent2 -t docker.ping` returns 1

#### Still Not Working?

Enable debug logging:

```bash
# Edit agent config
sudo nano /etc/zabbix/zabbix_agent2.conf

# Change or add:
DebugLevel=4

# Restart agent
sudo systemctl restart zabbix-agent2

# Watch detailed logs
sudo tail -f /var/log/zabbix/zabbix_agent2.log
```

Look for specific error messages about:

- Connection issues
- Hostname mismatches
- Permission problems
- Plugin errors

**Don't forget to set `DebugLevel=3` back after troubleshooting!**

### Agent Not Sending Data

1. Check if the agent is running:

   ```bash
   sudo systemctl status zabbix-agent2
   ```

2. Check agent logs:

   ```bash
   sudo tail -f /var/log/zabbix/zabbix_agent2.log
   ```

3. Verify connectivity to Zabbix Server:
   ```bash
   telnet YOUR_ZABBIX_SERVER_IP 10051
   ```

### Docker Plugin Issues

1. Test Docker access as zabbix user:

   ```bash
   sudo -u zabbix docker ps
   ```

2. If permission denied, verify zabbix is in docker group:

   ```bash
   groups zabbix
   ```

3. Check Docker plugin is loaded:
   ```bash
   zabbix_agent2 -t docker.ping
   ```

### Container Discovery Not Working

1. Verify containers are running:

   ```bash
   docker ps
   ```

2. Test discovery manually:

   ```bash
   zabbix_agent2 -t 'docker.containers.discovery[false]'
   ```

3. Check macro filters in the host configuration

### Common Issues

**Problem:** Permission denied accessing Docker socket  
**Solution:** Ensure zabbix user is in docker group and agent has been restarted

**Problem:** Host shows as "not monitored" in Zabbix  
**Solution:** Check `ServerActive` and `Hostname` parameters match Zabbix configuration

**Problem:** No data after template linking  
**Solution:** Wait 1-2 minutes for active agent to check in, verify agent logs

## File Structure

```
.
├── files/
│   └── docker.conf                      # Docker plugin configuration
├── template_docker_agent_2_active.yaml  # Zabbix template file
└── README.md                            # This file
```

## Version Information

- **Template Version:** 1.0-0
- **Zabbix Version:** 7.4+
- **Author:** Adrian Schmolzi
- **Date:** November 2025

## License

This template is provided as-is for monitoring Docker environments with Zabbix.

## Support

For issues or questions:

1. Check the Zabbix Agent 2 logs: `/var/log/zabbix/zabbix_agent2.log`
2. Review Docker logs: `sudo journalctl -u docker`
3. Consult official Zabbix documentation: https://www.zabbix.com/documentation/current/

## Additional Resources

- [Zabbix Agent 2 Documentation](https://www.zabbix.com/documentation/current/manual/appendix/config/zabbix_agent2)
- [Docker Plugin Documentation](https://www.zabbix.com/documentation/current/manual/config/items/itemtypes/zabbix_agent/zabbix_agent2)
- [Active vs Passive Checks](https://www.zabbix.com/documentation/current/manual/appendix/items/activepassive)
