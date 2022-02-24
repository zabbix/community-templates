# Zimbra

## Overview

É necessário habilitar o Allow root e o comando externo.


Coleta status dos serviços, fila e spam.


Adicionar ao Userparameter 


 UserParameter=zimbra.mailq,/opt/zimbra/common/sbin/mailq | grep -v "Mail queue is empty" | grep -c '^[0-9A-Z]'


UserParameter=zimbra.service.status,su - zimbra -c"zmcontrol status" > /tmp/zimbrastatus.txt


UserParameter=zimbra.amavis.status,awk '/amavis/{print $2}' /tmp/zimbrastatus.txt


UserParameter=zimbra.antispam.status,awk '/antispam/{print $2}' /tmp/zimbrastatus.txt


UserParameter=zimbra.antivirus.status,awk '/antivirus/{print $2}' /tmp/zimbrastatus.txt


UserParameter=zimbra.cbpolicyd.status,awk '/cbpolicyd/{print $2}' /tmp/zimbrastatus.txt


UserParameter=zimbra.mailbox.status,awk '/mailbox/{print $2}' /tmp/zimbrastatus.txt


UserParameter=zimbra.mta.status,awk '/mta/{print $2}' /tmp/zimbrastatus.txt


UserParameter=zimbra.zmconfigd.status,awk '/zmconfigd/{print $2}' /tmp/zimbrastatus.txt


UserParameter=zimbra.webmail.status,awk '/service webapp/{print $3}' /tmp/zimbrastatus.txt


UserParameter=zimbra.webadm.status,awk '/zimbraAdmin/{print $3}' /tmp/zimbrastatus.txt


UserParameter=zimbra.proxy.status,awk '/proxy/{print $2}' /tmp/zimbrastatus.txt


UserParameter=zimbra.mailq.active,/opt/zimbra/libexec/zmqstat | grep active | cut -d= -f2


UserParameter=zimbra.mailq.corrupt,/opt/zimbra/libexec/zmqstat | grep corrupt | cut -d= -f2


UserParameter=zimbra.mailq.hold,/opt/zimbra/libexec/zmqstat | grep hold | cut -d= -f2


UserParameter=zimbra.mailq.deferred,/opt/zimbra/libexec/zmqstat | grep deferred | cut -d= -f2


UserParameter=zimbra.mailq.incoming,/opt/zimbra/libexec/zmqstat | grep incoming | cut -d= -f2



## Author

