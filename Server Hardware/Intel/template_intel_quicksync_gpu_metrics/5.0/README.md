# Intel QuickSync GPU metrics

## Overview

There is template for monitoring (QuickSync)integrated video in Intel processors:


You can monitor theese parameters:


Multi-Format Codec Engine (also known as “MFX” or “VDBOX”); Video Encode (PAK) and Decode


2nd instance of the MultiFormat Codec Engine, if available (Examples of supported processor include 5th generation of Intel® Core™ processors with Intel® HD Graphics 6000, Intel® Iris™ Graphics 6100, Intel® Iris™ Pro Graphics 6200, Intel® Iris™ Pro Graphics P6300); Video Encode (PAK) and Decode


Video Quality Engine (also known as “VEBOX” or Video Quality enhancement pipeline) Deinterlace, Denoise


Render Engine (Execution units, media samplers, VME and their caches) Video Encode (ENC), OpenCL, Video Scaling, VPP Composition including frame rate conversion and image stabilization, VPP copy to CPU


GT Frequency


 


First of all, you need prepare utility for getting parameters.


You need build metrics\_monitor from repo: https://github.com/Intel-Media-SDK/MediaSDK


For correct working you may need add line 'run = 0;' at the end of 'while' in cttmetrics\_sample.cpp 


while(run)


...


 if (true == isFreq)


 printf("\tGT Freq: %4.2f", metric\_values[3]);


 


 printf("\n");


run = 0


}


 


Add rules to sudoers:


Defaults:zabbix !requiretty


zabbix ALL=(ALL) NOPASSWD: /opt/intel/mediasdk/tools/metrics\_monitor/\_bin/metrics\_monitor


 


And add needed userparameter in zabbix-agent:


UserParameter=gpu.metrics[*],sudo /opt/intel/mediasdk/tools/metrics\_monitor/\_bin/metrics\_monitor "$2" "$3" | sed 's/ usage://g' | sed 's/\t/\n/g' | sed 's/,//g' | sed 's/T F/T\_F/g' | grep "$1" | awk '{print $ 2}'


 



## Author

Kirill Savin

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|$1 usage|<p>Multi-Format Codec Engine (also known as “MFX” or “VDBOX”) Video Encode (PAK) and Decode</p>|`Zabbix agent`|gpu.metrics["VIDEO ",100,500]<p>Update: 30s</p>|
|$1 usage|<p>Video Quality Engine (also known as “VEBOX” or Video Quality enhancement pipeline) Deinterlace, Denoise</p>|`Zabbix agent`|gpu.metrics["VIDEO_E",100,500]<p>Update: 30s</p>|
|$1 usage|<p>2nd instance of the MultiFormat Codec Engine, if available (Examples of supported processor include 5th generation of Intel® Core™ processors with Intel® HD Graphics 6000, Intel® Iris™ Graphics 6100, Intel® Iris™ Pro Graphics 6200, Intel® Iris™ Pro Graphics P6300) Video Encode (PAK) and Decode</p>|`Zabbix agent`|gpu.metrics["VIDEO2",100,500]<p>Update: 30s</p>|
|$1 usage|<p>Render Engine (Execution units, media samplers, VME and their caches) Video Encode (ENC), OpenCL, Video Scaling, VPP Composition including frame rate conversion and image stabilization, VPP copy to CPU</p>|`Zabbix agent`|gpu.metrics["RENDER",100,500]<p>Update: 30s</p>|
|$1 usage|<p>GT Freq</p>|`Zabbix agent`|gpu.metrics["GT_Freq",100,500]<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

