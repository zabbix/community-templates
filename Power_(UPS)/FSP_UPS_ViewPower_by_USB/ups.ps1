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
        "outputV" { $workInfo["outputVoltage"] }
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
