# Kamailio

## Description

Kamailio (kamcli) template Version: 1.0.0 Author: Neimar L. Avila - neimar.avila@gmail.com

## Overview

Kamailio Stats via kamcli  
  



UserParameter=kamailio.rpc[*],/usr/local/bin/kamcli --config=/etc/zabbix/kamcli.ini $1 $2  
  
Example:  
  
Key: kamailio.rpc[stats,usrloc:registered\_users]  
Pre-Processing (JSONPath): $.['result'].['usrloc.registered\_users'] 



## Author

Neimar L. Avila

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Rcv Replies 1XX Update|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_1xx_update]<p>Update: 1m</p>|
|Rcv Replies 3XX Cancel|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_3xx_cancel]<p>Update: 1m</p>|
|Err Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:err_replies]<p>Update: 1m</p>|
|Rcv Requests CANCEL|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_requests_cancel]<p>Update: 1m</p>|
|5xx Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:5xx_replies]<p>Update: 1m</p>|
|Sent Err Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:sent_err_replies]<p>Update: 1m</p>|
|Location Expires|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,usrloc:location-expires]<p>Update: 1m</p>|
|Rcv Replies 2XX Cancel|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_2xx_cancel]<p>Update: 1m</p>|
|Rcv Replies 407|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_407]<p>Update: 1m</p>|
|Registered Users|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,usrloc:registered_users]<p>Update: 1m</p>|
|Rcv Replies 3XX Invite|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_3xx_invite]<p>Update: 1m</p>|
|Rcv Replies 6XX Prack|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_6xx_prack]<p>Update: 1m</p>|
|Unsupported Methods|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:unsupported_methods]<p>Update: 1m</p>|
|Max Used Size|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,shmem:max_used_size]<p>Update: 1m</p>|
|Rcv Replies 1XX Cancel|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_1xx_cancel]<p>Update: 1m</p>|
|Rcv Requests SUBSCRIBE|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_requests_subscribe]<p>Update: 1m</p>|
|Bad Msg Hdr|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:bad_msg_hdr]<p>Update: 1m</p>|
|Sendq Full|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tcp:sendq_full]<p>Update: 1m</p>|
|Rcv Replies 1XX Bye|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_1xx_bye]<p>Update: 1m</p>|
|Rcv Replies 5XX|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_5xx]<p>Update: 1m</p>|
|Rcv Replies 5XX Cancel|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_5xx_cancel]<p>Update: 1m</p>|
|Default Expires Range|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,registrar:default_expires_range]<p>Update: 1d</p>|
|Rcv Replies 5XX Bye|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_5xx_bye]<p>Update: 1m</p>|
|Rcv Replies 2XX Reg|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_2xx_reg]<p>Update: 1m</p>|
|Rcv Replies 3XX Refer|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_3xx_refer]<p>Update: 1m</p>|
|Real Used Size|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,shmem:real_used_size]<p>Update: 1m</p>|
|Rcv Replies 4XX Reg|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_4xx_reg]<p>Update: 1m</p>|
|2xx Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:2xx_replies]<p>Update: 1m</p>|
|Fwd Requests|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:fwd_requests]<p>Update: 1m</p>|
|Failed Dns Request|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,dns:failed_dns_request]<p>Update: 1m</p>|
|Rcv Replies 5XX Refer|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_5xx_refer]<p>Update: 1m</p>|
|Current Write Queue Size|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tcp:current_write_queue_size]<p>Update: 1m</p>|
|Rcv Replies 6XX Invite|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_6xx_invite]<p>Update: 1m</p>|
|Fwd Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:fwd_replies]<p>Update: 1m</p>|
|Connect Failed|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tcp:connect_failed]<p>Update: 1m</p>|
|Rcv Replies 4XX Refer|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_4xx_refer]<p>Update: 1m</p>|
|Rcv Replies 6XX Bye|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_6xx_bye]<p>Update: 1m</p>|
|Rcv Replies 1XX Message|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_1xx_message]<p>Update: 1m</p>|
|Rcv Replies 4XX|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_4xx]<p>Update: 1m</p>|
|Passive Open|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tcp:passive_open]<p>Update: 1m</p>|
|Rcv Requests UPDATE|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_requests_update]<p>Update: 1m</p>|
|Connect Timeout|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tcp:con_timeout]<p>Update: 1m</p>|
|Rcv Replies 1XX Invite|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_1xx_invite]<p>Update: 1m</p>|
|Rcv Replies 5XX Reg|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_5xx_reg]<p>Update: 1m</p>|
|4xx Transactions|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tmx:4xx_transactions]<p>Update: 1m</p>|
|Rcv Replies 486|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_486]<p>Update: 1m</p>|
|Blocked Ips|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,pike:blocked_ips]<p>Update: 1m</p>|
|Rcv Replies 5XX Message|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_5xx_message]<p>Update: 1m</p>|
|Inuse Transactions|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tmx:inuse_transactions]<p>Update: 1m</p>|
|Rcv Replies 6XX Reg|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_6xx_reg]<p>Update: 1m</p>|
|Rcv Requests ACK|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_requests_ack]<p>Update: 1m</p>|
|Connect Reset|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tcp:con_reset]<p>Update: 1m</p>|
|Rcv Replies 6XX Update|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_6xx_update]<p>Update: 1m</p>|
|500 Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:500_replies]<p>Update: 1m</p>|
|Drop Requests|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:drop_requests]<p>Update: 1m</p>|
|Rcv Replies 1XX Reg|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_1xx_reg]<p>Update: 1m</p>|
|Rcv Replies 6XX Refer|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_6xx_refer]<p>Update: 1m</p>|
|Location Contacts|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,usrloc:location-contacts]<p>Update: 1m</p>|
|Expires Range|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,registrar:expires_range]<p>Update: 1d</p>|
|Rcv Replies 4XX Bye|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_4xx_bye]<p>Update: 1m</p>|
|Drop Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:drop_replies]<p>Update: 1m</p>|
|301 Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:301_replies]<p>Update: 1m</p>|
|XXX Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:xxx_replies]<p>Update: 1m</p>|
|Rcv Replies 2XX Message|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_2xx_message]<p>Update: 1m</p>|
|Rcv Replies 5XX Invite|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_5xx_invite]<p>Update: 1m</p>|
|Sent Timeout|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tcp:send_timeout]<p>Update: 1m</p>|
|Local Reject|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tcp:local_reject]<p>Update: 1m</p>|
|Rcv Replies 2XX Refer|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_2xx_refer]<p>Update: 1m</p>|
|Rcv Replies 2XX Invite|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_2xx_invite]<p>Update: 1m</p>|
|483 Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:483_replies]<p>Update: 1m</p>|
|Max Contacts|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,registrar:max_contacts]<p>Update: 1d</p>|
|Used Size|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,shmem:used_size]<p>Update: 1m</p>|
|Rcv Requests INFO|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_requests_info]<p>Update: 1m</p>|
|Fragments|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,shmem:fragments]<p>Update: 1m</p>|
|Rcv Requests PUBLISH|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_requests_publish]<p>Update: 1m</p>|
|Rcv Requests NOTIFY|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_requests_notify]<p>Update: 1m</p>|
|Rcv Replies 3XX|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_3xx]<p>Update: 1m</p>|
|Rcv Requests REGISTER|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_requests_register]<p>Update: 1m</p>|
|Rcv Replies 2XX Prack|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_2xx_prack]<p>Update: 1m</p>|
|Rcv Replies 4XX Update|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_4xx_update]<p>Update: 1m</p>|
|Max Expires|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,registrar:max_expires]<p>Update: 1d</p>|
|Slow Dns Request|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,dns:slow_dns_request]<p>Update: 1m</p>|
|Rcv Replies 1XX Refer|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_1xx_refer]<p>Update: 1m</p>|
|Active Transactions|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tmx:active_transactions]<p>Update: 1m</p>|
|3xx Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:3xx_replies]<p>Update: 1m</p>|
|5xx Transactions|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tmx:5xx_transactions]<p>Update: 1m</p>|
|Rpl Relayed|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tmx:rpl_relayed]<p>Update: 1m</p>|
|Accepted Regs|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,registrar:accepted_regs]<p>Update: 1m</p>|
|Rpl Sent|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tmx:rpl_sent]<p>Update: 1m</p>|
|Location Users|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,usrloc:location-users]<p>Update: 1m</p>|
|Default Expire|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,registrar:default_expire]<p>Update: 1d</p>|
|4xx Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:4xx_replies]<p>Update: 1m</p>|
|401 Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:401_replies]<p>Update: 1m</p>|
|Err Requests|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:err_requests]<p>Update: 1m</p>|
|404 Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:404_replies]<p>Update: 1m</p>|
|Rcv Replies 480|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_480]<p>Update: 1m</p>|
|Rcv Replies 5XX Prack|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_5xx_prack]<p>Update: 1m</p>|
|Rcv Replies 3XX Reg|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_3xx_reg]<p>Update: 1m</p>|
|Free Size|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,shmem:free_size]<p>Update: 1m</p>|
|1xx Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:1xx_replies]<p>Update: 1m</p>|
|Rcv Replies 1XX|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_1xx]<p>Update: 1m</p>|
|Rcv Requests PRACK|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_requests_prack]<p>Update: 1m</p>|
|6xx Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:6xx_replies]<p>Update: 1m</p>|
|Rcv Replies 3XX Message|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_3xx_message]<p>Update: 1m</p>|
|Rcv Requests BYE|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_requests_bye]<p>Update: 1m</p>|
|Rcv Replies 6XX|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_6xx]<p>Update: 1m</p>|
|Rcv Requests REFER|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_requests_refer]<p>Update: 1m</p>|
|Sent Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:sent_replies]<p>Update: 1m</p>|
|Rcv Requests MESSAGE|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_requests_message]<p>Update: 1m</p>|
|Rcv Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies]<p>Update: 1m</p>|
|Rejected Regs|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,registrar:rejected_regs]<p>Update: 1m</p>|
|Connect Sucess|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tcp:connect_success]<p>Update: 1m</p>|
|Rcv Replies 401|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_401]<p>Update: 1m</p>|
|UAC Transactions|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tmx:UAC_transactions]<p>Update: 1m</p>|
|2xx Transactions|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tmx:2xx_transactions]<p>Update: 1m</p>|
|Rcv Replies 3XX Bye|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_3xx_bye]<p>Update: 1m</p>|
|Rcv Replies 4XX Prack|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_4xx_prack]<p>Update: 1m</p>|
|Rcv Replies 6XX Cancel|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_6xx_cancel]<p>Update: 1m</p>|
|Total Size|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,shmem:total_size]<p>Update: 1m</p>|
|Rcv Replies 4XX Invite|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_4xx_invite]<p>Update: 1m</p>|
|3xx Transactions|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tmx:3xx_transactions]<p>Update: 1m</p>|
|Rcv Replies 2XX Update|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_2xx_update]<p>Update: 1m</p>|
|Rcv Replies 2XX|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_2xx]<p>Update: 1m</p>|
|Rcv Replies 1XX Prack|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_1xx_prack]<p>Update: 1m</p>|
|Rcv Replies 6XX Message|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_6xx_message]<p>Update: 1m</p>|
|Established|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tcp:established]<p>Update: 1m</p>|
|6xx Transactions|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tmx:6xx_transactions]<p>Update: 1m</p>|
|Bad URIs Rcvd|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:bad_URIs_rcvd]<p>Update: 1m</p>|
|UAS Transactions|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tmx:UAS_transactions]<p>Update: 1m</p>|
|Rcv Replies 5XX Update|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_5xx_update]<p>Update: 1m</p>|
|200 Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:200_replies]<p>Update: 1m</p>|
|407 Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:407_replies]<p>Update: 1m</p>|
|Rcv Replies 4XX Cancel|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_4xx_cancel]<p>Update: 1m</p>|
|Current Opened Connections|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tcp:current_opened_connections]<p>Update: 1m</p>|
|Rpl Absorbed|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tmx:rpl_absorbed]<p>Update: 1m</p>|
|Received ACKs|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:received_ACKs]<p>Update: 1m</p>|
|Rcv Replies 4XX Message|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_4xx_message]<p>Update: 1m</p>|
|Rcv Requests INVITE|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_requests_invite]<p>Update: 1m</p>|
|Rcv Replies 3XX Update|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_3xx_update]<p>Update: 1m</p>|
|Rcv Requests OPTIONS|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_requests_options]<p>Update: 1m</p>|
|Rcv Requests|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_requests]<p>Update: 1m</p>|
|Rpl Received|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tmx:rpl_received]<p>Update: 1m</p>|
|403 Replies|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,sl:403_replies]<p>Update: 1m</p>|
|Rcv Replies 404|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_404]<p>Update: 1m</p>|
|Rcv Replies 2XX Bye|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_2xx_bye]<p>Update: 1m</p>|
|Rcv Replies 18X|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_18x]<p>Update: 1m</p>|
|Rcv Replies 3XX Prack|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,core:rcv_replies_3xx_prack]<p>Update: 1m</p>|
|Rpl Generated|<p>-</p>|`Zabbix agent`|kamailio.rpc[stats,tmx:rpl_generated]<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

