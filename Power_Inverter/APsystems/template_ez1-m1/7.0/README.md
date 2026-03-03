# Template for APsystems EZ1-M1 inverters

The data from APsystems EZ1-M1 inverters is not only accessible by bluetooth but also via an API.


## Includes queries

With this template you can query:
- Energy generation stats
- Alarm status
- Generic device infos


## Triggers

To get notified there are triggers configured for
- DC short circuit
- AC offgrid / output fault


## Configuration needed for API access

1. Connect to the inverter with the "AP EasyPower" app via bluetooth
2. Open settings (gear symbol at top right)
3. Select "Local Mode"
4. Enable the "Enable Local Mode" setting

To test if this worked you can open the following URL with your browser (replace the IP with your inverters IP address):
http://INVERTER_IP:8050/getDeviceInfo