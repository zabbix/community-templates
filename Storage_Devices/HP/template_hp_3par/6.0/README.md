# HPE 3PAR SMI-S for shareZabbix

## Overview

Tested on HPE\_3PAR 8450, HPE\_3PAR 20840\_R2


Python-script to get metrics from HP 3Par Storage. Script uses SMI-S interface.


This script get next metrics:


Battery, CagePowerSupply, DiskDrive, DriveCage, DynamicStoragePool, EthernetPort, Fan, FCPort, IDEDrive, NodePowerSupply, NodeSystem, PCICard, PhysicalMemory, SASPort



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$HP_PASSWORD}|<p>-</p>|``|Text macro|
|{$HP_USER}|<p>-</p>|``|Text macro|
|{$OVERPROVISION}|<p>-</p>|`90`|Text macro|
|{$SMI_S_PORT}|<p>-</p>|`5989`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|PhysicalMemory|<p>-</p>|`Zabbix trapper`|PhysicalMemory<p>Update: 0</p>|
|SASPort|<p>-</p>|`Zabbix trapper`|SASPort<p>Update: 0</p>|
|Battery|<p>-</p>|`Zabbix trapper`|Battery<p>Update: 0</p>|
|DynamicStoragePool|<p>-</p>|`Zabbix trapper`|DynamicStoragePool<p>Update: 0</p>|
|DriveCage|<p>-</p>|`Zabbix trapper`|DriveCage<p>Update: 0</p>|
|CagePowerSupply|<p>-</p>|`Zabbix trapper`|CagePowerSupply<p>Update: 0</p>|
|EthernetPort|<p>-</p>|`Zabbix trapper`|EthernetPort<p>Update: 0</p>|
|IDEDrive|<p>-</p>|`Zabbix trapper`|IDEDrive<p>Update: 0</p>|
|NodeSystem|<p>-</p>|`Zabbix trapper`|NodeSystem<p>Update: 0</p>|
|PCICard|<p>-</p>|`Zabbix trapper`|PCICard<p>Update: 0</p>|
|NodePowerSupply|<p>-</p>|`Zabbix trapper`|NodePowerSupply<p>Update: 0</p>|
|FCPort|<p>-</p>|`Zabbix trapper`|FCPort<p>Update: 0</p>|
|DiskDrive|<p>-</p>|`Zabbix trapper`|DiskDrive<p>Update: 0</p>|
|Fan|<p>-</p>|`Zabbix trapper`|Fan<p>Update: 0</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Get Status|<p>-</p>|`External check`|hp_3par_get_state_wbem.py["--hp_ip={HOST.IP}", "--hp_port={$SMI_S_PORT}", "--hp_user={$HP_USER}", "--hp_password={$HP_PASSWORD}", "--storage_name={HOST.NAME}", "--status"]<p>Update: 3m</p>|
|Get Overprovisioning CPG|<p>-</p>|`External check`|hp_3par_get_state_wbem.py["--hp_ip={HOST.IP}", "--hp_port={$SMI_S_PORT}", "--hp_user={$HP_USER}", "--hp_password={$HP_PASSWORD}", "--storage_name={HOST.NAME}", "--overprovisioning"]<p>Update: 15m</p>|
|Get Discovery|<p>-</p>|`External check`|hp_3par_get_state_wbem.py["--hp_ip={HOST.IP}", "--hp_port={$SMI_S_PORT}", "--hp_user={$HP_USER}", "--hp_password={$HP_PASSWORD}", "--storage_name={HOST.NAME}", "--discovery"]<p>Update: 1h</p>|
|Operational status of PhysicalMemory module "{#SERIAL_NUMBER}"|<p>-</p>|`Zabbix trapper`|oper.PhysicalMemory.[{#SERIAL_NUMBER}]<p>Update: 0</p><p>LLD</p>|
|Health status of SASPort "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|health.SASPort.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Operational status of SASPort "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|oper.SASPort.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Other operational status of SASPort "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|other.oper.SASPort.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Health status of a Battery "{#DEVICE_ID}"|<p>-</p>|`Zabbix trapper`|health.Battery.[{#DEVICE_ID}]<p>Update: 0</p><p>LLD</p>|
|Operational status of a Battery "{#DEVICE_ID}"|<p>-</p>|`Zabbix trapper`|oper.Battery.[{#DEVICE_ID}]<p>Update: 0</p><p>LLD</p>|
|Health status of a DynamicStoragePool "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|health.DynamicStoragePool.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Operational status of a DynamicStoragePool "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|oper.DynamicStoragePool.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Overprovisioning of a DynamicStoragePool "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|overprv.DynamicStoragePool.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Health status of a DriveCage "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|health.DriveCage.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Operational status of a DriveCage "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|oper.DriveCage.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Health status of "{#CAGE_NAME} - {#NUMBER_PSU}"|<p>-</p>|`Zabbix trapper`|health.CagePowerSupply.[{#DEVICE_ID}]<p>Update: 0</p><p>LLD</p>|
|Operational status of "{#CAGE_NAME} - {#NUMBER_PSU}"|<p>-</p>|`Zabbix trapper`|oper.CagePowerSupply.[{#DEVICE_ID}]<p>Update: 0</p><p>LLD</p>|
|Health status of a EthernetPort "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|health.EthernetPort.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Operational status of a EthernetPort "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|oper.EthernetPort.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Other operational status of a EthernetPort "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|other.oper.EthernetPort.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Operational status of IDEDrive "{#TAG}"|<p>-</p>|`Zabbix trapper`|oper.IDEDrive.[{#TAG}]<p>Update: 0</p><p>LLD</p>|
|Health status of Node "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|health.NodeSystem.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|LED status of Node "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|led.NodeSystem.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Operational status of Node "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|oper.NodeSystem.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Operational status of PCICard "{#MANUFACTURER}-{#TAG}"|<p>-</p>|`Zabbix trapper`|oper.PCICard.[{#TAG}]<p>Update: 0</p><p>LLD</p>|
|Health status of "{#NODE_NAME} - {#NUMBER_PSU}"|<p>-</p>|`Zabbix trapper`|health.NodePowerSupply.[{#DEVICE_ID}]<p>Update: 0</p><p>LLD</p>|
|Operational status of "{#NODE_NAME} - {#NUMBER_PSU}"|<p>-</p>|`Zabbix trapper`|oper.NodePowerSupply.[{#DEVICE_ID}]<p>Update: 0</p><p>LLD</p>|
|Health status of a FCPort "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|health.FCPort.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Operational status of a FCPort "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|oper.FCPort.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Other operational status of a FCPort "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|other.oper.FCPort.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Health status of a DiskDrive "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|health.DiskDrive.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Operational status of a DiskDrive "{#ELEMENT_NAME}"|<p>-</p>|`Zabbix trapper`|oper.DiskDrive.[{#ELEMENT_NAME}]<p>Update: 0</p><p>LLD</p>|
|Health status of a Fan "{#DEVICE_ID}"|<p>-</p>|`Zabbix trapper`|health.Fan.[{#DEVICE_ID}]<p>Update: 0</p><p>LLD</p>|
|Operational status of a Fan "{#DEVICE_ID}"|<p>-</p>|`Zabbix trapper`|oper.Fan.[{#DEVICE_ID}]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|{HOST.NAME} -> Battery "{#DEVICE_ID}" health status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.Battery.[{#DEVICE_ID}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Battery "{#DEVICE_ID}" operational status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.Battery.[{#DEVICE_ID}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> "{#NUMBER_PSU} - {#CAGE_NAME} - {#SERIAL_NUMBER_PSU}" health status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.CagePowerSupply.[{#DEVICE_ID}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> "{#NUMBER_PSU} - {#CAGE_NAME} - {#SERIAL_NUMBER_PSU}" operational status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.CagePowerSupply.[{#DEVICE_ID}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> DiskDrive "{#ELEMENT_NAME}" health status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.DiskDrive.[{#ELEMENT_NAME}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> DiskDrive "{#ELEMENT_NAME}" operational status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.DiskDrive.[{#ELEMENT_NAME}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> DriveCage "{#ELEMENT_NAME}" health status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.DriveCage.[{#ELEMENT_NAME}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> DriveCage "{#ELEMENT_NAME}" operational status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.DriveCage.[{#ELEMENT_NAME}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> DynamicStoragePool "{#ELEMENT_NAME}" health status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.DynamicStoragePool.[{#ELEMENT_NAME}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> DynamicStoragePool "{#ELEMENT_NAME}" operational status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.DynamicStoragePool.[{#ELEMENT_NAME}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Overprovision on DynamicStoragePool "{#ELEMENT_NAME}" > {$OVERPROVISION:"{#ELEMENT_NAME}"}%|<p>-</p>|<p>**Expression**: last(/HPE 3PAR SMI-S for shareZabbix/overprv.DynamicStoragePool.[{#ELEMENT_NAME}])>90</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> EthernetPort "{#ELEMENT_NAME}" health status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.EthernetPort.[{#ELEMENT_NAME}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> EthernetPort "{#ELEMENT_NAME}" operational status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: ({TRIGGER.VALUE}=0 and last(/HPE 3PAR SMI-S for shareZabbix/oper.EthernetPort.[{#ELEMENT_NAME}])<>2 and change(/HPE 3PAR SMI-S for shareZabbix/oper.EthernetPort.[{#ELEMENT_NAME}])<>0) or ({TRIGGER.VALUE}=1 and last(/HPE 3PAR SMI-S for shareZabbix/oper.EthernetPort.[{#ELEMENT_NAME}])<>2)</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> EthernetPort "{#ELEMENT_NAME}" other operational status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: ({TRIGGER.VALUE}=0 and last(/HPE 3PAR SMI-S for shareZabbix/other.oper.EthernetPort.[{#ELEMENT_NAME}])<>3 and change(/HPE 3PAR SMI-S for shareZabbix/other.oper.EthernetPort.[{#ELEMENT_NAME}])<>0) or ({TRIGGER.VALUE}=1 and last(/HPE 3PAR SMI-S for shareZabbix/other.oper.EthernetPort.[{#ELEMENT_NAME}])<>3)</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Fan "{#DEVICE_ID}" health status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.Fan.[{#DEVICE_ID}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Fan "{#DEVICE_ID}" operational status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.Fan.[{#DEVICE_ID}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> FCPort "{#ELEMENT_NAME}" health status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.FCPort.[{#ELEMENT_NAME}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> FCPort "{#ELEMENT_NAME}" operational status is "{ITEM.VALUE}"|<p>Предыдущее триггерное выражение: ({TRIGGER.VALUE}=0 and {Template HPE 3PAR SMI-S:oper.FCPort.[{#ELEMENT_NAME}].last()}<>2 and {Template HPE 3PAR SMI-S:oper.FCPort.[{#ELEMENT_NAME}].change()}<>0) or ({TRIGGER.VALUE}=1 and {Template HPE 3PAR SMI-S:oper.FCPort.[{#ELEMENT_NAME}].last()}<>2)</p>|<p>**Expression**: last(/HPE 3PAR SMI-S for shareZabbix/oper.FCPort.[{#ELEMENT_NAME}],#2)=2 and last(/HPE 3PAR SMI-S for shareZabbix/oper.FCPort.[{#ELEMENT_NAME}])<>2</p><p>**Recovery expression**: last(/HPE 3PAR SMI-S for shareZabbix/oper.FCPort.[{#ELEMENT_NAME}])=2</p>|high|
|{HOST.NAME} -> FCPort "{#ELEMENT_NAME}" other operational status is "{ITEM.VALUE}"|<p>Предыдущее триггерное выражение: ({TRIGGER.VALUE}=0 and {Template HPE 3PAR SMI-S:other.oper.FCPort.[{#ELEMENT_NAME}].last()}<>3 and {Template HPE 3PAR SMI-S:other.oper.FCPort.[{#ELEMENT_NAME}].change()}<>0) or ({TRIGGER.VALUE}=1 and {Template HPE 3PAR SMI-S:other.oper.FCPort.[{#ELEMENT_NAME}].last()}<>3)</p>|<p>**Expression**: last(/HPE 3PAR SMI-S for shareZabbix/other.oper.FCPort.[{#ELEMENT_NAME}],#2)=3 and last(/HPE 3PAR SMI-S for shareZabbix/other.oper.FCPort.[{#ELEMENT_NAME}])<>3</p><p>**Recovery expression**: last(/HPE 3PAR SMI-S for shareZabbix/other.oper.FCPort.[{#ELEMENT_NAME}])=3</p>|high|
|{HOST.NAME} -> IDEDrive "{#TAG}" operational status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.IDEDrive.[{#TAG}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> "{#NUMBER_PSU} - {#NODE_NAME} - {#SERIAL_NUMBER_PSU}" health status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.NodePowerSupply.[{#DEVICE_ID}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> "{#NUMBER_PSU} - {#NODE_NAME} - {#SERIAL_NUMBER_PSU}" operational status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.NodePowerSupply.[{#DEVICE_ID}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> NodeSystem "{#ELEMENT_NAME}" health status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.NodeSystem.[{#ELEMENT_NAME}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> NodeSystem "{#ELEMENT_NAME}" LED status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/led.NodeSystem.[{#ELEMENT_NAME}],#3,"ne","2")>2 and count(/HPE 3PAR SMI-S for shareZabbix/led.NodeSystem.[{#ELEMENT_NAME}],#3,"ne","3")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> NodeSystem "{#ELEMENT_NAME}" operational status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.NodeSystem.[{#ELEMENT_NAME}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> PCICard "{#MANUFACTURER}-{#TAG}" operational status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.PCICard.[{#TAG}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> PhysicalMemory "{#SERIAL_NUMBER}" operational status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.PhysicalMemory.[{#SERIAL_NUMBER}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> SASPort "{#ELEMENT_NAME}" health status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.SASPort.[{#ELEMENT_NAME}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> SASPort "{#ELEMENT_NAME}" operational status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: last(/HPE 3PAR SMI-S for shareZabbix/oper.SASPort.[{#ELEMENT_NAME}],#2)=2 and last(/HPE 3PAR SMI-S for shareZabbix/oper.SASPort.[{#ELEMENT_NAME}])<>2</p><p>**Recovery expression**: last(/HPE 3PAR SMI-S for shareZabbix/oper.SASPort.[{#ELEMENT_NAME}])=2</p>|high|
|{HOST.NAME} -> SASPort "{#ELEMENT_NAME}" other operational status is "{ITEM.VALUE}"|<p>-</p>|<p>**Expression**: last(/HPE 3PAR SMI-S for shareZabbix/other.oper.SASPort.[{#ELEMENT_NAME}],#2)=3 and last(/HPE 3PAR SMI-S for shareZabbix/other.oper.SASPort.[{#ELEMENT_NAME}])<>3</p><p>**Recovery expression**: last(/HPE 3PAR SMI-S for shareZabbix/other.oper.SASPort.[{#ELEMENT_NAME}])=3</p>|high|
|{HOST.NAME} -> PhysicalMemory "{#SERIAL_NUMBER}" operational status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.PhysicalMemory.[{#SERIAL_NUMBER}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> SASPort "{#ELEMENT_NAME}" health status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.SASPort.[{#ELEMENT_NAME}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> SASPort "{#ELEMENT_NAME}" operational status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: last(/HPE 3PAR SMI-S for shareZabbix/oper.SASPort.[{#ELEMENT_NAME}],#2)=2 and last(/HPE 3PAR SMI-S for shareZabbix/oper.SASPort.[{#ELEMENT_NAME}])<>2</p><p>**Recovery expression**: last(/HPE 3PAR SMI-S for shareZabbix/oper.SASPort.[{#ELEMENT_NAME}])=2</p>|high|
|{HOST.NAME} -> SASPort "{#ELEMENT_NAME}" other operational status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: last(/HPE 3PAR SMI-S for shareZabbix/other.oper.SASPort.[{#ELEMENT_NAME}],#2)=3 and last(/HPE 3PAR SMI-S for shareZabbix/other.oper.SASPort.[{#ELEMENT_NAME}])<>3</p><p>**Recovery expression**: last(/HPE 3PAR SMI-S for shareZabbix/other.oper.SASPort.[{#ELEMENT_NAME}])=3</p>|high|
|{HOST.NAME} -> Battery "{#DEVICE_ID}" health status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.Battery.[{#DEVICE_ID}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Battery "{#DEVICE_ID}" operational status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.Battery.[{#DEVICE_ID}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> DynamicStoragePool "{#ELEMENT_NAME}" health status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.DynamicStoragePool.[{#ELEMENT_NAME}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> DynamicStoragePool "{#ELEMENT_NAME}" operational status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.DynamicStoragePool.[{#ELEMENT_NAME}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Overprovision on DynamicStoragePool "{#ELEMENT_NAME}" > {$OVERPROVISION:"{#ELEMENT_NAME}"}% (LLD)|<p>-</p>|<p>**Expression**: last(/HPE 3PAR SMI-S for shareZabbix/overprv.DynamicStoragePool.[{#ELEMENT_NAME}])>90</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> DriveCage "{#ELEMENT_NAME}" health status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.DriveCage.[{#ELEMENT_NAME}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> DriveCage "{#ELEMENT_NAME}" operational status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.DriveCage.[{#ELEMENT_NAME}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> "{#NUMBER_PSU} - {#CAGE_NAME} - {#SERIAL_NUMBER_PSU}" health status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.CagePowerSupply.[{#DEVICE_ID}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> "{#NUMBER_PSU} - {#CAGE_NAME} - {#SERIAL_NUMBER_PSU}" operational status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.CagePowerSupply.[{#DEVICE_ID}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> EthernetPort "{#ELEMENT_NAME}" health status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.EthernetPort.[{#ELEMENT_NAME}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> EthernetPort "{#ELEMENT_NAME}" operational status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: ({TRIGGER.VALUE}=0 and last(/HPE 3PAR SMI-S for shareZabbix/oper.EthernetPort.[{#ELEMENT_NAME}])<>2 and change(/HPE 3PAR SMI-S for shareZabbix/oper.EthernetPort.[{#ELEMENT_NAME}])<>0) or ({TRIGGER.VALUE}=1 and last(/HPE 3PAR SMI-S for shareZabbix/oper.EthernetPort.[{#ELEMENT_NAME}])<>2)</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> EthernetPort "{#ELEMENT_NAME}" other operational status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: ({TRIGGER.VALUE}=0 and last(/HPE 3PAR SMI-S for shareZabbix/other.oper.EthernetPort.[{#ELEMENT_NAME}])<>3 and change(/HPE 3PAR SMI-S for shareZabbix/other.oper.EthernetPort.[{#ELEMENT_NAME}])<>0) or ({TRIGGER.VALUE}=1 and last(/HPE 3PAR SMI-S for shareZabbix/other.oper.EthernetPort.[{#ELEMENT_NAME}])<>3)</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> IDEDrive "{#TAG}" operational status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.IDEDrive.[{#TAG}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> NodeSystem "{#ELEMENT_NAME}" health status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.NodeSystem.[{#ELEMENT_NAME}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> NodeSystem "{#ELEMENT_NAME}" LED status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/led.NodeSystem.[{#ELEMENT_NAME}],#3,"ne","2")>2 and count(/HPE 3PAR SMI-S for shareZabbix/led.NodeSystem.[{#ELEMENT_NAME}],#3,"ne","3")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> NodeSystem "{#ELEMENT_NAME}" operational status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.NodeSystem.[{#ELEMENT_NAME}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> PCICard "{#MANUFACTURER}-{#TAG}" operational status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.PCICard.[{#TAG}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> "{#NUMBER_PSU} - {#NODE_NAME} - {#SERIAL_NUMBER_PSU}" health status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.NodePowerSupply.[{#DEVICE_ID}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> "{#NUMBER_PSU} - {#NODE_NAME} - {#SERIAL_NUMBER_PSU}" operational status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.NodePowerSupply.[{#DEVICE_ID}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> FCPort "{#ELEMENT_NAME}" health status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.FCPort.[{#ELEMENT_NAME}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> FCPort "{#ELEMENT_NAME}" operational status is "{ITEM.VALUE}" (LLD)|<p>Предыдущее триггерное выражение: ({TRIGGER.VALUE}=0 and {Template HPE 3PAR SMI-S:oper.FCPort.[{#ELEMENT_NAME}].last()}<>2 and {Template HPE 3PAR SMI-S:oper.FCPort.[{#ELEMENT_NAME}].change()}<>0) or ({TRIGGER.VALUE}=1 and {Template HPE 3PAR SMI-S:oper.FCPort.[{#ELEMENT_NAME}].last()}<>2)</p>|<p>**Expression**: last(/HPE 3PAR SMI-S for shareZabbix/oper.FCPort.[{#ELEMENT_NAME}],#2)=2 and last(/HPE 3PAR SMI-S for shareZabbix/oper.FCPort.[{#ELEMENT_NAME}])<>2</p><p>**Recovery expression**: last(/HPE 3PAR SMI-S for shareZabbix/oper.FCPort.[{#ELEMENT_NAME}])=2</p>|high|
|{HOST.NAME} -> FCPort "{#ELEMENT_NAME}" other operational status is "{ITEM.VALUE}" (LLD)|<p>Предыдущее триггерное выражение: ({TRIGGER.VALUE}=0 and {Template HPE 3PAR SMI-S:other.oper.FCPort.[{#ELEMENT_NAME}].last()}<>3 and {Template HPE 3PAR SMI-S:other.oper.FCPort.[{#ELEMENT_NAME}].change()}<>0) or ({TRIGGER.VALUE}=1 and {Template HPE 3PAR SMI-S:other.oper.FCPort.[{#ELEMENT_NAME}].last()}<>3)</p>|<p>**Expression**: last(/HPE 3PAR SMI-S for shareZabbix/other.oper.FCPort.[{#ELEMENT_NAME}],#2)=3 and last(/HPE 3PAR SMI-S for shareZabbix/other.oper.FCPort.[{#ELEMENT_NAME}])<>3</p><p>**Recovery expression**: last(/HPE 3PAR SMI-S for shareZabbix/other.oper.FCPort.[{#ELEMENT_NAME}])=3</p>|high|
|{HOST.NAME} -> DiskDrive "{#ELEMENT_NAME}" health status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.DiskDrive.[{#ELEMENT_NAME}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> DiskDrive "{#ELEMENT_NAME}" operational status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.DiskDrive.[{#ELEMENT_NAME}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Fan "{#DEVICE_ID}" health status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/health.Fan.[{#DEVICE_ID}],#3,"ne","5")>2</p><p>**Recovery expression**: </p>|high|
|{HOST.NAME} -> Fan "{#DEVICE_ID}" operational status is "{ITEM.VALUE}" (LLD)|<p>-</p>|<p>**Expression**: count(/HPE 3PAR SMI-S for shareZabbix/oper.Fan.[{#DEVICE_ID}],#3,"ne","2")>2</p><p>**Recovery expression**: </p>|high|
