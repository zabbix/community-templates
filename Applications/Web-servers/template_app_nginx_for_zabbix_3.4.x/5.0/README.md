# App Nginx by Alex Gluck

## Overview

System requirements
-------------------


[Nginx](http://nginx.org/ "Nginx"), with configured `http\_stub\_status\_module`


Features
--------


##### HTTP/HTTPS support


##### Connection Statistics:


* Active
* Reading
* Waiting
* Writing


##### Request Statistics:


* Accepted
* Handled
* Total


##### Graph and screen:


* 'Requests Statistics' graph
* 'Connection Status' graph
* Screen combining both graph


##### Macros for customization:


* {$NGINX\_HOST}
* {$NGINX\_STATS\_URI}
* {$NGINX\_PORT}
* {$NGINX\_REQ\_NUM}
* {$NGINX\_CON\_NUM}


Installation
------------


### Nginx Configuration


 


Add the following example to your default vhost configuration file:



```
location /nginx\_status {  
    stub\_status on;  
    access\_log off;  
    allow 127.0.0.1;  
    allow ::1;  
    deny all;  
}
```


```
 
```

### Zabbix Configuration


 


1. Import XML template file (`zbx\_template\_nginx.xml`) into Zabbix via Web GUI (Configuration -> Templates -> Import).
2. Assign the imported template to a host and enjoy!


## Author

Alex Gluck

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$NGINX_CON_NUM}|<p>-</p>|`2500`|Text macro|
|{$NGINX_HOST}|<p>-</p>|`localhost`|Text macro|
|{$NGINX_PORT}|<p>-</p>|`80`|Text macro|
|{$NGINX_REQ_NUM}|<p>-</p>|`600`|Text macro|
|{$NGINX_STATS_URI}|<p>-</p>|`nginx-stats`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Nginx: connections reading|<p>-</p>|`Dependent item`|nginx.reading<p>Update: 0</p>|
|Get Nginx stat page|<p>-</p>|`Zabbix agent`|web.page.get[{$NGINX_HOST},{$NGINX_STATS_URI},{$NGINX_PORT}]<p>Update: 60s</p>|
|Nginx: connections accepted per sec|<p>-</p>|`Dependent item`|nginx.accepts<p>Update: 0</p>|
|Nginx: connections writing|<p>-</p>|`Dependent item`|nginx.writing<p>Update: 0</p>|
|Nginx: connections waiting|<p>-</p>|`Dependent item`|nginx.waiting<p>Update: 0</p>|
|Nginx: connections handled per sec|<p>-</p>|`Dependent item`|nginx.handled<p>Update: 0</p>|
|Nginx: Number of processes $1|<p>-</p>|`Zabbix agent`|proc.num[nginx]<p>Update: 60s</p>|
|Nginx: connects active|<p>-</p>|`Dependent item`|nginx.active.connect<p>Update: 0</p>|
|Nginx: requests per sec|<p>-</p>|`Dependent item`|nginx.requests<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

