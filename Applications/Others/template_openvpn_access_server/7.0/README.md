# OpenVPN Access Server

This Zabbix template monitors an OpenVPN Access Server through the local `sacli` command.

It monitors the number of connected VPN clients and uses low-level discovery to monitor every internal service returned by `sacli status`. The template imports as `OpenVPN Access Server` and is exported for Zabbix `7.0`.

## Files

- `openvpn_access.yaml` - Zabbix template export.

No external monitoring scripts are required. The Zabbix agent executes the necessary `sacli` and `jq` commands through user parameters.

## What it does

- Collects the current number of connected clients with `openvpn.n_clients`.
- Collects the complete internal service status object with `openvpn.status` every minute.
- Does not store history or trends for the raw `openvpn.status` master item.
- Discovers every property in the OpenVPN `service_status` JSON object.
- Creates a dependent status item named `openvpn.service.status[{#SERVICE.NAME}]` for every discovered service.
- Stores 30 days of history for each discovered service status.
- Tags discovered items and triggers with the service name.
- Raises a Warning when the number of connected clients exceeds `{$OVPN_CLIENTS}`.
- Raises a Warning when an internal service status is not `on`.
- Deletes resources for services that have not been discovered for seven days.

## Requirements

The monitored host must have:

- OpenVPN Access Server with `/usr/local/openvpn_as/scripts/sacli`.
- Zabbix agent or Zabbix agent 2.
- `jq` installed and available in the Zabbix agent's execution path.
- Permission for the Zabbix agent user to execute the required `sacli` commands with `sudo` without an interactive password prompt.

The template expects these Zabbix agent keys:

- `openvpn.n_clients`
- `openvpn.status`

Add the following user parameters to the Zabbix agent configuration, for example in an included `openvpn.conf` file:

```text
UserParameter=openvpn.n_clients,sudo /usr/local/openvpn_as/scripts/sacli VPNSummary | jq -r '.n_clients'
UserParameter=openvpn.status,sudo /usr/local/openvpn_as/scripts/sacli status | jq -r '.service_status'
```

Configure `sudoers` so the Zabbix agent user can execute `sacli` without an interactive password prompt. Edit the configuration with `visudo` and add:

```text
# Allow Zabbix to execute sacli
zabbix ALL=(ALL) NOPASSWD: /usr/local/openvpn_as/scripts/sacli
```

Validate the `sudoers` change with `visudo` before restarting the agent.

## Installation

1. Install `jq` on the OpenVPN Access Server.
2. Add the `openvpn.n_clients` and `openvpn.status` user parameters to the Zabbix agent configuration.
3. Grant the Zabbix agent user passwordless `sudo` access to the two required `sacli` commands.
4. Restart the Zabbix agent.
5. Import `openvpn_access.yaml` in Zabbix under `Data collection` -> `Templates` -> `Import`.
6. Link `OpenVPN Access Server` to the OpenVPN Access Server host.
7. Adjust `{$OVPN_CLIENTS}` if the default limit of 28 connected clients is not appropriate.
8. Verify that the raw status item is supported and that the internal services are discovered.

## Items and discovery

| Name | Key | Type | Update interval | History |
| --- | --- | --- | --- | --- |
| `OpenVPN – Active Clients` | `openvpn.n_clients` | Zabbix agent | 1 minute | Zabbix default |
| `OpenVPN – Service status data` | `openvpn.status` | Zabbix agent master item | 1 minute | None |
| `OpenVPN service discovery` | `openvpn.service.discovery` | Dependent discovery | On master-item update | N/A |
| `OpenVPN service {#SERVICE.NAME}: Status` | `openvpn.service.status[{#SERVICE.NAME}]` | Dependent item prototype | On master-item update | 30 days |

The `openvpn.status` value must be a JSON object whose property names are service names and whose values are their current states. For example:

```json
{
  "api": "on",
  "iptables_live": "on",
  "openvpn_0": "on",
  "web": "on"
}
```

## Macros

| Macro | Default | Description |
| --- | --- | --- |
| `{$OVPN_CLIENTS}` | `28` | Maximum permitted number of connected OpenVPN clients before a Warning is raised. |

## Triggers

| Trigger | Condition | Severity | Operational data |
| --- | --- | --- | --- |
| `OpenVPN – Active Clients` | Connected clients are greater than `{$OVPN_CLIENTS}` | Warning | None |
| `OpenVPN service {#SERVICE.NAME} is not on` | Discovered service status is not `on` | Warning | `{ITEM.LASTVALUE1}` |

## Troubleshooting

If either item is unsupported or service discovery does not create items, check the following:

- The Zabbix agent configuration includes both user parameters and the agent has been restarted.
- The `zabbix` user can execute both configured commands without a password prompt.
- `/usr/local/openvpn_as/scripts/sacli` exists and is executable.
- `jq` is installed and accessible to the Zabbix agent.
- `openvpn.n_clients` returns only a numeric value.
- `openvpn.status` returns a valid JSON object rather than an error message or an empty value.
- The OpenVPN status object contains `service_status`.
- The Zabbix server or proxy can reach the agent on the configured interface and port.

To test the commands locally with the same permissions as the agent, run:

```bash
sudo -u zabbix sh -c "sudo /usr/local/openvpn_as/scripts/sacli VPNSummary | jq -r '.n_clients'"
sudo -u zabbix sh -c "sudo /usr/local/openvpn_as/scripts/sacli status | jq -r '.service_status'"
```

The first command should return a number. The second command should return the JSON service status object.
