# App Nginx

## Overview

English description - <https://github.com/tonymadbrain/nginx_stat_getter/blob/master/README.md>


Cкрипт для получения статистики из Nginx, который можно использовать в Zabbix. Реализация на Go вот этого скрипта - https://github.com/vicendominguez/nginx-zabbix-template.


Настройка Nginx
---------------


Чтобы включить статистику в Nginx, нужно создать vhost, следующего содержания:



```
server {  
  listen 4040; # нестандартный порт для мониторинга статистики  
  server\_name \_; # нам неважно какой server name  
  keepalive\_timeout 0;  
  allow 192.168.0.40; # разрешаем запросы только для ip адреса нашего сервера мониторинга  
  deny all; # все остальные идут лесом  
  location =/nginx\_status/ {  
    stub\_status on; # собственно включение статистики  
  }  
  access\_log off; # не пишем логи  
}
```

И сделать reload/restart сервера.


Настройка Zabbix
----------------


Нужно скомпилировать бинарник под ту платформу, на которой запущен Zabbix сервер, для этого нужно использовать команду:



```
env GOOS={OS} GOARCH={ARCH} go build -v github.com/username/nginx\_stat\_getter

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


Закинуть бинарник на сервер Zabbix в каталог /usr/lib/zabbix/externalscripts, сделать его исполняемым:



```
chmod +x nginx\_stat\_getter
```

, сделать владельцем файла Zabbix:



```
chown zabbix:zabbix nginx\_stat\_getter 
```

Затем нужно импортировать шаблон *zbx\_nginx\_template.xml* в Zabbix фронтенде и прикрепить его к нужному серверу. Ждать данных.



## Author

Antony Ryabov

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Nginx Waiting state count|<p>-</p>|`External check`|nginx_stat_getter["-h","{HOST.CONN}","-p","4040","-s","waiting"]<p>Update: 60</p>|
|Nginx Writting state count|<p>-</p>|`External check`|nginx_stat_getter["-h","{HOST.CONN}","-p","4040","-s","writing"]<p>Update: 60</p>|
|Nginx Active Connections|<p>-</p>|`External check`|nginx_stat_getter["-h","{HOST.CONN}","-p","4040","-s","active"]<p>Update: 60</p>|
|Nginx Reading state count|<p>-</p>|`External check`|nginx_stat_getter["-h","{HOST.CONN}","-p","4040","-s","reading"]<p>Update: 60</p>|
|Nginx memory allocated|<p>-</p>|`Zabbix agent`|proc.mem[nginx,nginx]<p>Update: 60</p>|
|Nginx Accepted per second|<p>-</p>|`External check`|nginx_stat_getter["-h","{HOST.CONN}","-p","4040","-s","accepted"]<p>Update: 60</p>|
|Nginx Handled per second|<p>-</p>|`External check`|nginx_stat_getter["-h","{HOST.CONN}","-p","4040","-s","handled"]<p>Update: 60</p>|
|Nginx process count|<p>-</p>|`Zabbix agent`|proc.num[nginx]<p>Update: 60</p>|
|Nginx Requests per second|<p>-</p>|`External check`|nginx_stat_getter["-h","{HOST.CONN}","-p","4040","-s","requests"]<p>Update: 60</p>|


## Triggers

There are no triggers in this template.

