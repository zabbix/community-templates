# IPMI Cisco UCS-C220 Server hardware

## Description

ipmi sensors, please disable absend HDD and unsupported items

## Overview

Template for monitoring IPMI sensors for Cisco UCS servers hardware


tested on C220M3


please disable absend HDD and unsupported items after some time.


sensors and triggers:


* cpu temperature
* DDR modules status
* HDD status
* LED fan status
* overal leds status
* Power modules status
* other temperature sensors
* storage status


## Author

Dmitry Lavrukhin

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|DDR3_P1_A2_ECC|<p>-</p>|`IPMI agent`|DDR3_P1_A2_ECC<p>Update: 3600</p>|
|HDD3_STATUS|<p>-</p>|`IPMI agent`|HDD3_STATUS<p>Update: 3600</p>|
|DDR3_P2_G2_ECC|<p>-</p>|`IPMI agent`|DDR3_P2_G2_ECC<p>Update: 3600</p>|
|LED_FAN2_FAULT|<p>-</p>|`IPMI agent`|LED_FAN2_FAULT<p>Update: 3600</p>|
|HDD5_STATUS|<p>-</p>|`IPMI agent`|HDD5_STATUS<p>Update: 3600</p>|
|CPU1 temperature|<p>-</p>|`IPMI agent`|P1_TEMP_SENS<p>Update: 3600</p>|
|LED_FAN1_FAULT|<p>-</p>|`IPMI agent`|LED_FAN1_FAULT<p>Update: 3600</p>|
|STOR_STATUS|<p>-</p>|`IPMI agent`|STOR_STATUS<p>Update: 3600</p>|
|RISER1_OUTLETTMP|<p>-</p>|`IPMI agent`|RISER1_OUTLETTMP<p>Update: 3600</p>|
|DDR3_P2_H2_ECC|<p>-</p>|`IPMI agent`|DDR3_P2_H2_ECC<p>Update: 3600</p>|
|DDR3_P1_C1_ECC|<p>-</p>|`IPMI agent`|DDR3_P1_C1_ECC<p>Update: 3600</p>|
|HDD6_STATUS|<p>-</p>|`IPMI agent`|HDD6_STATUS<p>Update: 3600</p>|
|HDD1_STATUS|<p>-</p>|`IPMI agent`|HDD1_STATUS<p>Update: 3600</p>|
|PSU2_AC_OK|<p>-</p>|`IPMI agent`|PSU2_AC_OK<p>Update: 3600</p>|
|DDR3_P2_F1_ECC|<p>-</p>|`IPMI agent`|DDR3_P2_F1_ECC<p>Update: 3600</p>|
|DDR3_P1_A1_ECC|<p>-</p>|`IPMI agent`|DDR3_P1_A1_ECC<p>Update: 3600</p>|
|HDD2_STATUS|<p>-</p>|`IPMI agent`|HDD2_STATUS<p>Update: 3600</p>|
|HDD4_STATUS|<p>-</p>|`IPMI agent`|HDD4_STATUS<p>Update: 3600</p>|
|RISER1_INLET_TMP|<p>-</p>|`IPMI agent`|RISER1_INLET_TMP<p>Update: 3600</p>|
|DDR3_P1_B2_ECC|<p>-</p>|`IPMI agent`|DDR3_P1_B2_ECC<p>Update: 3600</p>|
|DDR3_P2_G1_ECC|<p>-</p>|`IPMI agent`|DDR3_P2_G1_ECC<p>Update: 3600</p>|
|CPU2 temperature|<p>-</p>|`IPMI agent`|P2_TEMP_SENS<p>Update: 3600</p>|
|FP_TEMP_SENSOR|<p>-</p>|`IPMI agent`|FP_TEMP_SENSOR<p>Update: 3600</p>|
|DDR3_P2_F2_ECC|<p>-</p>|`IPMI agent`|DDR3_P2_F2_ECC<p>Update: 3600</p>|
|PSU1_AC_OK|<p>-</p>|`IPMI agent`|PSU1_AC_OK<p>Update: 3600</p>|
|Overall LED_FAN_STATUS|<p>-</p>|`IPMI agent`|LED_FAN_STATUS<p>Update: 3600</p>|
|HDD7_STATUS|<p>-</p>|`IPMI agent`|HDD7_STATUS<p>Update: 3600</p>|
|OVERALL_DIMM_STATUS|<p>-</p>|`IPMI agent`|OVERALL_DIMM_STATUS<p>Update: 3600</p>|
|Overall LED_TEMP_STATUS|<p>-</p>|`IPMI agent`|LED_TEMP_STATUS<p>Update: 3600</p>|
|LED_FAN4_FAULT|<p>-</p>|`IPMI agent`|LED_FAN4_FAULT<p>Update: 3600</p>|
|LED_FAN3_FAULT|<p>-</p>|`IPMI agent`|LED_FAN3_FAULT<p>Update: 3600</p>|
|Overall LED_PSU_STATUS|<p>-</p>|`IPMI agent`|LED_PSU_STATUS<p>Update: 3600</p>|
|DDR3_P1_D1_ECC|<p>-</p>|`IPMI agent`|DDR3_P1_D1_ECC<p>Update: 3600</p>|
|DDR3_P2_H1_ECC|<p>-</p>|`IPMI agent`|DDR3_P2_H1_ECC<p>Update: 3600</p>|
|DDR3_P1_C2_ECC|<p>-</p>|`IPMI agent`|DDR3_P1_C2_ECC<p>Update: 3600</p>|
|LED_FAN5_FAULT|<p>-</p>|`IPMI agent`|LED_FAN5_FAULT<p>Update: 3600</p>|
|DDR3_P2_E1_ECC|<p>-</p>|`IPMI agent`|DDR3_P2_E1_ECC<p>Update: 3600</p>|
|HDD8_STATUS|<p>-</p>|`IPMI agent`|HDD8_STATUS<p>Update: 3600</p>|
|DDR3_P1_B1_ECC|<p>-</p>|`IPMI agent`|DDR3_P1_B1_ECC<p>Update: 3600</p>|
|PSU2_STATUS|<p>-</p>|`IPMI agent`|PSU2_STATUS<p>Update: 3600</p>|
|Overall LED_HLTH_STATUS|<p>-</p>|`IPMI agent`|LED_HLTH_STATUS<p>Update: 50</p>|
|DDR3_P2_E2_ECC|<p>-</p>|`IPMI agent`|DDR3_P2_E2_ECC<p>Update: 3600</p>|
|P12V_STBY_V_MOIN|<p>-</p>|`IPMI agent`|P12V_STBY_V_MOIN<p>Update: 3600</p>|
|DDR3_P1_D2_ECC|<p>-</p>|`IPMI agent`|DDR3_P1_D2_ECC<p>Update: 3600</p>|
|PSU1_STATUS|<p>-</p>|`IPMI agent`|PSU1_STATUS<p>Update: 3600</p>|


## Triggers

There are no triggers in this template.

