# Nobreak SMS Powerview by HTTP

## Description

Version 1.0. Para utilização com o software SMS Power View, testado com o aplicativo versão Versão: V3.00.02.00. Meu Nobreak é Entrada/Saída 220V, portanto para 110V seriam necessários ajustes. Se tiver alguém utilizando eu posso utilizar parâmetros como Macro. Este template funciona realizando o parse do código da página http://localhost:8080/sms/s2/atualizaBlock.action que possui comentários com os dados do Nobreak.

## Overview

Version 1.0.


 


Para utilização com o software SMS Power View, testado com o aplicativo versão Versão: V3.00.02.00.


Meu Nobreak é Entrada/Saída 220V, portanto para 110V seriam necessários ajustes. Se tiver alguém utilizando eu posso utilizar parâmetros como Macro.


 


Este template funciona realizando o parse do código da página http://localhost:8080/sms/s2/atualizaBlock.action que possui comentários com os dados do Nobreak.



## Author

Marlon J dos Anjos

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Nobreak SMS: Bateria Ligada|<p>Alarme de status quando a bateria está em uso, geralmente quando está sem energia ou a qualidade da energia está fora dos parâmetros aceitáveis.</p>|`Dependent item`|nobreaksms.bateria.ligada<p>Update: 0</p>|
|Nobreak SMS: Tensao de Entrada|<p>Tensão de Entrada em Volts.</p>|`Dependent item`|nobreaksms.tensao.entrada<p>Update: 0</p>|
|Nobreak SMS PowerView|<p>Item que realiza o GET da página do nobreak. A página atualizaBlock.action possui comentários com os parâmetros atuais do nobreak, e é atualizado em tempo real.</p>|`HTTP agent`|nobreaksms.get<p>Update: 15s</p>|
|Nobreak SMS: Tensao de Saida|<p>Tensão de Saída em Volts.</p>|`Dependent item`|nobreaksms.tensao.saida<p>Update: 0</p>|
|Nobreak SMS: Temperatura|<p>Temperatura do nobreak, tende a subir quando utilizado a bateria. Pelos meus testes representa bem uma temperatura do ambiente, portanto eu uso também como alerta se a sala está muito aquecida.</p>|`Dependent item`|nobreaksms.temperatura<p>Update: 0</p>|
|Nobreak SMS: Potencia de Saida|<p>Potência de saída do nobreak, quanto mais equipamentos ligados maior será a potência e menor a autonomia.</p>|`Dependent item`|nobreaksms.potencia.saida<p>Update: 0</p>|
|Nobreak SMS: Frequencia de Saida|<p>Frequência de saída do Nobreak, geralmente 60Hz +- 1%.</p>|`Dependent item`|nobreaksms.frequencia.saida<p>Update: 0</p>|
|Nobreak SMS: Bateria Baixa|<p>Status do alerta Bateria Baixa</p>|`Dependent item`|nobreaksms.bateria.baixa<p>Update: 0</p>|
|Nobreak SMS: Bypass|<p>Indica se o Bypass do Nobreak está ativo, ou seja, utilizando energia direto da rede sem o filtro do nobreak. Geralmente por algum problema na bateria, no nobreak, ou sobrecarga de potencia.</p>|`Dependent item`|nobreaksms.bypass<p>Update: 0</p>|
|Nobreak SMS: Tensao da Bateria|<p>Tensão da bateria reportado em %. Basicamente o nível de carga.</p>|`Dependent item`|nobreaksms.tensao.bateria<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

