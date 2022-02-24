# Octopus NET DD Bridge satelite mon

## Overview

Template for monitoring all 4 tuners on ddbridge Octopus Net.


Monitoring status:


SNR, lock


 


Graph:


SNR


 


Alarms:


SNR < 10 db


lock fail


 


If you have web authentification, you need to modify data item "tuners mon" and add HTTP authentification.



## Author

Aleksey Grabilenko

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Tuner 3 LOCK|<p>-</p>|`Dependent item`|tuner3_lock<p>Update: 0</p>|
|tuner 1 SNR|<p>-</p>|`Dependent item`|tuner1_snr<p>Update: 0</p>|
|tuners mon|<p>Collect all statistics from json on device</p>|`HTTP agent`|tuners_info<p>Update: 30s</p>|
|Tuner 1 LOCK|<p>-</p>|`Dependent item`|tuner1_lock<p>Update: 0</p>|
|tuner 3 SNR|<p>-</p>|`Dependent item`|tuner3_snr<p>Update: 0</p>|
|tuner 2 SNR|<p>-</p>|`Dependent item`|tuner2_snr<p>Update: 0</p>|
|Tuner 2 LOCK|<p>-</p>|`Dependent item`|tuner2_lock<p>Update: 0</p>|
|tuner 4 SNR|<p>-</p>|`Dependent item`|tuner4_snr<p>Update: 0</p>|
|Tuner 4 LOCK|<p>-</p>|`Dependent item`|tuner4_lock<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

