# Zabbix 7.0.X NUT template

This version is based strictly on the variables actually exposed by:

    upsc UPS@IP:port

## Assumptions

- NUT ('nut-client', 'nut-server') is installed and configured.
- Zabbix Agent is installed and configured.
- NUT is operational and 'upsc UPS@IP:port' returns the expected data.
- The UPS connection endpoint is configured per monitored host in 'nut_zabbix.sh'.
- The template does not perform NUT discovery or configuration.

## Install

Root privileges will most likely be required.

1. Copy the helper script:

       cp nut_zabbix.sh /usr/local/bin/

2. Configure the UPS endpoint.

   Edit '/usr/local/bin/nut_zabbix.sh' and set 'UPS' to the NUT UPS name and server address for the target host.

   Example:

       UPS="ups01@192.168.0.99"

3. Set the correct permissions:

       chmod 755 /usr/local/bin/nut_zabbix.sh

4. Install the Zabbix Agent configuration:

       cp zabbix_agentd_conf.d/nut.conf /etc/zabbix/zabbix_agentd.conf.d/nut.conf

5. Restart the Zabbix Agent:

       systemctl restart zabbix-agent

## Test

Test each UserParameter from the command line:

    zabbix_agentd -t nut.ups.status
    zabbix_agentd -t nut.comm
    zabbix_agentd -t nut.battery.charge
    zabbix_agentd -t nut.battery.voltage
    zabbix_agentd -t nut.input.voltage
    zabbix_agentd -t nut.input.frequency
    zabbix_agentd -t nut.output.voltage
    zabbix_agentd -t nut.ups.load

The commands should return values obtained from NUT.

## Zabbix configuration

Import 'zabbix_nut_7.0.yaml' into Zabbix 7.0.X and link the 'NUT UPS' template to the target host running the Zabbix Agent.