# FSP UPS ViewPower by USB

## Overview

This template monitors FSP UPS devices connected locally via USB using
ViewPower software.

Data is collected using a custom PowerShell script executed via
Zabbix Agent 2 UserParameters.

The template retrieves operational data directly from the local
ViewPower web service and provides monitoring of UPS status,
battery condition, electrical parameters, and operating mode.

Designed for single-UPS deployments per monitored host.

---

## Template Information

| Property | Value |
|-----------|--------|
| Template name | FSP UPS ViewPower by USB |
| Template group | Templates/Power |
| Zabbix version | 7.4 |
| Monitoring type | Zabbix Agent 2 (UserParameter) |

---

## Monitored Metrics

| Name | Key | Units | Update |
|------|-----|-------|--------|
| UPS Battery Capacity | `ups.battery[battery,{$UPS.PORT}]` | % | 30s |
| UPS Run time | `ups.battery[runtime,{$UPS.PORT}]` | min | 30s |
| UPS Input Voltage | `ups.input[inputV,{$UPS.PORT}]` | V | 30s |
| UPS Frequency | `ups.mode[freq,{$UPS.PORT}]` | Hz | 30s |
| UPS Load | `ups.mode[load,{$UPS.PORT}]` | % | 30s |
| UPS Mode | `ups.mode[mode,{$UPS.PORT}]` | — | 30s |
| UPS Temperature | `ups.mode[temp,{$UPS.PORT}]` | °C | 30s |

---

## Triggers

### UPS battery low (<30%)

Expression:

```
last(/FSP UPS ViewPower by USB/ups.battery[battery,{$UPS.PORT}])<30
```

Severity: **High**

---

### UPS running on battery

Expression:

```
find(/FSP UPS ViewPower by USB/ups.mode[mode,{$UPS.PORT}],,"like","Battery")=1
and
find(/FSP UPS ViewPower by USB/ups.mode[mode,{$UPS.PORT}],,"like","test")=0
```

Severity: **High**

---

## Macros

| Macro | Description |
|--------|------------|
| `{$UPS.PORT}` | USB port identifier from ViewPower (e.g. USB388D857_P01) |

Each monitored host must define this macro with the appropriate USB
device identifier.

---

## Requirements

- Windows host
- Zabbix Agent 2 installed
- ViewPower software installed and running
- PowerShell 5.1 or newer
- Custom PowerShell script deployed on the monitored host
- Recommended item timeout ≥ 10 seconds

---

## Zabbix Agent 2 Configuration

Create or edit a configuration file inside the Zabbix Agent 2
configuration directory and add:

```
UserParameter=ups.battery[*],powershell -ExecutionPolicy Bypass -File "C:\Path\to\ups.ps1" "$1" "$2"
UserParameter=ups.input[*],powershell -ExecutionPolicy Bypass -File "C:\Path\to\ups.ps1" "$1" "$2"
UserParameter=ups.mode[*],powershell -ExecutionPolicy Bypass -File "C:\Path\to\ups.ps1" "$1" "$2"
```

After configuration, restart Zabbix Agent 2.

---

## PowerShell Script (ups.ps1)

The following script must be deployed manually on the monitored host:

```powershell
param (
    [string]$Key,
    [string]$PortName
)

if ([string]::IsNullOrEmpty($PortName)) {
    Write-Output "ZBX_NOTSUPPORTED"
    exit 1
}

try {
    $uri = "http://localhost:15178/ViewPower/workstatus/reqMonitorData"
    $body = "portName=$PortName"

    $response = Invoke-WebRequest -Uri $uri -Method POST -Body $body -UseBasicParsing -TimeoutSec 8

    $stream = $response.RawContentStream
    $reader = New-Object System.IO.StreamReader($stream)
    $content = $reader.ReadToEnd()
    $reader.Close()

    Add-Type -AssemblyName System.Web.Extensions
    $serializer = New-Object System.Web.Script.Serialization.JavaScriptSerializer
    $serializer.MaxJsonLength = 67108864

    $json = $serializer.DeserializeObject($content)

    if (-not $json.ContainsKey("workInfo")) {
        Write-Output "ZBX_NOTSUPPORTED"
        exit 1
    }

    $workInfo = $json["workInfo"]

    switch ($Key) {
        "battery" { $workInfo["batteryCapacity"] }
        "runtime" { $workInfo["batteryRemainTime"] }
        "inputV"  { $workInfo["inputVoltage"] }
        "load"    { [int]$workInfo["outputLoadPercent"] }
        "freq"    { $workInfo["outputFrequency"] }
        "temp"    { $workInfo["temperatureView"] }
        "mode"    { $workInfo["workMode"] }
        default   { "ZBX_NOTSUPPORTED" }
    }
}
catch {
    Write-Output "ZBX_NOTSUPPORTED"
    exit 1
}
```

---

## Notes

- Designed for one UPS per monitored host.
- Script execution time depends on ViewPower response time.
- If script execution fails, items return `ZBX_NOTSUPPORTED`.
- Ensure PowerShell execution policy allows script execution.
- Adjust timeout if ViewPower response is slow.

---

## License

GNU General Public License v3.0
