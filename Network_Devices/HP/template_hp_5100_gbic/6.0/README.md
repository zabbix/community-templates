# Sinais Opticos SW HP

## Description

Sinais ópticos (GBIC) para SW HP 5100

## Overview

Template for SW 5100 with GBIC.


 


GBIC Information:


- Optical signal level


- Laser Temperature


- Voltage and Current in the Laser


- Wavelength


- Manufacturer


 


Required to MIB:


HH3C-TRANSCEIVER-INFO-MIB



## Author

Geraldo Jr

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Comprimento de Onda|<p>-</p>|`SNMP agent`|hh3cTransceiverWaveLength<p>Update: 30</p>|
|Tipo da Fibra $1|<p>-</p>|`SNMP agent`|hh3cTransceiverHardwareType<p>Update: 30</p>|
|Tensão do Laser|<p>-</p>|`SNMP agent`|hh3cTransceiverVoltage<p>Update: 30</p>|
|Diâmetro da Fibra $1|<p>-</p>|`SNMP agent`|hh3cTransceiverFiberDiameterType<p>Update: 30</p>|
|Minima Potencia de TX $1|<p>-</p>|`SNMP agent`|hh3cTransceiverMinTXPower<p>Update: 30</p>|
|Corrente do Laser|<p>-</p>|`SNMP agent`|hh3cTransceiverBiasCurrent<p>Update: 30</p>|
|Máxima Potencia de RX $1|<p>-</p>|`SNMP agent`|hh3cTransceiverMaxRXPower<p>Update: 30</p>|
|Fabricante (GBIC) $1|<p>-</p>|`SNMP agent`|hh3cTransceiverVendorName<p>Update: 30</p>|
|Minima Potencia de RX $1|<p>-</p>|`SNMP agent`|hh3cTransceiverMinRXPower<p>Update: 30</p>|
|Temperatura $1|<p>-</p>|`SNMP agent`|hh3cTransceiverTemperature<p>Update: 30</p>|
|Serial Number (GBIC) $1|<p>-</p>|`SNMP agent`|hh3cTransceiverSerialNumber<p>Update: 30</p>|
|Máxima Potencia de TX $1|<p>-</p>|`SNMP agent`|hh3cTransceiverMaxTXPower<p>Update: 30</p>|
|Distancia de transferencia $1|<p>-</p>|`SNMP agent`|hh3cTransceiverTransferDistance<p>Update: 30</p>|
|Potencia de TX $1|<p>-</p>|`SNMP agent`|hh3cTransceiverCurTXPower<p>Update: 30</p>|
|Tipo de Transceiver (GBIC) $1|<p>-</p>|`SNMP agent`|hh3cTransceiverType<p>Update: 30</p>|
|Potencia de RX $1|<p>-</p>|`SNMP agent`|hh3cTransceiverCurRXPower<p>Update: 30</p>|
|Alarme no Transceiver (GBIC) $1|<p>-</p>|`SNMP agent`|hh3cTransceiverDiagnostic<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

