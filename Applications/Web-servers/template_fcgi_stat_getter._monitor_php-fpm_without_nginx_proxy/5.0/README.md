# App PHP-FPM

## Overview

English description - <https://github.com/tonymadbrain/fcgi_stat_getter/blob/master/README.md>


Скрипт для получения статистики из PHP-FPM, который можно использовать в Zabbix. Реализация на Go вот этого скрипта - <http://doam.ru/fcgi_monitoring_with_zabbix/.>


go version go1.7.4 darwin/amd64


Настройка PHP-FPM
-----------------


В конфиге PHP-FPM пула нужно включить статус и пинг:



```
pm.status\_path = /status 
```


```
ping.path = /ping 
```

И сделать restart сервера.


Настройка Zabbix
----------------


Нужно скомпилировать бинарник под ту платформу, на которой запущен Zabbix сервер, для этого нужно использовать команду:



```
env GOOS={OS} GOARCH={ARCH} go build -v github.com/username/fcgi\_stat\_getter
```

{OS} - тип операционной системы, может быть:


* Mac os - darwin
* Windows - windows
* Linux - linux
* FreeBSD - freebsd


{ARCH} - архитектура, может быть:


* x86\_64 - amd64
* x86 - 386
* ARM - arm (linux only)


Example:



```
$ env GOOS=linux GOARCH=amd64 go build -v github.com/tonymadbrain/fcgi\_stat\_getter
```

Закинуть бинарник на сервер Zabbix в каталог /usr/lib/zabbix/externalscripts, сделать его исполняемым:



```
 chmod +x fcgi\_stat\_getter 
```

сделать владельцем файла Zabbix:



```
chown zabbix:zabbix fcgi\_stat\_getter 
```

Затем нужно импортировать шаблон *zbx\_fcgi\_template.xml* в Zabbix фронтенде и прикрепить его к нужному серверу. Ждать данных.



## Author

Antony Ryabov

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$AJAX_PORT}|<p>-</p>|`3001`|Text macro|
|{$API_PORT}|<p>-</p>|`3002`|Text macro|
|{$FERM_PORT}|<p>-</p>|`3004`|Text macro|
|{$IMHO_PORT}|<p>-</p>|`3000`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Php-fpm - max children reached|<p>-</p>|`External check`|fcgi_stat_getter["-h","{HOST.CONN}","-p","3000","-c","stat","-k","max children reached"]<p>Update: 60</p>|
|Php-fpm - latency|<p>-</p>|`External check`|fcgi_stat_getter["-h","{HOST.CONN}","-p","3000","-c","latency"]<p>Update: 60</p>|
|Php-fpm - connections per sec|<p>-</p>|`External check`|fcgi_stat_getter["-h","{HOST.CONN}","-p","3000","-c","stat","-k","accepted conn"]<p>Update: 60</p>|
|Php-fpm - length of listen queue|<p>-</p>|`External check`|fcgi_stat_getter["-h","{HOST.CONN}","-p","3000","-c","stat","-k","listen queue len"]<p>Update: 60</p>|
|Php-fpm - idle processes count|<p>-</p>|`External check`|fcgi_stat_getter["-h","{HOST.CONN}","-p","3000","-c","stat","-k","idle processes"]<p>Update: 60</p>|
|Php-fpm|<p>-</p>|`External check`|fcgi_stat_getter["-h","{HOST.CONN}","-p","3000","-c","ping"]<p>Update: 60</p>|
|Php-fpm - active processes count|<p>-</p>|`External check`|fcgi_stat_getter["-h","{HOST.CONN}","-p","3000","-c","stat","-k","active processes"]<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

