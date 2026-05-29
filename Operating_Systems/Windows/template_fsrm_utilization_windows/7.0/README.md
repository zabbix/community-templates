# FSRM Utilization

This Zabbix template monitors Microsoft File Server Resource Manager (FSRM) quota utilization on Windows file servers.

It discovers configured FSRM quotas through low-level discovery and creates one utilization item per quota. The utilization value is stored as a percentage.

The template imports as `FSRM Utilization` and is exported for Zabbix `7.0`.

## Files

- `template_fsrm_utilization_windows.yaml` - Zabbix template export.
- `files/quota-discovery.ps1` - Low-level discovery script for FSRM quotas.
- `files/quota-used.ps1` - Per-quota utilization script.
- `files/user_parameters.conf` - Example Zabbix Agent2 user parameters.

## What it does

- Discovers FSRM quotas with `fsrm.quota.discovery` every hour.
- Creates one item per discovered quota, checked every 5 minutes: `fsrm.quota.used[{#QUOTANAME}]`.
- Stores quota utilization as a floating-point percentage with `%` units.
- Tags discovered items with `component=FSRM`.
- Raises a warning trigger when quota utilization is above 95%.
- Raises a high-priority trigger when quota utilization is above 98%.

## Requirements

The monitored Windows host must provide these Zabbix agent keys:

- `fsrm.quota.discovery`
- `fsrm.quota.used[{#QUOTANAME}]`

The template expects the discovery rule to return low-level discovery data containing at least these macros:

- `{#QUOTANAME}` - the FSRM quota name used by the usage item key.
- `{#QUOTAPATH}` - the quota path shown in item and trigger names.

FSRM must be installed and configured on the monitored host, and the Zabbix agent service account must be able to query FSRM quota information.

The scripts are expected to be installed on the monitored host in:

```text
C:\Program Files\Zabbix Agent 2\scripts\
```

Add these user parameters to the Zabbix Agent2 configuration, for example in an included `.conf` file:

```text
UserParameter=fsrm.quota.discovery,powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Program Files\Zabbix Agent 2\scripts\quota-discovery.ps1"
UserParameter=fsrm.quota.used[*],powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Program Files\Zabbix Agent 2\scripts\quota-used.ps1" "$1"
```

## Installation

1. Import `template_fsrm_utilization_windows.yaml` in Zabbix under `Data collection` -> `Templates` -> `Import`.
2. Link `FSRM Utilization` to the Windows file server host.
3. Copy `files/quota-discovery.ps1` and `files/quota-used.ps1` to `C:\Program Files\Zabbix Agent 2\scripts\` on the monitored host.
4. Add the `fsrm.quota.discovery` and `fsrm.quota.used[*]` user parameters to the Zabbix Agent2 configuration.
5. Restart the Zabbix Agent2 service.
6. Verify that discovery returns quota data and that usage items become supported.

## Triggers

| Trigger | Expression | Severity |
| --- | --- | --- |
| `Quota warning on {#QUOTAPATH}` | `last(/FSRM Utilization/fsrm.quota.used[{#QUOTANAME}])>95` | Warning |
| `Quota warning on {#QUOTAPATH}` | `last(/FSRM Utilization/fsrm.quota.used[{#QUOTANAME}])>98` | High |

## Troubleshooting

If discovery or items are unsupported, check the following:

- The Zabbix agent configuration includes the user parameters for `fsrm.quota.discovery` and `fsrm.quota.used[*]`.
- `quota-discovery.ps1` and `quota-used.ps1` are present in `C:\Program Files\Zabbix Agent 2\scripts\`.
- The Zabbix agent service has permission to query FSRM quotas.
- FSRM is installed on the monitored host.
- `fsrm.quota.discovery` returns valid Zabbix low-level discovery JSON.
- The discovery JSON contains `{#QUOTANAME}` and `{#QUOTAPATH}` for every quota.
- `fsrm.quota.used[<quota-name>]` returns a numeric percentage value.

