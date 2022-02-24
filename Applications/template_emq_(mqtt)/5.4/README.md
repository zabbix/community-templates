# App EMQTT  Service

## Overview

See <https://github.com/viniciusbo/zabbix-emqtt> for instructions.



## Author

Vinícius Borriello

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|MQTT Packets PUBREL Missed|<p>-</p>|`Zabbix trapper`|emqtt[packets/puback/missed]<p>Update: 0</p>|
|MQTT Subscriptions Count|<p>-</p>|`Zabbix trapper`|emqtt[subscriptions/count]<p>Update: 0</p>|
|MQTT Clients Count|<p>-</p>|`Zabbix trapper`|emqtt[clients/count]<p>Update: 0</p>|
|MQTT Packets CONNACK|<p>-</p>|`Zabbix trapper`|emqtt[packets/connack]<p>Update: 0</p>|
|MQTT Bytes Received|<p>-</p>|`Zabbix trapper`|emqtt[bytes/received]<p>Update: 0</p>|
|MQTT Routes Count|<p>-</p>|`Zabbix trapper`|emqtt[routes/count]<p>Update: 0</p>|
|MQTT Messages QoS 1 Sent|<p>-</p>|`Zabbix trapper`|emqtt[messages/qos1/sent]<p>Update: 0</p>|
|MQTT Packets PUBCOMP Sent|<p>-</p>|`Zabbix trapper`|emqtt[packets/pubcomp/sent]<p>Update: 0</p>|
|MQTT Packets Publish Received|<p>-</p>|`Zabbix trapper`|emqtt[packets/publish/received]<p>Update: 0</p>|
|MQTT Packets PUBCOMP Received|<p>-</p>|`Zabbix trapper`|emqtt[packets/pubcomp/received]<p>Update: 0</p>|
|MQTT Messages QoS 2 Sent|<p>-</p>|`Zabbix trapper`|emqtt[messages/qos2/sent]<p>Update: 0</p>|
|MQTT Sessions Max|<p>-</p>|`Zabbix trapper`|emqtt[sessions/max]<p>Update: 0</p>|
|MQTT Topics Max|<p>-</p>|`Zabbix trapper`|emqtt[topics/max]<p>Update: 0</p>|
|MQTT Messages QoS 2 Received|<p>-</p>|`Zabbix trapper`|emqtt[messages/qos2/received]<p>Update: 0</p>|
|MQTT Routes Max|<p>-</p>|`Zabbix trapper`|emqtt[routes/max]<p>Update: 0</p>|
|MQTT Messages Received|<p>-</p>|`Zabbix trapper`|emqtt[messages/received]<p>Update: 0</p>|
|MQTT Packets PUBREC Received|<p>-</p>|`Zabbix trapper`|emqtt[packets/pubrec/received]<p>Update: 0</p>|
|MQTT Messages Dropped|<p>-</p>|`Zabbix trapper`|emqtt[messages/dropped]<p>Update: 0</p>|
|MQTT Messages Retained|<p>-</p>|`Zabbix trapper`|emqtt[messages/retained]<p>Update: 0</p>|
|MQTT Packets PUBREL Sent|<p>-</p>|`Zabbix trapper`|emqtt[packets/pubrel/sent]<p>Update: 0</p>|
|MQTT Packets UNSUBACK|<p>-</p>|`Zabbix trapper`|emqtt[packets/unsuback]<p>Update: 0</p>|
|MQTT Subscribers Max|<p>-</p>|`Zabbix trapper`|emqtt[subscribers/max]<p>Update: 0</p>|
|MQTT Packets PINGRESP|<p>-</p>|`Zabbix trapper`|emqtt[packets/pingresp]<p>Update: 0</p>|
|MQTT Messages QoS 1 Received|<p>-</p>|`Zabbix trapper`|emqtt[messages/qos1/received]<p>Update: 0</p>|
|MQTT Packets PUBACK Received|<p>-</p>|`Zabbix trapper`|emqtt[packets/puback/received]<p>Update: 0</p>|
|MQTT Packets PUBREL Received|<p>-</p>|`Zabbix trapper`|emqtt[packets/pubrel/received]<p>Update: 0</p>|
|MQTT Packets Connect|<p>-</p>|`Zabbix trapper`|emqtt[packets/connect]<p>Update: 0</p>|
|MQTT PUBREC Missed|<p>-</p>|`Zabbix trapper`|emqtt[packets/pubrec/missed]<p>Update: 0</p>|
|MQTT Retained Count|<p>-</p>|`Zabbix trapper`|emqtt[retained/count]<p>Update: 0</p>|
|EMQTT External Check|<p>-</p>|`External check`|emqtt.sh["{HOST.CONN}", "{$EMQTT_API_USER}", "{$EMQTT_API_PASS}", "{$EMQTT_HOST}"]<p>Update: 30</p>|
|MQTT Topics Count|<p>-</p>|`Zabbix trapper`|mqtt[topics/count]<p>Update: 0</p>|
|MQTT Bytes Sent|<p>-</p>|`Zabbix trapper`|emqtt[bytes/sent]<p>Update: 0</p>|
|MQTT Packets Disconnect|<p>-</p>|`Zabbix trapper`|emqtt[packets/disconnect]<p>Update: 0</p>|
|MQTT Packets PUBACK Sent|<p>-</p>|`Zabbix trapper`|emqtt[packets/puback/sent]<p>Update: 0</p>|
|MQTT Packets Received|<p>-</p>|`Zabbix trapper`|emqtt[packets/received]<p>Update: 0</p>|
|MQTT Subscribers Count|<p>-</p>|`Zabbix trapper`|emqtt[subscribers/count]<p>Update: 0</p>|
|MQTT Packets Subscribe|<p>-</p>|`Zabbix trapper`|emqtt[packets/subscribe]<p>Update: 0</p>|
|MQTT Packets PUBCOMP Missed|<p>-</p>|`Zabbix trapper`|emqtt[packets/pubcomp/missed]<p>Update: 0</p>|
|MQTT Packets PUBREC Sent|<p>-</p>|`Zabbix trapper`|emqtt[packets/pubrec/sent]<p>Update: 0</p>|
|MQTT Packets Publish Sent|<p>-</p>|`Zabbix trapper`|emqtt[packets/publish/sent]<p>Update: 0</p>|
|MQTT Messages QoS 0 Sent|<p>-</p>|`Zabbix trapper`|emqtt[messages/qos0/sent]<p>Update: 0</p>|
|MQTT Subscriptions Max|<p>-</p>|`Zabbix trapper`|emqtt[subscriptions/max]<p>Update: 0</p>|
|MQTT Packets PINGREC|<p>-</p>|`Zabbix trapper`|emqtt[packets/pingreq]<p>Update: 0</p>|
|MQTT Messages QoS 2 Dropped|<p>-</p>|`Zabbix trapper`|emqtt[messages/qos2/dropped]<p>Update: 0</p>|
|MQTT Messages QoS 0 Received|<p>-</p>|`Zabbix trapper`|emqtt[messages/qos0/received]<p>Update: 0</p>|
|MQTT Retained Max|<p>-</p>|`Zabbix trapper`|emqtt[retained/max]<p>Update: 0</p>|
|MQTT Sessions Count|<p>-</p>|`Zabbix trapper`|emqtt[sessions/count]<p>Update: 0</p>|
|MQTT Packets Unsubscribe|<p>-</p>|`Zabbix trapper`|emqtt[packets/unsubscribe]<p>Update: 0</p>|
|MQTT Clients Max|<p>-</p>|`Zabbix trapper`|emqtt[clients/max]<p>Update: 0</p>|
|MQTT Packets SUBACK|<p>-</p>|`Zabbix trapper`|emqtt[packets/suback]<p>Update: 0</p>|
|MQTT Messages Sent|<p>-</p>|`Zabbix trapper`|emqtt[messages/sent]<p>Update: 0</p>|
|MQTT Packets Sent|<p>-</p>|`Zabbix trapper`|emqtt[packets/sent]<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

