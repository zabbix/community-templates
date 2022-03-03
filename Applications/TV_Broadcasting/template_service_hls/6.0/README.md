# Service HLS

## Overview

This is beta version of HLS checker.


This template can discovery different streams (playlist in playlists file) and show next parameters:


There is presented ts file


Total lenght of ts file


Target duration of ts file


Duration of ts file


Spended time for download ts file


Average speed for download ts file


Not created: different paraneters of ts file from ffprobe. May be later.


 


You need install python2, m3u8 library and ffmpeg if you want:


apt install python python-m3u8 python-requests ffmpeg


 


1. Put script to /path\_to\_script/check\_hls


2. Give him executable flag by: 


chmod ugo+x check\_hls


3. Add userparameter into zabbix agent:


echo "UserParameter=hls[*], /usr/bin/python /path\_to\_script/check\_hls \$1 \$2" > /etc/zabbix/zabbix\_agentd.d/hls.conf


4. Import template into zabbix server


5. Apply template to host


6. Add macros {$HLSURI} = "http://yourdmain.local/playlist.m3u8"


 


If you have additions or comments you are welcome!



## Author

Kirill Savin

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$HLSURI}|<p>URI to m3u8</p>|``|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|m3u8 lists|<p>-</p>|`Zabbix agent`|hls["-d",{$HLSURI}]<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|HLS playlist $2|<p>-</p>|`Zabbix agent`|hls["-g",{#PROFILE}]<p>Update: 2m</p><p>LLD</p>|
|HLS average speed $1|<p>-</p>|`Dependent item`|hls.averagespeed[{#PROFILE}]<p>Update: 0</p><p>LLD</p>|
|HLS duration $1|<p>-</p>|`Dependent item`|hls.duration[{#PROFILE}]<p>Update: 0</p><p>LLD</p>|
|HLS spended time $1|<p>-</p>|`Dependent item`|hls.spendedtime[{#PROFILE}]<p>Update: 0</p><p>LLD</p>|
|HLS target duration $1|<p>-</p>|`Dependent item`|hls.target_duration[{#PROFILE}]<p>Update: 0</p><p>LLD</p>|
|HLS total legth $1|<p>-</p>|`Dependent item`|hls.totallength[{#PROFILE}]<p>Update: 0</p><p>LLD</p>|
|HLS ts present $1|<p>-</p>|`Dependent item`|hls.tsuri[{#PROFILE}]<p>Update: 0</p><p>LLD</p>|


## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|HLS duration is different on target duration in {#PROFILE}|<p>-</p>|<p>**Expression**: last(/Service HLS/hls.duration[{#PROFILE}]) < last(/Service HLS/hls.target_duration[{#PROFILE}]) or last(/Service HLS/hls.duration[{#PROFILE}]) > last(/Service HLS/hls.target_duration[{#PROFILE}])</p><p>**Recovery expression**: </p>|not classified|
|HLS duration is below 8 in {#PROFILE}|<p>-</p>|<p>**Expression**: last(/Service HLS/hls.duration[{#PROFILE}])<8</p><p>**Recovery expression**: </p>|warning|
|HLS spended time is more 200ms in {#PROFILE}|<p>-</p>|<p>**Expression**: last(/Service HLS/hls.spendedtime[{#PROFILE}])>200</p><p>**Recovery expression**: </p>|information|
|HLS there's unstable bitrate in {#PROFILE}|<p>-</p>|<p>**Expression**: last(/Service HLS/hls.totallength[{#PROFILE}]) < (avg(/Service HLS/hls.totallength[{#PROFILE}],5m) * 0.9)</p><p>**Recovery expression**: </p>|not classified|
|HLS TS isn't present in {#PROFILE}|<p>-</p>|<p>**Expression**: last(/Service HLS/hls.tsuri[{#PROFILE}])=0</p><p>**Recovery expression**: </p>|high|
|HLS duration is different on target duration in {#PROFILE} (LLD)|<p>-</p>|<p>**Expression**: last(/Service HLS/hls.duration[{#PROFILE}]) < last(/Service HLS/hls.target_duration[{#PROFILE}]) or last(/Service HLS/hls.duration[{#PROFILE}]) > last(/Service HLS/hls.target_duration[{#PROFILE}])</p><p>**Recovery expression**: </p>|not classified|
|HLS duration is below 8 in {#PROFILE} (LLD)|<p>-</p>|<p>**Expression**: last(/Service HLS/hls.duration[{#PROFILE}])<8</p><p>**Recovery expression**: </p>|warning|
|HLS spended time is more 200ms in {#PROFILE} (LLD)|<p>-</p>|<p>**Expression**: last(/Service HLS/hls.spendedtime[{#PROFILE}])>200</p><p>**Recovery expression**: </p>|information|
|HLS there's unstable bitrate in {#PROFILE} (LLD)|<p>-</p>|<p>**Expression**: last(/Service HLS/hls.totallength[{#PROFILE}]) < (avg(/Service HLS/hls.totallength[{#PROFILE}],5m) * 0.9)</p><p>**Recovery expression**: </p>|not classified|
|HLS TS isn't present in {#PROFILE} (LLD)|<p>-</p>|<p>**Expression**: last(/Service HLS/hls.tsuri[{#PROFILE}])=0</p><p>**Recovery expression**: </p>|high|
