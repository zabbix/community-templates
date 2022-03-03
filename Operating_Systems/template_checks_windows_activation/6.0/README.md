# Ativacao do Windows

## Overview

Este template verifica a ativação do windows, e caso esteja com algum problema irá emitir o alerta.


Testado somente no 5.0


Para funcionar é necessário adicionar ao zabbix agent do servidor monitorado as informações:


UnsafeUserParameters=1


AllowKey=system.run[c:\Windows\System32\cscript.exe /nologo c:\Windows\System32\slmgr.vbs /xpr] 



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
|Ativacao do Windows|<p>-</p>|`Zabbix agent`|system.run[c:\Windows\System32\cscript.exe /nologo c:\Windows\System32\slmgr.vbs /xpr]<p>Update: 1d</p>|


## Triggers

There are no triggers in this template.

