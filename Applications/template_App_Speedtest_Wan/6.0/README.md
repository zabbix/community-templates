# Template_App_Speedtest_Wan
To store information from the ookla speedtest cli command into Zabbix.
# Author
Todd Blake
# Requirements:
* Zabbix version 6.0 or later
* the speedtest cli app from speedtest.net - https://www.speedtest.net/apps/cli (NOT the one from pypi)
* the timeout command to timeout a hanging speedtest command
* the zabbix_sender command for sending the data to zabbix
# Installation:
1. Import the Template_App_Speedtest_Wan.yaml template into your Zabbix instance (Configuration --> Templates --> Import), and apply the template to a host
2. Copy the record_speedtest.sh script to somewhere on your system, e.g. /usr/local/bin/record_speedtest.sh
3. Set the script to be executable, e.g. `chmod +x /usr/local/bin/record_speedtest.sh`
4. Edit the record_speedtest.sh script:
   - Set the SPDHOST variable to the name of the host you've applied the template too within Zabbix
   - Set the ZABSRV variable to the name/IP of your Zabbix server or proxy that the host is reporting too
   - Optionally, set the PSKID and PSKFILE variables if you're using encryption in your Zabbix environment.
   - Optionally, set the SPEEDTESTPARAMS variable to any additional needed speedtest parameters
5. Set the {$NO_SPDTST_DATA_SECS} macro to 300 seconds (5 minutes) more than the frequency of execution, in seconds.  i.e. If you run it every 6 hours, set the macro to 21900 (6 hours * 60 minutes per hour * 60 seconds per minute, then add 300 seconds to that.)
6. Install a crontab entry to run this script on a schedule:

    `0 */6 * * * /usr/local/bin/record_speedtest.sh # feed speedtest info into zabbix every 6 hours`

# Example Dashboard
![Example Dashboard](files/dashboard.png?raw=true "Example Dashboard")

## Macros used

|Macro|Default Value|Description|
|-----|-------------|-----------|
|{$NO_SPDTST_DATA_SECS}|21900 (6 hours and 5 minutes)|The number of seconds that Zabbix will alert when it's received no new speedtest data|
|{$BWIDTH_DL_ALERT}|209715200 (200Mbps)|The threshold for alerting if download bandwidth drops below this value|
|{$BWIDTH_UL_ALERT}|10485760 (10Mbps)|The threshold for alerting if upload bandwidth drops below this value|

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Speedtest JSON|The raw JSON from the speedtest command.  It's parsed out for all of the other fields except the run time.|Zabbix Trapper|custom.speedtest[json]|
|Run time|The time the record_speedtest.sh script was executed.|Zabbix Trapper|custom.speedtest[runtime]|
|Speedtest - Download Bandwidth|The measured bandwidth in bits per second.|Dependent Item|speedtest[download.bandwidth]|
|Speedtest - Download Bytes|The number of bytes downloaded in the test.|Dependent Item|speedtest[download.bytes]|
|Speedtest - Download Time Elapsed|The time to execute the download test.|Dependent Item|speedtest[download.elapsed]|
|Speedtest - External IP|The external (internet) IP address of the system executing the test.|Dependent Item|speedtest[interface.externalIp]|
|Speedtest - Internal IP|The internal (local) IP address of the system executing the test.|Dependent Item|speedtest[interface.internalIp]|
|Speedtest - ISP|The ISP of the system executing the test.|Dependent Item|speedtest[isp]|
|Speedtest - Packet Loss|Packets lost during the test.|Dependent Item|speedtest[packetLoss]|
|Speedtest - Ping Jitter|The recorded ping jitter for the test.|Dependent Item|speedtest[ping.jitter]|
|Speedtest - Ping Latency|The recorded ping latency for the test.|Dependent Item|speedtest[ping.latency]|
|Speedtest - Result ID|The ID at speedtest.net of the results.|Dependent Item|speedtest[result.id]|
|Speedtest - Result URL|The URL at speedtest.net of the results.|Dependent Item|speedtest[result.url]|
|Speedtest - Server Country|The country of the selected speedtest server.|Dependent Item|speedtest[server.country]|
|Speedtest - Server Host|The hostname of the selected speedtest server.|Dependent Item|speedtest[server.host]|
|Speedtest - Server ID|The speedtest ID of the selected speedtest server.|Dependent Item|speedtest[server.id]|
|Speedtest - Server IP|The IP address of the selected speedtest server.|Dependent Item|speedtest[server.ip]|
|Speedtest - Server Location|The geographical location (City, State in the US for example) of the selected speedtest server.|Dependent Item|speedtest[server.location]|
|Speedtest - Server Name|The human readable speedtest.net name of the selected speedtest server.|Dependent Item|speedtest[server.name]|
|Speedtest - Server Port|The TCP port used of the selected speedtest server.|Dependent Item|speedtest[server.port]|
|Speedtest - Timestamp|The timestamp of the test recorded from speedtest.net.|Dependent Item|speedtest[timestamp]|
|Speedtest - Upload Bandwidth|The measured bandwidth in bits per second.|Dependent Item|speedtest[upload.bandwidth]|
|Speedtest - Upload Bytes|The number of bytes uploaded in the test.|Dependent Item|speedtest[upload.bytes]|
|Speedtest - Upload Time Elapsed|The time to execute the upload test.|Dependent Item|speedtest[upload.elapsed]|

## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|No new speed test data received in the last {$NO_SPDTST_DATA_SECS} seconds|We haven't received any new JSON data from speedtest in the last {$NO_SPDTST_DATA_SECS} seconds.|nodata(/Template_App_Speedtest/custom.speedtest[json],{$NO_SPDTST_DATA_SECS})=1|High|
|Download bandwidth is less than {$BWIDTH_DL_ALERT}|The measured download bandwidth has dropped below {$BWIDTH_DL_ALERT}bps.|max(/Template_App_Speedtest_Wan/speedtest[download.bandwidth],#3)<{$BWIDTH_DL_ALERT}|Warning|
|Upload bandwidth is less than {$BWIDTH_UL_ALERT}|The measured upload bandwidth has dropped below {$BWIDTH_UL_ALERT}bps.|max(/Template_App_Speedtest_Wan/speedtest[upload.bandwidth],#3)<{$BWIDTH_UL_ALERT}|Warning|
