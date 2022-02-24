# CustomApp Plesk

## Author

samsteve169

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Number of Apache process|<p>-</p>|`Zabbix agent (active)`|proc.num[httpd,apache]<p>Update: 1m</p>|
|Number of MySQL process|<p>-</p>|`Zabbix agent (active)`|proc.num[mysqld,mysql]<p>Update: 1m</p>|
|Plesk login on 8443 is available|<p>-</p>|`HTTP agent`|plesk_login_8443_key<p>Update: 1m</p>|
|SMTPS service is running (tcp check)|<p>-</p>|`Simple check`|net.tcp.service[tcp,,465]<p>Update: 1m</p>|
|Number of PHP-FPM 8.0 process|<p>-</p>|`Zabbix agent (active)`|proc.num[php-fpm,root,,8.0]<p>Update: 1m</p>|
|Plesk default page on 443 is available|<p>-</p>|`HTTP agent`|plesk_default_443_key<p>Update: 1m</p>|
|Number of PHP-FPM 7.4 process|<p>-</p>|`Zabbix agent (active)`|proc.num[php-fpm,root,,7.4]<p>Update: 1m</p>|
|Number of PHP-FPM 5.4 process|<p>-</p>|`Zabbix agent (active)`|proc.num[php-fpm,root,,5.4]<p>Update: 1m</p>|
|Number of PHP-FPM 5.6 process|<p>-</p>|`Zabbix agent (active)`|proc.num[php-fpm,root,,5.6]<p>Update: 1m</p>|
|SMTP service is running (tcp check)|<p>-</p>|`Simple check`|net.tcp.service[tcp,,25]<p>Update: 1m</p>|
|POP3S service is running (tcp check)|<p>-</p>|`Simple check`|net.tcp.service[tcp,,995]<p>Update: 1m</p>|
|Number of PHP-FPM 7.2 process|<p>-</p>|`Zabbix agent (active)`|proc.num[php-fpm,root,,7.2]<p>Update: 1m</p>|
|IMAP service is running (tcp check)|<p>-</p>|`Simple check`|net.tcp.service[tcp,,143]<p>Update: 1m</p>|
|POP3 service is running (tcp check)|<p>-</p>|`Simple check`|net.tcp.service[tcp,,110]<p>Update: 1m</p>|
|FTP service is running (tcp check)|<p>-</p>|`Simple check`|net.tcp.service[tcp,,21]<p>Update: 1m</p>|
|Number of SwCollectd process|<p>-</p>|`Zabbix agent (active)`|proc.num[sw-collectd]<p>Update: 1m</p>|
|Number of PHP-FPM 5.5 process|<p>-</p>|`Zabbix agent (active)`|proc.num[php-fpm,root,,5.5]<p>Update: 1m</p>|
|Plesk default page on 7080 is available|<p>-</p>|`HTTP agent`|plesk_default_7080_key<p>Update: 1m</p>|
|DNS service is running (tcp check)|<p>-</p>|`Simple check`|net.tcp.service[tcp,,53]<p>Update: 1m</p>|
|Number of Dovecot process|<p>-</p>|`Zabbix agent (active)`|proc.num[dovecot]<p>Update: 1m</p>|
|Number of Fail2ban process|<p>-</p>|`Zabbix agent (active)`|proc.num[fail2ban-server]<p>Update: 1m</p>|
|Plesk login on 7081 is available|<p>-</p>|`HTTP agent`|plesk_login_7081_key<p>Update: 1m</p>|
|HTTPS 7081 service is running (tcp check)|<p>-</p>|`Simple check`|net.tcp.service[tcp,,7081]<p>Update: 1m</p>|
|Number of PHP-FPM 7.0 process|<p>-</p>|`Zabbix agent (active)`|proc.num[php-fpm,root,,7.0]<p>Update: 1m</p>|
|HTTPS service is running (tcp check)|<p>-</p>|`Simple check`|net.tcp.service[tcp,,443]<p>Update: 1m</p>|
|Plesk service is running (tcp check)|<p>-</p>|`Simple check`|net.tcp.service[tcp,,8443]<p>Update: 1m</p>|
|Number of Spamd process|<p>-</p>|`Zabbix agent (active)`|proc.num[spamd child,popuser]<p>Update: 1m</p>|
|MySQL service is running (tcp check)|<p>-</p>|`Simple check`|net.tcp.service[tcp,,3306]<p>Update: 1m</p>|
|Number of Nginx process|<p>-</p>|`Zabbix agent (active)`|proc.num[nginx,nginx]<p>Update: 1m</p>|
|HTTP service is running (tcp check)|<p>-</p>|`Simple check`|net.tcp.service[tcp,,80]<p>Update: 1m</p>|
|Number of PHP-FPM 7.3 process|<p>-</p>|`Zabbix agent (active)`|proc.num[php-fpm,root,,7.3]<p>Update: 1m</p>|
|IMAPS service is running (tcp check)|<p>-</p>|`Simple check`|net.tcp.service[tcp,,993]<p>Update: 1m</p>|
|Number of Postfix process|<p>-</p>|`Zabbix agent (active)`|proc.num[master]<p>Update: 1m</p>|
|HTTP 7080 service is running (tcp check)|<p>-</p>|`Simple check`|net.tcp.service[tcp,,7080]<p>Update: 1m</p>|
|Number of SwCpServer process|<p>-</p>|`Zabbix agent (active)`|proc.num[sw-cp-serverd]<p>Update: 1m</p>|
|Number of PleskWebSocket process|<p>-</p>|`Zabbix agent (active)`|proc.num[sw-engine,psaadm]<p>Update: 1m</p>|
|Plesk default page on 80 is available|<p>-</p>|`HTTP agent`|plesk_default_80_key<p>Update: 1m</p>|
|Number of SwEngineFpm process|<p>-</p>|`Zabbix agent (active)`|proc.num[sw-engine-fpm,psaadm]<p>Update: 1m</p>|
|Number of Bind process|<p>-</p>|`Zabbix agent (active)`|proc.num[named,named]<p>Update: 1m</p>|
|Number of Xinetd process|<p>-</p>|`Zabbix agent (active)`|proc.num[xinetd]<p>Update: 1m</p>|
|Number of PHP-FPM 7.1 process|<p>-</p>|`Zabbix agent (active)`|proc.num[php-fpm,root,,7.1]<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

