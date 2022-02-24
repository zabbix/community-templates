# impressoras SIMPRESS

## Overview

Script e Template criados para monitorar niveis de toner em impressoras samsung. 


Script em php


Template via Zabbix


 


#!/usr/bin/php


php</p
 if($argc!=3){


 echo "Número de parametros invalido!\n";


 echo "Use: ".$argv[0]."  \n";


 exit(0);


 }


 $host=$argv[1];


 $cor=$argv[2];


 $cmd="snmpwalk -c public -v1 ".$host." .1.3.6.1.2.1.43.11.1.1.6.1 | grep '".$cor." Toner Cartridge'";


 $resp=exec($cmd);


 if($resp!=''){


 $aux=explode(" ",$resp);


 $aux2=explode(".",$aux[0]);


 $id\_cor=end($aux2);


 $cmd\_maxi\_toner="snmpwalk -c public -v1 ".$host." .1.3.6.1.2.1.43.11.1.1.8.1.".$id\_cor;


 $cmd\_disp\_toner="snmpwalk -c public -v1 ".$host." .1.3.6.1.2.1.43.11.1.1.9.1.".$id\_cor;


 $resp=exec($cmd\_maxi\_toner);


 $aux3=explode(" ",$resp);


 $resp\_maxi=$aux3[3];


 $resp=exec($cmd\_disp\_toner);


 $aux4=explode(" ",$resp);


 $resp\_disp=$aux4[3];


 $total\_disp\_perc=($resp\_disp/$resp\_maxi)*100;


 echo $total\_disp\_perc."\n";


}else echo "Cor nao definida!\n";


?>


 


Criação : Paulo Ricardo Carneiro Abrahão e Ana Flávia Sousa Qbar 


 





## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Nivel Toner Rosa|<p>-</p>|`External check`|NivelToner.php["{HOST.NAME}","Magenta"]<p>Update: 14400</p>|
|Nivel Toner Azul|<p>-</p>|`External check`|NivelToner.php["{HOST.NAME}","Cyan"]<p>Update: 14400</p>|
|Nivel Toner Preto|<p>-</p>|`External check`|NivelToner.php["{HOST.NAME}","Black"]<p>Update: 14400</p>|
|Nivel Toner Amarelo|<p>-</p>|`External check`|NivelToner.php["{HOST.NAME}","Yellow"]<p>Update: 14400</p>|


## Triggers

There are no triggers in this template.

