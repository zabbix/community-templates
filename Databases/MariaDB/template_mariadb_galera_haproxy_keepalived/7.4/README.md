# Template MariaDB Galera HAProxy Keepalived

## Overview

Template for monitoring a local MariaDB Galera node with local HAProxy and Keepalived services.

The template is designed for a 3-node Galera cluster where each node runs:

- MariaDB Galera
- HAProxy with a local MySQL frontend on port `3307`
- Keepalived with a shared virtual IP address
- Zabbix agent with custom `UserParameter` checks

The template includes a host dashboard named `MariaDB Galera node overview`.

## Installation

The template uses Zabbix agent `UserParameter` keys. Install the helper script and agent configuration from the upstream project on each Galera node:

```bash
git clone https://github.com/Sorway/Zabbix-Galera.git
cd Zabbix-Galera
sudo install -o root -g root -m 0755 scripts/check.sh /usr/local/bin/galera-check.sh
sudo install -o root -g root -m 0644 zabbix_agentd.conf.d/agent.conf /etc/zabbix/zabbix_agentd.conf.d/galera.conf
```

Install the runtime dependencies:

```bash
sudo apt install -y mariadb-client socat iproute2 procps
```

Create a MariaDB monitoring user:

```sql
CREATE USER 'zabbix-monitor'@'localhost' IDENTIFIED BY 'ChangeThisPassword';
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'zabbix-monitor'@'localhost';
FLUSH PRIVILEGES;
```

Create the MariaDB client credentials file used by the script:

```bash
sudo install -o zabbix -g zabbix -m 0600 /dev/null /etc/zabbix/.my.cnf
sudo tee /etc/zabbix/.my.cnf >/dev/null <<'EOF'
[client]
user=zabbix-monitor
password=ChangeThisPassword
host=localhost
port=3306
EOF
sudo chown zabbix:zabbix /etc/zabbix/.my.cnf
sudo chmod 0600 /etc/zabbix/.my.cnf
```

Configure the HAProxy stats socket in the `global` section:

```haproxy
stats socket /run/haproxy/admin.sock user haproxy group zabbix mode 660 level admin
stats timeout 2s
```

By default, the helper script counts backend servers that are `UP` in the HAProxy backend named `galera_back`. If your backend has another name, update `/usr/local/bin/galera-check.sh` after installation.

Restart the services after installation:

```bash
sudo systemctl restart haproxy
sudo systemctl restart zabbix-agent
```

Import `template_mariadb_galera_haproxy_keepalived.yaml` in Zabbix and link it to the hosts representing the Galera nodes.

## Local checks

Run these commands on each node to verify data collection:

```bash
sudo -u zabbix /usr/local/bin/galera-check.sh mysql.ping
sudo -u zabbix /usr/local/bin/galera-check.sh galera.value wsrep_cluster_size
sudo -u zabbix /usr/local/bin/galera-check.sh haproxy.backends_up_count
sudo -u zabbix /usr/local/bin/galera-check.sh keepalived.vip.present 192.168.10.40
```

## Author

Sorway

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$GALERA.EXPECTED_SIZE}|Expected Galera cluster size.|`3`|Text macro|
|{$GALERA.FLOW_CONTROL.MAX}|Maximum acceptable `wsrep_flow_control_paused` average.|`0.05`|Text macro|
|{$GALERA.RECV_QUEUE.MAX}|Maximum acceptable `wsrep_local_recv_queue` average.|`10`|Text macro|
|{$HAPROXY.MIN_BACKENDS_UP}|Minimum number of available MariaDB backend servers in HAProxy.|`2`|Text macro|
|{$KEEPALIVED.VIP}|Keepalived virtual IP address.|`<CHANGE_ME>`|Text macro|

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|MariaDB: mysqladmin ping|Checks local MariaDB availability with `mysqladmin ping`.|`Zabbix agent`|mariadb.mysqladmin.ping<p>Update: 30s</p>|
|Galera: cluster is Primary|Checks whether the node belongs to the Primary component.|`Zabbix agent`|mariadb.galera.primary<p>Update: 30s</p>|
|Galera: node ready|Checks `wsrep_ready`.|`Zabbix agent`|mariadb.galera.ready<p>Update: 30s</p>|
|Galera: node connected|Checks `wsrep_connected`.|`Zabbix agent`|mariadb.galera.connected<p>Update: 30s</p>|
|Galera: node synced|Checks whether the local Galera state comment is `Synced`.|`Zabbix agent`|mariadb.galera.synced<p>Update: 30s</p>|
|Galera: cluster size|Collects `wsrep_cluster_size`.|`Zabbix agent`|mariadb.galera.value[wsrep_cluster_size]<p>Update: 30s</p>|
|Galera: local state|Collects `wsrep_local_state`.|`Zabbix agent`|mariadb.galera.value[wsrep_local_state]<p>Update: 30s</p>|
|Galera: local state comment|Collects `wsrep_local_state_comment`.|`Zabbix agent`|mariadb.galera.value[wsrep_local_state_comment]<p>Update: 30s</p>|
|Galera: flow control paused|Collects `wsrep_flow_control_paused`.|`Zabbix agent`|mariadb.galera.value[wsrep_flow_control_paused]<p>Update: 30s</p>|
|Galera: local receive queue|Collects `wsrep_local_recv_queue`.|`Zabbix agent`|mariadb.galera.value[wsrep_local_recv_queue]<p>Update: 30s</p>|
|HAProxy: process running|Checks the local HAProxy process.|`Zabbix agent`|service.process.running[haproxy]<p>Update: 30s</p>|
|HAProxy: MySQL frontend port 3307 listening|Checks whether the local MySQL frontend port is listening.|`Zabbix agent`|haproxy.mysql_front.listen<p>Update: 30s</p>|
|HAProxy local: Galera backends UP count|Counts Galera backends in `UP` state through the HAProxy stats socket.|`Zabbix agent`|haproxy.backends_up_count<p>Update: 30s</p>|
|Keepalived: process running|Checks the local Keepalived process.|`Zabbix agent`|service.process.running[keepalived]<p>Update: 30s</p>|
|Keepalived: VIP {$KEEPALIVED.VIP} present on this node|Checks whether the configured VIP is present on the local node.|`Zabbix agent`|keepalived.vip.present[{$KEEPALIVED.VIP}]<p>Update: 10s</p>|

## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|MariaDB is not responding to mysqladmin ping|Local MariaDB does not respond to `mysqladmin ping`.|<p>**Expression**: `last(/Template MariaDB Galera HAProxy Keepalived/mariadb.mysqladmin.ping)=0`</p>|HIGH|
|Galera node is not in Primary component|The local node is outside the Galera Primary component.|<p>**Expression**: `last(/Template MariaDB Galera HAProxy Keepalived/mariadb.galera.primary)=0`</p>|DISASTER|
|Galera node is not ready|`wsrep_ready` is not `ON`.|<p>**Expression**: `last(/Template MariaDB Galera HAProxy Keepalived/mariadb.galera.ready)=0`</p>|HIGH|
|Galera node is not connected|`wsrep_connected` is not `ON`.|<p>**Expression**: `last(/Template MariaDB Galera HAProxy Keepalived/mariadb.galera.connected)=0`</p>|HIGH|
|Galera node is not Synced|The local Galera state is not `Synced`.|<p>**Expression**: `last(/Template MariaDB Galera HAProxy Keepalived/mariadb.galera.synced)=0`</p>|HIGH|
|Galera cluster size is not {$GALERA.EXPECTED_SIZE}|Current cluster size differs from the expected size macro.|<p>**Expression**: `last(/Template MariaDB Galera HAProxy Keepalived/mariadb.galera.value[wsrep_cluster_size])<>{$GALERA.EXPECTED_SIZE}`</p>|HIGH|
|Galera flow control is high|Average flow control paused value is above the configured threshold.|<p>**Expression**: `avg(/Template MariaDB Galera HAProxy Keepalived/mariadb.galera.value[wsrep_flow_control_paused],5m)>{$GALERA.FLOW_CONTROL.MAX}`</p>|WARNING|
|Galera receive queue is high|Average receive queue value is above the configured threshold.|<p>**Expression**: `avg(/Template MariaDB Galera HAProxy Keepalived/mariadb.galera.value[wsrep_local_recv_queue],5m)>{$GALERA.RECV_QUEUE.MAX}`</p>|WARNING|
|HAProxy process is not running|The local HAProxy process is not running.|<p>**Expression**: `last(/Template MariaDB Galera HAProxy Keepalived/service.process.running[haproxy])=0`</p>|HIGH|
|HAProxy MySQL frontend port 3307 is not listening|The local HAProxy MySQL frontend port is not listening.|<p>**Expression**: `last(/Template MariaDB Galera HAProxy Keepalived/haproxy.mysql_front.listen)=0`</p>|HIGH|
|Too few Galera backends are UP in HAProxy|The number of available Galera backends is below the configured minimum.|<p>**Expression**: `last(/Template MariaDB Galera HAProxy Keepalived/haproxy.backends_up_count)<{$HAPROXY.MIN_BACKENDS_UP}`</p>|HIGH|
|Keepalived process is not running|The local Keepalived process is not running.|<p>**Expression**: `last(/Template MariaDB Galera HAProxy Keepalived/service.process.running[keepalived])=0`</p>|HIGH|