Carlos Eduardo

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Status Amavis Zimbra|<p>-</p>|`Zabbix agent`|zimbra.amavis.status<p>Update: 3m</p>|
|Status Mailbox Zimbra|<p>-</p>|`Zabbix agent`|zimbra.mailbox.status<p>Update: 3m</p>|
|Bloqueio Lista b.barracudacentral.org|<p>Retorna quantidade de e-mails diários bloqueados pela lista b.barracudacentral.org.</p>|`Zabbix agent`|system.run[awk '/blocked using b.barracudacentral.org/{print $5}' /tmp/report.txt]<p>Update: 0;h23m50</p>|
|E-mails rejeitados pelo comando Helo - Host não encontrado|<p>Retorna quantidade de e-mails diários bloqueados por erro por comando Helo, pelo motivo de host não encontrado.</p>|`Zabbix agent`|system.run[awk '/Helo command rejected: Host not found/{print $8}' /tmp/report.txt]<p>Update: 0;h23m50</p>|
|Zimbra Status|<p>-</p>|`Zabbix agent`|zimbra.service.status<p>Update: 3m</p>|
|Status MTA Zimbra|<p>-</p>|`Zabbix agent`|zimbra.mta.status<p>Update: 3m</p>|
|Mail Report|<p>Gera o relatório para análise do servidor de e-mails.</p>|`Zabbix agent`|system.run[/opt/zimbra/libexec/zmdailyreport > /tmp/report.txt]<p>Update: 0;h23m40</p>|
|Bloqueio Lista dbl.spamhaus.org|<p>Retorna quantidade de e-mails diários bloqueados pela lista dbl.spamhaus.org</p>|`Zabbix agent`|system.run[awk '/blocked using dbl.spamhaus.org/{print $5}' /tmp/report.txt]<p>Update: 0;h23m50</p>|
|Status Proxy Zimbra|<p>-</p>|`Zabbix agent`|zimbra.proxy.status<p>Update: 3m</p>|
|Bloqueio de e-mail por inconsistência no reverso|<p>Retorna quantidade de e-mails diários bloqueados por erro no reverso</p>|`Zabbix agent`|system.run[awk '/reverse hostname/{print $7}' /tmp/report.txt]<p>Update: 0;h23m50</p>|
|Status Serviço Webmail Zimbra|<p>-</p>|`Zabbix agent`|zimbra.webmail.status<p>Update: 3m</p>|
|Status Antivírus Zimbra|<p>-</p>|`Zabbix agent`|zimbra.antivirus.status<p>Update: 3m</p>|
|Bloqueio Lista bl.spamcop.net|<p>Retorna quantidade de e-mails diários bloqueados pela lista bl.spamcop.net.</p>|`Zabbix agent`|system.run[awk '/blocked using bl.spamcop.net/{print $5}' /tmp/report.txt]<p>Update: 0;h23m50</p>|
|E-mails rejeitados pelo comando Helo - Host não qualificado|<p>Retorna quantidade de e-mails diários bloqueados por erro por comando Helo, pelo motivo de need fully-qualified hostname.</p>|`Zabbix agent`|system.run[awk '/Helo command rejected: need fully-qualified hostname/{print $8}' /tmp/report.txt]<p>Update: 0;h23m50</p>|
|Status Cbpolicyd Zimbra|<p>-</p>|`Zabbix agent`|zimbra.cbpolicyd.status<p>Update: 3m</p>|
|Tamanho em Mega, dos e-mails enviados|<p>-</p>|`Zabbix agent`|system.run[awk '/bytes delivered/{print $1}' /tmp/report.txt]<p>Update: 0;h23m50</p>|
|Fila de e-mail ativa|<p>Quando as mensagens estão na fila, prontas para serem enviadas.</p>|`Zabbix agent`|zimbra.mailq.active<p>Update: 1m</p>|
|Fila de e-mails não processados|<p>Quando as mensagens não podem mais ser processadas pelo servidor ficaram nesta fila, ate que o administrador altere-as.</p>|`Zabbix agent`|zimbra.mailq.hold<p>Update: 1m</p>|
|Status AntiSpam Zimbra|<p>-</p>|`Zabbix agent`|zimbra.antispam.status<p>Update: 3m</p>|
|Fila de e-mails não entregues|<p>Quando as mensagens não podem ser entregues, são colocadas nessa fila para que seja feita uma nova tentativa de reenvio. A quantidade de tentativas de reenvio vai depender da configuração do servidor</p>|`Zabbix agent`|zimbra.mailq.deferred<p>Update: 1m</p>|
|Status Admin Console Zimbra|<p>-</p>|`Zabbix agent`|zimbra.webadm.status<p>Update: 3m</p>|
|Tamanho em Mega, dos e-mails recebidos|<p>-</p>|`Zabbix agent`|system.run[awk '/bytes received/{print $1}' /tmp/report.txt]<p>Update: 0;h23m50</p>|
|E-mails rejeitados|<p>Retorna quantidade de e-mails diários bloqueados por erro no reverso</p>|`Zabbix agent`|system.run[awk '/rejected/{print $1}' /tmp/report.txt]<p>Update: 0;h23m50</p>|
|Fila de e-mail geral|<p>-</p>|`Zabbix agent`|zimbra.mailq<p>Update: 30s</p>|
|Bloqueio Lista zen.spamhaus.org|<p>Retorna quantidade de e-mails diários bloqueados pela lista zen.spamhaus.org</p>|`Zabbix agent`|system.run[awk '/blocked using zen.spamhaus.org/{print $5}' /tmp/report.txt]<p>Update: 0;h23m50</p>|
|Fila de e-mails corrompido|<p>Quando a mensagem se encontra corrompida ou danificada.</p>|`Zabbix agent`|zimbra.mailq.corrupt<p>Update: 1m</p>|
|Bloqueio Lista psbl.surriel.com|<p>Retorna quantidade de e-mails diários bloqueados pela lista psbl.surriel.com.</p>|`Zabbix agent`|system.run[awk '/blocked using psbl.surriel.com/{print $5}' /tmp/report.txt]<p>Update: 0;h23m50</p>|
|Fila de e-mails entregues|<p>Quando o e-mail é entregue na caixa do usuário com sucesso.</p>|`Zabbix agent`|zimbra.mailq.incoming<p>Update: 1m</p>|
|Status Zmconfigd Zimbra|<p>-</p>|`Zabbix agent`|zimbra.zmconfigd.status<p>Update: 3m</p>|


## Triggers

There are no triggers in this template.

