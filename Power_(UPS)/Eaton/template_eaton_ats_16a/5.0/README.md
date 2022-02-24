# Eaton ATS 230V 16A

## Overview

Template for Eaton ATS 16A


46 Items  
19 Triggers



## Author

Peter Stanke

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|The output voltage config|<p>-</p>|`SNMP agent`|ats2ConfigOutputVoltage<p>Update: 2m</p>|
|The status of input frequency (Source 1)|<p>-</p>|`SNMP agent`|ats2InputStatusFrequency_source1<p>Update: 1m</p>|
|Short circuit status|<p>-</p>|`SNMP agent`|ats2StatusShortCircuit<p>Update: 1m</p>|
|The output current|<p>-</p>|`SNMP agent`|ats2OutputCurrent<p>Update: 5m</p>|
|The internal fault status of input (Source 1)|<p>-</p>|`SNMP agent`|ats2InputStatusInternalFailure_source1<p>Update: 1m</p>|
|The dephasing in between Source 1 and Source 2|<p>-</p>|`SNMP agent`|ats2InputDephasing<p>Update: 5m</p>|
|The input voltage (Source 1)|<p>-</p>|`SNMP agent`|ats2InputVoltage_source1<p>Update: 5m</p>|
|The input voltage (Source 2)|<p>-</p>|`SNMP agent`|ats2InputVoltage_source2<p>Update: 5m</p>|
|The release date|<p>-</p>|`SNMP agent`|ats2IdentRelease<p>Update: 1d</p>|
|The summarized status of input AC flow (Source 2)|<p>-</p>|`SNMP agent`|ats2InputStatusGood_source2<p>Update: 1m</p>|
|The status of input voltage (Source 2)|<p>-</p>|`SNMP agent`|ats2InputStatusVoltage_source2<p>Update: 1m</p>|
|The operation mode|<p>-</p>|`SNMP agent`|ats2OperationMode<p>Update: 1m</p>|
|The input frequency (Source 2)|<p>-</p>|`SNMP agent`|ats2InputFrequency_source2<p>Update: 5m</p>|
|The AC Blackout Sensitivity|<p>-</p>|`SNMP agent`|ats2ConfigSensitivity<p>Update: 2m</p>|
|The status of input voltage (Source 1)|<p>-</p>|`SNMP agent`|ats2InputStatusVoltage_source1<p>Update: 1m</p>|
|Setting of input brownout high voltage|<p>-</p>|`SNMP agent`|ats2ConfigBrownoutHigh<p>Update: 2m</p>|
|Setting of input brownout low derated voltage|<p>-</p>|`SNMP agent`|ats2ConfigBrownoutLowDerated<p>Update: 2m</p>|
|The input voltage rating|<p>-</p>|`SNMP agent`|ats2ConfigInputVoltageRating<p>Update: 2m</p>|
|The manufacturer name|<p>-</p>|`SNMP agent`|ats2IdentManufacturer<p>Update: 1d</p>|
|The over temperature status|<p>-</p>|`SNMP agent`|ats2StatusOverTemperature<p>Update: 1m</p>|
|Output fault|<p>-</p>|`SNMP agent`|ats2StatusInternalFailure<p>Update: 1m</p>|
|Device part number|<p>-</p>|`SNMP agent`|ats2IdentPartNumber<p>Update: 1d</p>|
|The preferred source|<p>-</p>|`SNMP agent`|ats2ConfigPreferred<p>Update: 2m</p>|
|The input frequency (Source 1)|<p>-</p>|`SNMP agent`|ats2InputFrequency_source1<p>Update: 5m</p>|
|Hysteresis between loss point and comeback point|<p>-</p>|`SNMP agent`|ats2ConfigHysteresisVoltage<p>Update: 2m</p>|
|Device F/W version|<p>-</p>|`SNMP agent`|ats2IdentFWVersion<p>Update: 1d</p>|
|Communication failure status|<p>-</p>|`SNMP agent`|ats2StatusCommunicationLost<p>Update: 1m</p>|
|Communication Card F/W version|<p>-</p>|`SNMP agent`|ats2IdentAgentVersion<p>Update: 1d</p>|
|The output voltage|<p>-</p>|`SNMP agent`|ats2OutputVoltage<p>Update: 5m</p>|
|The input frequency rating|<p>-</p>|`SNMP agent`|ats2ConfigInputFrequencyRating<p>Update: 2m</p>|
|Setting of input brownout low voltage|<p>-</p>|`SNMP agent`|ats2ConfigBrownoutLow<p>Update: 2m</p>|
|The present date in MM/DD/YYYY text format|<p>-</p>|`SNMP agent`|ats2ConfigTimeTextDate<p>Update: 5m</p>|
|The output overload status|<p>-</p>|`SNMP agent`|ats2StatusOverload<p>Update: 1m</p>|
|behavior configuration when transfering from one source to other source not synchronized|<p>-</p>|`SNMP agent`|ats2ConfigTransferMode<p>Update: 2m</p>|
|The status of transfer test|<p>-</p>|`SNMP agent`|ats2ConfigTransferTest<p>Update: 2m</p>|
|The summarized status of input AC flow (Source 1)|<p>-</p>|`SNMP agent`|ats2InputStatusGood_source1<p>Update: 1m</p>|
|The status of input relay (Source 2)|<p>-</p>|`SNMP agent`|ats2InputStatusUsed_source2<p>Update: 1m</p>|
|The dephasing status in between Source 1 and Source 2|<p>-</p>|`SNMP agent`|ats2InputStatusDephasing<p>Update: 5m</p>|
|Configuration failure status|<p>-</p>|`SNMP agent`|ats2StatusConfigurationFailure<p>Update: 1m</p>|
|The internal fault status of input (Source 2)|<p>-</p>|`SNMP agent`|ats2InputStatusInternalFailure_source2<p>Update: 1m</p>|
|Output powered status|<p>-</p>|`SNMP agent`|ats2StatusOutput<p>Update: 1m</p>|
|Device serial number|<p>-</p>|`SNMP agent`|ats2IdentSerialNumber<p>Update: 1d</p>|
|The status of input relay (Source 1)|<p>-</p>|`SNMP agent`|ats2InputStatusUsed_source1<p>Update: 1m</p>|
|The status of input frequency (Source 2)|<p>-</p>|`SNMP agent`|ats2InputStatusFrequency_source2<p>Update: 1m</p>|
|The present time in hh:mm:ss text format|<p>-</p>|`SNMP agent`|ats2ConfigTimeTextTime<p>Update: 5m</p>|
|Device model name|<p>-</p>|`SNMP agent`|ats2IdentModel<p>Update: 1d</p>|


## Triggers

There are no triggers in this template.

