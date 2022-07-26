# mkove-mk75-zabbix-template
Zabbix 4.0 HTTP Agent Template for mkove MK75 12V Battery Monitor

## Instructions

https://www.mkove.com/mk75-battery-monitor/

https://github.com/jonopryor/mkove-mk75-zabbix-template

Connect the MK75 to your WiFi network.

Change the template macros or set host macros to match your battery specifications.

Update the MK75HOSTNAME template macro or set host macro with the IP Address / Hostname of your MK75.

This template uses the HTTP Agent.

## Items
- Volts
- Amps
- SOC
- Watts

## Triggers (Set to information only, customize as desired)
- BATTERY IS FULLY CHARGED
- BATTERY IS NOT FULLY CHARGED
- Charge rate is exceeding {$MAXCHARGEAMPS} amps
- Discharge rate is exceeding {$MAXDISCHARGEAMPS} amps
- Over Voltage
- SOC is less than 15%
- SOC is less than 25%
- SOC is less than 50%
- SOC is less than 75%
- Using more power than generated over previous 2 hours.
- Using more power than generated over previous 7 days.
- Using more power than generated over previous 12 hours.
- Using more power than generated over previous 24 hours.

## Graphs
- Volts / Amps
- SOC
- Watts

## TODO
- Upgrade Template to Zabbix 6.0LTS
- Develop predictive forecasting triggers

## Battery Monitor Information - 
https://www.mkove.com/mk75-battery-monitor/

## Screenshots
![image](https://user-images.githubusercontent.com/65431553/174693043-ab5f7bd8-d634-4b56-a636-1381d3b8d445.png)

