# Net VOLT Full Power SNMPv2

## Overview

Apresentando o template para o dispositivo VOLT Full Power 380 1U Gerenciável


Para utilizar o template em seu Zabbix, siga os passos abaixo:


1. Instale o MIB da Volt em seu servidor Zabbix, ele pode ser obtido acessando a interface web do dispositivo. Se preferir, você pode baixa-lo deste link também:   
<https://www.imfnetwork.com.br/downloads/VOLT-MIB.mib>


2. Após realizar o Download, adicione o arquivo MIB no diretório destinado a ele. Se sua instalação for no CentOS 7.x, o diretório padrão fica em " /usr/share/snmp/mibs ".


3. Reinicie o daemon do SNMP, através do comando " systemctl restart snmpd ".


3. Adicione o mapeamento de valor, você pode obté-lo através deste link:  
https://www.imfnetwork.com.br/downloads/TemplateNetVOLTFullPower\_ValueMapping.xml


4. Enfim, importe o Template.


O Template Possui:


- Tempo de Uptime;


- Corrente Consumida (Amperes) ;


- Temperatura;


- Tensão da Bateria (Volts);


- Tensão de Saída (Volts);


- Modo de operação (rede/bateria);


- Status de saída da fonte (alimentação dos equipamentos);


Testes do template realizados na versão 3.4 e 4.0.


 


BUGS Conhecidos


* A VOLT criou sua MIB com os campos em sua priori INTEGER (valores inteiros), quando o ideial seria criar como valores Flutuantes (Float/Double). Isso faz com que os valores de Temperatura, Amperagem e Voltagem não apresentem os números fracionados.


 


 


 



## Author

Rafael Barboza

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Versao do Hardware|<p>-</p>|`SNMP agent`|version<p>Update: 60s</p>|
|Tempo de Uptime|<p>-</p>|`SNMP agent`|sysUpTimeINstance<p>Update: 30s</p>|
|Status de controle da Saída da Fonte|<p>-</p>|`SNMP agent`|statusSaida<p>Update: 60s</p>|
|Corrente consumida (A)|<p>-</p>|`SNMP agent`|corrente<p>Update: 60s</p>|
|Fabricante|<p>-</p>|`SNMP agent`|sysName<p>Update: 30s</p>|
|Tensão da Bateria (V)|<p>-</p>|`SNMP agent`|voltagemBateria<p>Update: 60s</p>|
|Tensão de Saída (V)|<p>-</p>|`SNMP agent`|voltagemSaida<p>Update: 30s</p>|
|Temperatura|<p>-</p>|`SNMP agent`|temperatura<p>Update: 60s</p>|
|Modelo|<p>-</p>|`SNMP agent`|name<p>Update: 60s</p>|
|Data de Criação|<p>-</p>|`SNMP agent`|date<p>Update: 60s</p>|
|Modo de Operação|<p>-</p>|`SNMP agent`|modoOperacao<p>Update: 60s</p>|


## Triggers

There are no triggers in this template.

