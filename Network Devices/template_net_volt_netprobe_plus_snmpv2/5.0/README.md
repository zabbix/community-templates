# Net VOLT NetProbe Plus SNMPv2

## Overview

Apresentando o template para o dispositivo NetProbe Plus  
  
Para utilizar o template em seu Zabbix, siga os passos abaixo:  
  
1. Instale o MIB da Volt em seu servidor Zabbix, ele pode ser obtido acessando a interface web do dispositivo. Se preferir, você pode baixa-lo deste link também:  
https://www.imfnetwork.com.br/downloads/netprobeplus.mib  
  
2. Após realizar o Download, adicione o arquivo MIB no diretório destinado a ele. Se sua instalação for no CentOS 7.x, o diretório padrão fica em " /usr/share/snmp/mibs ".  
  
3. Reinicie o daemon do SNMP, através do comando " systemctl restart snmpd ".  
  
3. Adicione o mapeamento de valor, você pode obté-lo através deste link:  
https://www.imfnetwork.com.br/downloads/TemplateNetVOLT\_NetProbePlus\_ValueMapping.xml  
  
4. Enfim, importe o Template.  
  
O Template Possui:  
  
- Tempo de Uptime;  
- Voltagem de Alimentação pela interface PoE;  
- Corrente de saida pela interface PoE (Amperes) ;  
- Temperatura;  
- Status do Controle da interface PoE (Ligado/Desligado);  
- Status do Controle de saída da fonte (Ligado/Desligado);


  
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
|Temperatura|<p>-</p>|`SNMP agent`|temperatura<p>Update: 60s</p>|
|Corrente de Saída PoE (Amperes)|<p>-</p>|`SNMP agent`|corrente<p>Update: 60s</p>|
|Fabricante|<p>-</p>|`SNMP agent`|sysContact<p>Update: 60s</p>|
|Status PoE|<p>-</p>|`SNMP agent`|statuspoe<p>Update: 60s</p>|
|Versão|<p>-</p>|`SNMP agent`|version<p>Update: 60s</p>|
|Tempo de Uptime|<p>-</p>|`SNMP agent`|sysUpTimeInstance<p>Update: 60s</p>|
|Modelo|<p>-</p>|`SNMP agent`|sysDescr<p>Update: 60s</p>|
|Data de Criação|<p>-</p>|`SNMP agent`|date<p>Update: 60s</p>|
|Voltagem de Entrada PoE|<p>-</p>|`SNMP agent`|voltagem<p>Update: 60s</p>|
|Status de controle da Saída da Fonte|<p>-</p>|`SNMP agent`|statusswitch<p>Update: 60s</p>|


## Triggers

There are no triggers in this template.

