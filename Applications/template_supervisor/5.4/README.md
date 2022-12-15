# Supervisor applications checks

## Overview

Check uptime, status applications in supervisord

For Zabbix 5.4 and higher. 

## Author

dslimp (https://github.com/dslimp)

## Macros used

`{$SUPERVISOR_SOCKET}` Path to supervisor socket. Default  /var/run/supervisor.sock 

## Template links
- [zabbix_template_supervisor.xml](zabbix_template_supervisor.xml)

## Script Links
- [script/supervisor.py](script/supervisor.py)

## Setup
- Download the [script/supervisor.py](script/supervisor.py) script from this repository and place it in zabbix script directory
- Run `chmod +x supervisor.py` to make the script executable
- Test executing the script from the CLI of your Zabbix server by running the python script inputing the command and socket like `./supervisor.py discovery /var/run/supervisor.sock`
- Make sure the output is either applications and haven'tß error
- Download and install [supervisor.conf](supervisor.conf) to zabbix_agent.d config directory
- Once the script works OK, download the [zabbix_template_supervisor.xml](zabbix_template_supervisor.xml) Zabbix template from this repository and import it into your Zabbix server
- Apply the imported template to the host
- Check the latest data to make sure you are getting the proper value from the script

## Items collected

supervisor raw data - all data about processes in JSON

## Discovery

supervisor discovery

# Item prototypes

Service {#SUPERVISOR_PROCESS_NAME} now

Service {#SUPERVISOR_PROCESS_NAME} spawnerr

Service {#SUPERVISOR_PROCESS_NAME} start

Service {#SUPERVISOR_PROCESS_NAME} statename

Service {#SUPERVISOR_PROCESS_NAME} stop

Service {#SUPERVISOR_PROCESS_NAME} uptime

All item dependent from supervisor raw data

# Trigger prototypes

Service {#SUPERVISOR_PROCESS_NAME} fail

Service {#SUPERVISOR_PROCESS_NAME} inifinity restart

Service {#SUPERVISOR_PROCESS_NAME} uptime < 60 sec	

# Trigger

No data supervisor 10 min 
