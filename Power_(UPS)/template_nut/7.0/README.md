# Zabbix 7.0 NUT UPS Template

Monitor UPS devices exposed by [Network UPS Tools (NUT)](https://networkupstools.org/) with Zabbix 7.0.

This template supports both local and remote NUT servers. USB presence monitoring is optional and is intended only for UPS devices physically attached to the monitored host over USB.

## Features

- Local or remote NUT monitoring.
- Configurable UPS name and NUT server through Zabbix macros.
- No hard-coded UPS endpoint in the helper script.
- No `UnsafeUserParameters=1` requirement for normal use.
- Optional USB presence check without manually configuring USB VID/PID.
- Battery charge, runtime and voltage monitoring.
- Input/output voltage and optional input frequency monitoring.
- UPS load and NUT status monitoring.
- Communication, on-battery, low-battery, forced-shutdown, runtime, load and USB triggers.
- Built-in graphs for battery charge/load, runtime and voltage.

## Requirements

- Zabbix 7.0.x.
- Zabbix Agent or Zabbix Agent 2 on the host executing the checks.
- NUT client tools (`upsc`) installed and able to query the target UPS.
- NUT server/driver configured and operational.
- `usbutils` only when optional USB presence monitoring is enabled.

The following command must work before configuring Zabbix:

```bash
upsc ups@localhost
```

For a remote NUT server, for example:

```bash
upsc ups01@192.168.1.20
```

## Files

```text
7.0/
├── README.md
├── template_zabbix_nut_7.0.yaml
└── files/
    ├── nut.conf
    └── nut_zabbix.sh
```

`nut_zabbix.sh` is a small helper that builds the NUT endpoint from template macros and executes `upsc`. Keeping the UPS name and host as separate Zabbix item parameters avoids requiring `UnsafeUserParameters=1` for the `@` character.

## Installation

### 1. Verify NUT

Make sure NUT is already configured and the UPS can be queried:

```bash
upsc ups@localhost
```

The command should return NUT variables such as `ups.status`, `battery.charge`, `input.voltage`, and other values supported by the UPS.

### 2. Install the helper

Copy the helper script:

```bash
cp files/nut_zabbix.sh /usr/local/bin/nut_zabbix.sh
chmod 755 /usr/local/bin/nut_zabbix.sh
```

### 3. Install the Zabbix UserParameters

Copy `files/nut.conf` into the include directory used by your Zabbix Agent.

Common examples:

Zabbix Agent 2:

```bash
cp files/nut.conf /etc/zabbix/zabbix_agent2.d/nut.conf
systemctl restart zabbix-agent2
```

Classic Zabbix Agent:

```bash
cp files/nut.conf /etc/zabbix/zabbix_agentd.d/nut.conf
systemctl restart zabbix-agent
```

Package layouts can differ between distributions. If necessary, check the `Include=` setting in the agent configuration and place `nut.conf` in that directory.

### 4. Test the UserParameters

For Zabbix Agent 2:

```bash
zabbix_agent2 -t 'nut.get[ups,localhost,battery.charge]'
zabbix_agent2 -t 'nut.get[ups,localhost,battery.runtime]'
zabbix_agent2 -t 'nut.get[ups,localhost,ups.status]'
zabbix_agent2 -t 'nut.comm[ups,localhost]'
```

For classic Zabbix Agent, use `zabbix_agentd -t` with the same keys.

Expected examples:

```text
100
2400
OL
1
```

### 5. Import the template

Import:

```text
template_zabbix_nut_7.0.yaml
```

Then link the **NUT UPS** template to the host running the Zabbix Agent.

### 6. Configure template macros

The template uses these macros:

| Macro | Default | Description |
|---|---|---|
| `{$NUT.UPS.NAME}` | `ups` | UPS name as defined by NUT/upsd. |
| `{$NUT.UPS.HOST}` | `localhost` | NUT server host. A non-default port may be appended as `host:port`. |
| `{$NUT.USB.CHECK}` | `0` | Set to `1` only for a locally attached USB UPS when physical USB presence should be monitored. |

#### Local NUT example

```text
{$NUT.UPS.NAME}=ups
{$NUT.UPS.HOST}=localhost
{$NUT.USB.CHECK}=1
```

#### Remote NUT example

```text
{$NUT.UPS.NAME}=ups01
{$NUT.UPS.HOST}=192.168.1.20
{$NUT.USB.CHECK}=0
```

#### Remote NUT on a non-default port

```text
{$NUT.UPS.NAME}=ups01
{$NUT.UPS.HOST}=192.168.1.20:3494
{$NUT.USB.CHECK}=0
```

## USB presence monitoring

USB monitoring is optional and does not replace the NUT communication check.

When `{$NUT.USB.CHECK}=1`, the helper:

1. Reads `ups.vendorid` and `ups.productid` from NUT.
2. Uses those values with `lsusb`.
3. Returns:
   - `1` — USB device present.
   - `0` — USB device missing.
   - `2` — USB check disabled.

No USB bus/device path or VID/PID needs to be configured manually.

Install `usbutils` when this feature is enabled:

```bash
apt install usbutils
```

The USB check is useful for distinguishing a physical USB disconnect from a NUT communication or driver problem.

## Monitored items

The template includes:

- NUT communication.
- Battery charge.
- Battery runtime.
- Battery voltage.
- Input voltage.
- Input frequency.
- Output voltage.
- UPS load.
- UPS status.
- Optional USB presence.

### Optional NUT variables

UPS models do not expose exactly the same set of NUT variables.

For example, some UPS devices do not provide:

```text
input.frequency
```

If a variable is not exposed by `upsc`, the corresponding item can become unsupported. This does not indicate a failure of NUT or of the template; it means that metric is not provided by that UPS/driver combination.

Verify available variables with:

```bash
upsc <upsname>@<host>
```

## Triggers

The template includes triggers for:

- NUT communication loss.
- UPS on battery (`OB`).
- Low battery (`LB`).
- Forced shutdown (`FSD`).
- Battery charge below 20%.
- Battery runtime below 15 minutes.
- Battery runtime below 10 minutes.
- UPS load above 90%.
- Missing local USB UPS when USB monitoring is enabled.

The USB and communication triggers are designed to help distinguish a physical USB disconnect from a NUT communication failure.

## Graphs

Included graphs:

- Battery charge and UPS load.
- Battery runtime.
- Battery voltage.
- Input and output voltage.

## Upgrading from the previous 7.0 template

1. Back up/export the existing **NUT UPS** template.
2. Replace `/usr/local/bin/nut_zabbix.sh` with the new helper.
3. Replace the existing NUT UserParameter file with `files/nut.conf`.
4. Restart the Zabbix Agent.
5. Import `template_zabbix_nut_7.0.yaml` and update the existing template.
6. Review the template macros:
   - `{$NUT.UPS.NAME}`
   - `{$NUT.UPS.HOST}`
   - `{$NUT.USB.CHECK}`
7. Test the new keys from the command line.
8. Confirm Latest data, triggers and graphs before removing any previous custom configuration.

The new helper no longer requires editing a hard-coded UPS endpoint inside the script.

## Troubleshooting

### Communication item returns `0`

Test NUT directly:

```bash
upsc <upsname>@<host>
```

If this fails, resolve the NUT/server/network issue first.

### USB item is unsupported

Confirm USB monitoring is enabled only for a locally attached USB UPS:

```text
{$NUT.USB.CHECK}=1
```

Check that `usbutils` is installed:

```bash
lsusb
```

Also confirm that NUT exposes:

```bash
upsc <upsname>@<host> ups.vendorid
upsc <upsname>@<host> ups.productid
```

### A metric is unsupported

List the variables actually supplied by the UPS:

```bash
upsc <upsname>@<host>
```

Not all UPS models provide all NUT variables.

## Notes

This template monitors data already exposed by NUT. It does not install, discover, or configure NUT drivers or UPS devices.
