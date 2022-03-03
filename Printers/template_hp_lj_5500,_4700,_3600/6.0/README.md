# Printer HP LaserJet 5500

## Overview

Zabbix template wher added some parametrs like this:


1. Printer door open


2. Printer Jam present


3. Cartridge supply percent


4. Cartridge supply remaining print page


5. Shows Printer web page


6. Shows printer model


7.Shows printer supply model and name.


8. Printer status


 


I hope this template will helpfull for You.


 


 



## Author

aikucits

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|HP_Printer_Status|<p>Printer Status. Redy/Working OR Error</p>|`SNMP agent`|HP_Printer_Status<p>Update: 60</p>|
|hp.magenta.toner.max|<p>-</p>|`SNMP agent`|hp.magenta.toner.max<p>Update: 86400</p>|
|hp.yellow.toner.now|<p>-</p>|`SNMP agent`|hp.yellow.toner.now<p>Update: 10800</p>|
|Printer model Number|<p>Shows printer model number for firmware upgrade.</p>|`SNMP agent`|printer_model_number<p>Update: 86400</p>|
|hp.fuser.kit.now|<p>-</p>|`SNMP agent`|hp.fuser.kit.now<p>Update: 10800</p>|
|Transfer Kit level|<p>-</p>|`Calculated`|5550.img.trnsfr.perc<p>Update: 10800</p>|
|Printer web page|<p>Show Printer web access page.</p>|`SNMP agent`|printer_web_page<p>Update: 86400</p>|
|device-name|<p>User defined device name. The POS should indicate the maximum supported string length. If the user entered string is too long, the device will store as much as possible and will return the <OKNearestLegal ValueSubstituted>.Additional information: The maximum supported string length is 32 characters. If the user entered string is too long, the device will store the first 32 characters and will return the <noError> status.</p>|`SNMP agent`|device-name<p>Update: 86400</p>|
|Yellow toner paper print remaining value|<p>Shows how many paper you can print out with Yellow supply.</p>|`SNMP agent`|Yellow_toner_paper_print_remaining_value<p>Update: 600</p>|
|Model Black Toner|<p>-</p>|`SNMP agent`|hp.5550.black.cartridge.type<p>Update: 86400</p>|
|Magenta toner level|<p>-</p>|`Calculated`|5550.magenta.perc<p>Update: 1800</p>|
|hp.cyan.toner.max|<p>-</p>|`SNMP agent`|hp.cyan.toner.max<p>Update: 86400</p>|
|HP_PeripheralError|<p>HP_PeripheralError</p>|`SNMP agent`|HP_PeripheralError<p>Update: 600</p>|
|hp.fuser.kit.max|<p>-</p>|`SNMP agent`|hp.fuser.kit.max<p>Update: 86400</p>|
|Transfer Kit paper print remaining value|<p>Shows how many paper you can print out with this image transfer kit</p>|`SNMP agent`|Transfer_kit_paper_print_remaining_value<p>Update: 600</p>|
|hp.black.toner.now|<p>-</p>|`SNMP agent`|hp.black.toner.now<p>Update: 10800</p>|
|Model Transfer Kit|<p>-</p>|`SNMP agent`|hp.5550.transfer.kit.type<p>Update: 86400</p>|
|Black toner level|<p>-</p>|`Calculated`|5550.black.perc<p>Update: 1800</p>|
|Fuser kit paper print remaining value|<p>Shows how many paper you can print out with this image Fuser kit</p>|`SNMP agent`|Fuser_kit_paper_print_remaining_value<p>Update: 600</p>|
|hp.yellow.toner.max|<p>-</p>|`SNMP agent`|hp.yellow.toner.max<p>Update: 86400</p>|
|HP_Paper_Out|<p>Printer without paper.</p>|`SNMP agent`|HP_Paper_Out<p>Update: 60</p>|
|HP_DoorOpen|<p>Printers Door is Open</p>|`SNMP agent`|HP_TonerLow<p>Update: 30</p>|
|Model Fuser Kit|<p>-</p>|`SNMP agent`|hp.5550.fuser.kit.type<p>Update: 86400</p>|
|hp.transfer.kit.now|<p>-</p>|`SNMP agent`|hp.transfer.kit.now<p>Update: 10800</p>|
|Model Cyan Toner|<p>-</p>|`SNMP agent`|hp.5550.cyan.cartridge.type<p>Update: 86400</p>|
|Cyan toner level|<p>-</p>|`Calculated`|5550.cyan.perc<p>Update: 1800</p>|
|hp.magenta.toner.now|<p>-</p>|`SNMP agent`|hp.magenta.toner.now<p>Update: 10800</p>|
|Fuser Kit level|<p>-</p>|`Calculated`|5550.img.fsr.perc<p>Update: 10800</p>|
|Cyan toner paper print remaining value|<p>Shows how many paper you can print out with Cyan toner supply.</p>|`SNMP agent`|Cyan_toner_paper_print_remaining_value<p>Update: 600</p>|
|Model Magenta Toner|<p>-</p>|`SNMP agent`|hp.5550.magenta.cartridge.type<p>Update: 86400</p>|
|Printer_IP_address|<p>Printer assigned IP address.</p>|`SNMP agent`|Printer_IP_address<p>Update: 86400</p>|
|Magenta toner paper print remaining value|<p>Shows how many paper you can print out with Magenta supply.</p>|`SNMP agent`|Magenta_toner_paper_print_remaining_value<p>Update: 600</p>|
|hp.cyan.toner.now|<p>-</p>|`SNMP agent`|hp.cyan.toner.now<p>Update: 10800</p>|
|Host_Name|<p>Printer host name</p>|`SNMP agent`|Host_Name<p>Update: 86400</p>|
|Black toner paper print remaining value|<p>Shows how many paper you can print out with Black toner supply.</p>|`SNMP agent`|Black_toner_paper_print_remaining_value<p>Update: 600</p>|
|HP_PaperJam|<p>HP paper Jam</p>|`SNMP agent`|HP_PaperJam<p>Update: 30</p>|
|Model Yellow Toner|<p>-</p>|`SNMP agent`|hp.5550.yellow.cartridge.type<p>Update: 86400</p>|
|Yellow toner level|<p>-</p>|`Calculated`|5550.yellow.perc<p>Update: 1800</p>|
|hp.transfer.kit.max|<p>-</p>|`SNMP agent`|hp.transfer.kit.max<p>Update: 86400</p>|
|hp.black.toner.max|<p>-</p>|`SNMP agent`|hp.black.toner.max<p>Update: 86400</p>|


## Triggers

There are no triggers in this template.

