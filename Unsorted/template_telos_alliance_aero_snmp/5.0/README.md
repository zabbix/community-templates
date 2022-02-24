# Aero-1000 SNMP

## Description

Template for monitoring Telos Allaince Aero devices over SNMP Capability in AERO.10/100/1000/2000/asi/soft Depends A1K-MIB.MIB.

## Overview

Template for monitoring Telos Allaince Aero devices over SNMP Capability in AERO.10/100/1000/2000/asi/soft


Depends A1K-MIB.MIB.


 


Tested on Aero-100 Software Version - 3.16.05



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Model name|<p>Model Name</p>|`SNMP agent`|aero.model-name<p>Update: 1h</p>|
|snmp-internal-link-sustained-failure|<p>SNMP service unable to communicate with Aero.1000 for an extended time. Failure is critical issue.</p>|`SNMP agent`|aero.snmp-internal-link-sustained-failure<p>Update: 1m</p>|
|Instance2-PGM1-outlm|<p>Instance 2 Program 1 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst2-pgm1-outlm<p>Update: 15s</p>|
|Instance6-PGM1c-outlm|<p>Instance 6 Program 1c loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst6-pgm1c-outlm<p>Update: 15s</p>|
|Instance1-PGM2r-outlm|<p>Instance 1 Program 2r loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst1-pgm2r-outlm<p>Update: 15s</p>|
|Instance3-PGM1-silence|<p>Instance 3 Program 1 silence.</p>|`SNMP agent`|aero.inst3-pgm1-silence<p>Update: 5s</p>|
|Instance8-PGM1c-silence|<p>Instance 8 Program 1c silence.</p>|`SNMP agent`|aero.inst8-pgm1c-silence<p>Update: 5s</p>|
|Instance6-PGM1b-silence|<p>Instance 6 Program 1b silence.</p>|`SNMP agent`|aero.inst6-pgm1b-silence<p>Update: 5s</p>|
|snmp-internal-link-status|<p>SNMP service currently linked to Aero.1000. This link goes down during upgrade and reconfiguration.</p>|`SNMP agent`|aero.snmp-internal-link-status<p>Update: 1m</p>|
|Instance3-PGM2r-outlm|<p>Instance 3 Program 2r loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst3-pgm2r-outlm<p>Update: 15s</p>|
|Instance1-PGM1-outlm|<p>Instance 1 Program 1 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst1-pgm1-outlm<p>Update: 15s</p>|
|Instance4-PGM2-silence|<p>Instance 4 Program 2 silence.</p>|`SNMP agent`|aero.inst4-pgm2-silence<p>Update: 5s</p>|
|Instance5-PGM2-outlm|<p>Instance 5 Program 2 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst5-pgm2-outlm<p>Update: 15s</p>|
|Instance7-PGM1-outlm|<p>Instance 7 Program 1 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst7-pgm1-outlm<p>Update: 15s</p>|
|Instance5-PGM2-outlm-alarm|<p>Instance 5 Program 2 loudness out of range.</p>|`SNMP agent`|aero.inst5-pgm2-outlm_alarm<p>Update: 15s</p>|
|Instance5-PGM1b-outlm|<p>Instance 5 Program 1b loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst5-pgm1b-outlm<p>Update: 15s</p>|
|Instance4-PGM1c-outlm|<p>Instance 4 Program 1c loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst4-pgm1c-outlm<p>Update: 15s</p>|
|Instance4-PGM3-silence|<p>Instance 4 Program 3 silence.</p>|`SNMP agent`|aero.inst4-pgm3-silence<p>Update: 5s</p>|
|RAM-depletion|<p>Sustained RAM status.</p>|`SNMP agent`|aero.ram-depletion<p>Update: 1m</p>|
|Instance4-PGM1b-outlm-alarm|<p>Instance 4 Program 1b silence.</p>|`SNMP agent`|aero.inst4-pgm1b-outlm_alarm<p>Update: 15s</p>|
|Engine-status|<p>Status of processing engine.</p>|`SNMP agent`|aero.engine-status<p>Update: 1m</p>|
|Instance6-PGM3-silence|<p>Instance 6 Program 3 silence.</p>|`SNMP agent`|aero.inst6-pgm3-silence<p>Update: 5s</p>|
|Instance3-PGM3-silence|<p>Instance 3 Program 3 silence.</p>|`SNMP agent`|aero.inst3-pgm3-silence<p>Update: 5s</p>|
|CPU-overload|<p>Sustained CPU overload status.</p>|`SNMP agent`|aero.cpu-overload<p>Update: 1m</p>|
|Instance4-PGM1b-outlm|<p>Instance 4 Program 1b loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst4-pgm1b-outlm<p>Update: 15s</p>|
|Instance5-PGM1-outlm-alarm|<p>Instance 5 Program 1 silence.</p>|`SNMP agent`|aero.inst5-pgm1-outlm_alarm<p>Update: 15s</p>|
|Instance8-PGM1c-outlm-alarm|<p>Instance 8 Program 1c silence.</p>|`SNMP agent`|aero.inst8-pgm1c-outlm_alarm<p>Update: 15s</p>|
|Instance7-PGM1c-outlm-alarm|<p>Instance 7 Program 1c silence.</p>|`SNMP agent`|aero.inst7-pgm1c-outlm_alarm<p>Update: 15s</p>|
|Instance6-PGM2-silence|<p>Instance 6 Program 2 silence.</p>|`SNMP agent`|aero.inst6-pgm2-silence<p>Update: 5s</p>|
|CPU-utilization|<p>Status of CPU utilization.</p>|`SNMP agent`|aero.cpu-utilization<p>Update: 1m</p>|
|Instance5-PGM1c-outlm-alarm|<p>Instance 5 Program 1c silence.</p>|`SNMP agent`|aero.inst5-pgm1c-outlm_alarm<p>Update: 15s</p>|
|Instance3-PGM1b-outlm-alarm|<p>Instance 3 Program 1b silence.</p>|`SNMP agent`|aero.inst3-pgm1b-outlm_alarm<p>Update: 15s</p>|
|Instance8-PGM1-silence|<p>Instance 8 Program 1 silence.</p>|`SNMP agent`|aero.inst8-pgm1-silence<p>Update: 5s</p>|
|Instance2-PGM1c-outlm-alarm|<p>Instance 2 Program 1c loudness out of range.</p>|`SNMP agent`|aero.inst2-pgm1c-outlm_alarm<p>Update: 15s</p>|
|Audio-Reference-status|<p>Audio reference status.</p>|`SNMP agent`|aero.audio-reference-status<p>Update: 1m</p>|
|Instance7-PGM2-outlm|<p>Instance 7 Program 2 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst7-pgm2-outlm<p>Update: 15s</p>|
|Instance2-PGM2r-outlm-alarm|<p>Instance 2 Program 2r loudness out of range.</p>|`SNMP agent`|aero.inst2-pgm2r-outlm_alarm<p>Update: 15s</p>|
|PSU-status|<p>Status of power supply redundancy.</p>|`SNMP agent`|aero.psu-status<p>Update: 1m</p>|
|Instance8-PGM3-outlm-alarm|<p>Instance 8 Program 3 loudness out of range.</p>|`SNMP agent`|aero.inst8-pgm3-outlm_alarm<p>Update: 15s</p>|
|Instance7-PGM1c-silence|<p>Instance 7 Program 1c silence.</p>|`SNMP agent`|aero.inst7-pgm1c-silence<p>Update: 5s</p>|
|Instance2-PGM1b-silence|<p>Instance 2 Program 1b silence.</p>|`SNMP agent`|aero.inst2-pgm1b-silence<p>Update: 5s</p>|
|Instance1-PGM1-outlm-alarm|<p>Instance 1 Program 1 silence.</p>|`SNMP agent`|aero.inst1-pgm1-outlm_alarm<p>Update: 15s</p>|
|Instance3-PGM1b-outlm|<p>Instance 3 Program 1b loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst3-pgm1b-outlm<p>Update: 15s</p>|
|Video-Input-status|<p>Video input status.</p>|`SNMP agent`|aero.video-input-status<p>Update: 1m</p>|
|Instance3-PGM1-outlm-alarm|<p>Instance 3 Program 1 silence.</p>|`SNMP agent`|aero.inst3-pgm1-outlm_alarm<p>Update: 15s</p>|
|Instance1-PGM1c-silence|<p>Instance 1 Program 1c silence.</p>|`SNMP agent`|aero.inst1-pgm1c-silence<p>Update: 5s</p>|
|Instance3-PGM1c-outlm-alarm|<p>Instance 3 Program 1c silence.</p>|`SNMP agent`|aero.inst3-pgm1c-outlm_alarm<p>Update: 15s</p>|
|Instance6-PGM2r-outlm|<p>Instance 6 Program 2r loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst6-pgm2r-outlm<p>Update: 15s</p>|
|Instance3-PGM1b-silence|<p>Instance 3 Program 1b silence.</p>|`SNMP agent`|aero.inst3-pgm1b-silence<p>Update: 5s</p>|
|Instance3-PGM2-outlm-alarm|<p>Instance 3 Program 2 loudness out of range.</p>|`SNMP agent`|aero.inst3-pgm2-outlm_alarm<p>Update: 15s</p>|
|Instance3-PGM1-outlm|<p>Instance 3 Program 3 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst3-pgm1-outlm<p>Update: 15s</p>|
|Instance5-PGM3-outlm-alarm|<p>Instance 5 Program 3 loudness out of range.</p>|`SNMP agent`|aero.inst5-pgm3-outlm_alarm<p>Update: 15s</p>|
|Instance3-PGM3-outlm-alarm|<p>Instance 3 Program 3 loudness out of range.</p>|`SNMP agent`|aero.inst3-pgm3-outlm_alarm<p>Update: 15s</p>|
|Instance7-PGM3-outlm|<p>Instance 7 Program 3 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst7-pgm3-outlm<p>Update: 15s</p>|
|Instance5-PGM2-silence|<p>Instance 5 Program 2 silence.</p>|`SNMP agent`|aero.inst5-pgm2-silence<p>Update: 5s</p>|
|Instance4-PGM2r-outlm-alarm|<p>Instance 4 Program 2r loudness out of range.</p>|`SNMP agent`|aero.inst4-pgm2r-outlm_alarm<p>Update: 15s</p>|
|Instance3-PGM2r-outlm-alarm|<p>Instance 3 Program 2r loudness out of range.</p>|`SNMP agent`|aero.inst3-pgm2r-outlm_alarm<p>Update: 15s</p>|
|CPU-hot|<p>CPU overheat condition.</p>|`SNMP agent`|aero.cpu-hot<p>Update: 1m</p>|
|Instance2-PGM2r-outlm|<p>Instance 2 Program 2r loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst2-pgm2r-outlm<p>Update: 15s</p>|
|Instance5-PGM1-silence|<p>Instance 5 Program 1 silence.</p>|`SNMP agent`|aero.inst5-pgm1-silence<p>Update: 5s</p>|
|Instance3-PGM1c-silence|<p>Instance 3 Program 1c silence.</p>|`SNMP agent`|aero.inst3-pgm1c-silence<p>Update: 5s</p>|
|Instance6-PGM1b-outlm|<p>Instance 6 Program 1b loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst6-pgm1b-outlm<p>Update: 15s</p>|
|Instance8-PGM3-silence|<p>Instance 8 Program 3 silence.</p>|`SNMP agent`|aero.inst8-pgm3-silence<p>Update: 5s</p>|
|Instance2-PGM3-silence|<p>Instance 2 Program 3 silence.</p>|`SNMP agent`|aero.inst2-pgm3-silence<p>Update: 5s</p>|
|Instance5-PGM1b-silence|<p>Instance 5 Program 1b silence.</p>|`SNMP agent`|aero.inst5-pgm1b-silence<p>Update: 5s</p>|
|Instance1-PGM2-silence|<p>Instance 1 Program 2 silence.</p>|`SNMP agent`|aero.inst1-pgm2-silence<p>Update: 5s</p>|
|Instance8-PGM2-silence|<p>Instance 8 Program 2 silence.</p>|`SNMP agent`|aero.inst8-pgm2-silence<p>Update: 5s</p>|
|Instance5-PGM1c-silence|<p>Instance 5 Program 1c silence.</p>|`SNMP agent`|aero.inst5-pgm1c-silence<p>Update: 5s</p>|
|Chassis-hot|<p>Chassis overheat condition.</p>|`SNMP agent`|aero.chassis-hot<p>Update: 1m</p>|
|Instance1-PGM1b-silence|<p>Instance 1 Program 1b silence.</p>|`SNMP agent`|aero.inst1-pgm1b-silence<p>Update: 5s</p>|
|Instance8-PGM2r-outlm-alarm|<p>Instance 8 Program 2r loudness out of range.</p>|`SNMP agent`|aero.inst8-pgm2r-outlm_alarm<p>Update: 15s</p>|
|Instance8-PGM2r-outlm|<p>Instance 8 Program 2r loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst8-pgm2r-outlm<p>Update: 15s</p>|
|Instance1-PGM2-outlm-alarm|<p>Instance 1 Program 2 loudness out of range.</p>|`SNMP agent`|aero.inst1-pgm2-outlm_alarm<p>Update: 15s</p>|
|Instance7-PGM2-silence|<p>Instance 7 Program 2 silence.</p>|`SNMP agent`|aero.inst7-pgm2-silence<p>Update: 5s</p>|
|Instance6-PGM2-outlm|<p>Instance 6 Program 2 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst6-pgm2-outlm<p>Update: 15s</p>|
|Instance2-PGM2-outlm|<p>Instance 2 Program 2 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst2-pgm2-outlm<p>Update: 15s</p>|
|Instance3-PGM2r-silence|<p>Instance 3 Program 2r silence.</p>|`SNMP agent`|aero.inst3-pgm2r-silence<p>Update: 5s</p>|
|Instance6-PGM3-outlm|<p>Instance 6 Program 3 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst6-pgm3-outlm<p>Update: 15s</p>|
|Instance2-PGM3-outlm-alarm|<p>Instance 2 Program 3 loudness out of range.</p>|`SNMP agent`|aero.inst2-pgm3-outlm_alarm<p>Update: 15s</p>|
|Instance1-PGM1c-outlm-alarm|<p>Instance 1 Program 1c silence.</p>|`SNMP agent`|aero.inst1-pgm1c-outlm_alarm<p>Update: 15s</p>|
|Instance7-PGM1c-outlm|<p>Instance 7 Program 1c loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst7-pgm1c-outlm<p>Update: 15s</p>|
|Instance7-PGM3-outlm-alarm|<p>Instance 7 Program 3 loudness out of range.</p>|`SNMP agent`|aero.inst7-pgm3-outlm_alarm<p>Update: 15s</p>|
|Instance4-PGM1c-outlm-alarm|<p>Instance 4 Program 1c silence.</p>|`SNMP agent`|aero.inst4-pgm1c-outlm_alarm<p>Update: 15s</p>|
|Instance1-PGM3-outlm-alarm|<p>Instance 1 Program 3 loudness out of range.</p>|`SNMP agent`|aero.inst1-pgm3-outlm_alarm<p>Update: 15s</p>|
|Instance2-PGM3-outlm|<p>Instance 2 Program 3 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst2-pgm3-outlm<p>Update: 15s</p>|
|Instance5-PGM2r-outlm-alarm|<p>Instance 5 Program 2r loudness out of range.</p>|`SNMP agent`|aero.inst5-pgm2r-outlm_alarm<p>Update: 15s</p>|
|Instance1-PGM2r-silence|<p>Instance 1 Program 2r silence.</p>|`SNMP agent`|aero.inst1-pgm2r-silence<p>Update: 5s</p>|
|Instance6-PGM2r-silence|<p>Instance 6 Program 2r silence.</p>|`SNMP agent`|aero.inst6-pgm2r-silence<p>Update: 5s</p>|
|Instance4-PGM2r-outlm|<p>Instance 4 Program 2r loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst4-pgm2r-outlm<p>Update: 15s</p>|
|Instance8-PGM2-outlm|<p>Instance 8 Program 2 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst8-pgm2-outlm<p>Update: 15s</p>|
|Instance6-PGM1b-outlm-alarm|<p>Instance 6 Program 1b silence.</p>|`SNMP agent`|aero.inst6-pgm1b-outlm_alarm<p>Update: 15s</p>|
|Instance4-PGM3-outlm|<p>Instance 4 Program 3 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst4-pgm3-outlm<p>Update: 15s</p>|
|Instance5-PGM2r-outlm|<p>Instance 5 Program 2r loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst5-pgm2r-outlm<p>Update: 15s</p>|
|Instance2-PGM1c-outlm|<p>Instance 2 Program 1c loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst2-pgm1c-outlm<p>Update: 15s</p>|
|Instance4-PGM1-outlm|<p>Instance 4 Program 1 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst4-pgm1-outlm<p>Update: 15s</p>|
|Instance4-PGM1b-silence|<p>Instance 4 Program 1b silence.</p>|`SNMP agent`|aero.inst4-pgm1b-silence<p>Update: 5s</p>|
|Instance6-PGM1c-silence|<p>Instance 6 Program 1c silence.</p>|`SNMP agent`|aero.inst6-pgm1c-silence<p>Update: 5s</p>|
|Instance8-PGM1-outlm-alarm|<p>Instance 8 Program 1 silence.</p>|`SNMP agent`|aero.inst8-pgm1-outlm_alarm<p>Update: 15s</p>|
|Instance8-PGM3-outlm|<p>Instance 8 Program 3 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst8-pgm3-outlm<p>Update: 15s</p>|
|Instance4-PGM1-outlm-alarm|<p>Instance 4 Program 1 silence.</p>|`SNMP agent`|aero.inst4-pgm1-outlm_alarm<p>Update: 15s</p>|
|Instance5-PGM1b-outlm-alarm|<p>Instance 5 Program 1b silence.</p>|`SNMP agent`|aero.inst5-pgm1b-outlm_alarm<p>Update: 15s</p>|
|Instance1-PGM2-outlm|<p>Instance 1 Program 2 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst1-pgm2-outlm<p>Update: 15s</p>|
|Instance4-PGM2r-silence|<p>Instance 4 Program 2r silence.</p>|`SNMP agent`|aero.inst4-pgm2r-silence<p>Update: 5s</p>|
|Instance7-PGM1b-outlm-alarm|<p>Instance 7 Program 1b silence.</p>|`SNMP agent`|aero.inst7-pgm1b-outlm_alarm<p>Update: 15s</p>|
|Instance5-PGM3-silence|<p>Instance 5 Program 3 silence.</p>|`SNMP agent`|aero.inst5-pgm3-silence<p>Update: 5s</p>|
|Instance5-PGM1c-outlm|<p>Instance 5 Program 1c loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst5-pgm1c-outlm<p>Update: 15s</p>|
|Instance1-PGM1-silence|<p>Instance 1 Program 1 silence.</p>|`SNMP agent`|aero.inst1-pgm1-silence<p>Update: 5s</p>|
|CN2000-status|<p>CN2000 status.</p>|`SNMP agent`|aero.cn2000-status<p>Update: 1m</p>|
|CPU-Fan-status|<p>CPU fan status.</p>|`SNMP agent`|aero.cpu-fan-status<p>Update: 1m</p>|
|Instance8-PGM1c-outlm|<p>Instance 8 Program 1c loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst8-pgm1c-outlm<p>Update: 15s</p>|
|Instance8-PGM1b-outlm-alarm|<p>Instance 8 Program 1b silence.</p>|`SNMP agent`|aero.inst8-pgm1b-outlm_alarm<p>Update: 15s</p>|
|Instance7-PGM2r-outlm|<p>Instance 7 Program 2r loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst7-pgm2r-outlm<p>Update: 15s</p>|
|Instance5-PGM1-outlm|<p>Instance 5 Program 1 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst5-pgm1-outlm<p>Update: 15s</p>|
|Instance7-PGM2r-outlm-alarm|<p>Instance 7 Program 2r loudness out of range.</p>|`SNMP agent`|aero.inst7-pgm2r-outlm_alarm<p>Update: 15s</p>|
|Instance2-PGM1b-outlm-alarm|<p>Instance 2 Program 1b loudness out of range.</p>|`SNMP agent`|aero.inst2-pgm1b-outlm_alarm<p>Update: 15s</p>|
|Instance7-PGM1-silence|<p>Instance 7 Program 1 silence.</p>|`SNMP agent`|aero.inst7-pgm1-silence<p>Update: 5s</p>|
|Instance4-PGM3-outlm-alarm|<p>Instance 4 Program 3 loudness out of range.</p>|`SNMP agent`|aero.inst4-pgm3-outlm_alarm<p>Update: 15s</p>|
|Instance3-PGM2-silence|<p>Instance 3 Program 2 silence.</p>|`SNMP agent`|aero.inst3-pgm2-silence<p>Update: 5s</p>|
|Instance6-PGM2r-outlm-alarm|<p>Instance 6 Program 2r loudness out of range.</p>|`SNMP agent`|aero.inst6-pgm2r-outlm_alarm<p>Update: 15s</p>|
|Instance5-PGM2r-silence|<p>Instance 5 Program 2r silence.</p>|`SNMP agent`|aero.inst5-pgm2r-silence<p>Update: 5s</p>|
|Instance1-PGM3-outlm|<p>Instance 1 Program 3 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst1-pgm3-outlm<p>Update: 15s</p>|
|Instance8-PGM2-outlm-alarm|<p>Instance 8 Program 2 loudness out of range.</p>|`SNMP agent`|aero.inst8-pgm2-outlm_alarm<p>Update: 15s</p>|
|Instance6-PGM1-outlm|<p>Instance 6 Program 1 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst6-pgm1-outlm<p>Update: 15s</p>|
|RAM-available|<p>Amount of RAM available (MB).</p>|`SNMP agent`|aero.ram-available<p>Update: 1m</p>|
|Instance2-PGM1-outlm-alarm|<p>Instance 2 Program 1 loudness out of range.</p>|`SNMP agent`|aero.inst2-pgm1-outlm_alarm<p>Update: 15s</p>|
|Instance6-PGM1-outlm-alarm|<p>Instance 6 Program 1 silence.</p>|`SNMP agent`|aero.inst6-pgm1-outlm_alarm<p>Update: 15s</p>|
|Instance2-PGM2-silence|<p>Instance 2 Program 2 silence.</p>|`SNMP agent`|aero.inst2-pgm2-silence<p>Update: 5s</p>|
|Instance4-PGM1-silence|<p>Instance 4 Program 1 silence.</p>|`SNMP agent`|aero.inst4-pgm1-silence<p>Update: 5s</p>|
|Instance3-PGM1c-outlm|<p>Instance 3 Program 1c loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst3-pgm1c-outlm<p>Update: 15s</p>|
|Instance1-PGM3-silence|<p>Instance 1 Program 3 silence.</p>|`SNMP agent`|aero.inst1-pgm3-silence<p>Update: 5s</p>|
|Instance4-PGM2-outlm|<p>Instance 4 Program 2 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst4-pgm2-outlm<p>Update: 15s</p>|
|Instance7-PGM1b-silence|<p>Instance 7 Program 1b silence.</p>|`SNMP agent`|aero.inst7-pgm1b-silence<p>Update: 5s</p>|
|Instance1-PGM2r-outlm-alarm|<p>Instance 1 Program 2r loudness out of range.</p>|`SNMP agent`|aero.inst1-pgm2r-outlm_alarm<p>Update: 15s</p>|
|Instance7-PGM2r-silence|<p>Instance 7 Program 2r silence.</p>|`SNMP agent`|aero.inst7-pgm2r-silence<p>Update: 5s</p>|
|Instance1-PGM1c-outlm|<p>Instance 1 Program 1c loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst1-pgm1c-outlm<p>Update: 15s</p>|
|CPU-temperature|<p>CPU temperature (Celsius).</p>|`SNMP agent`|aero.cpu-temperature<p>Update: 1m</p>|
|Instance6-PGM1-silence|<p>Instance 6 Program 1 silence.</p>|`SNMP agent`|aero.inst6-pgm1-silence<p>Update: 5s</p>|
|Instance1-PGM1b-outlm-alarm|<p>Instance 1 Program 1b silence.</p>|`SNMP agent`|aero.inst1-pgm1b-outlm_alarm<p>Update: 15s</p>|
|Software version|<p>Device's software version.</p>|`SNMP agent`|aero.software-version<p>Update: 1h</p>|
|Instance8-PGM1-outlm|<p>Instance 8 Program 1 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst1-pgm1-outlm8<p>Update: 15s</p>|
|Instance7-PGM2-outlm-alarm|<p>Instance 7 Program 2 loudness out of range.</p>|`SNMP agent`|aero.inst7-pgm2-outlm_alarm<p>Update: 15s</p>|
|Instance2-PGM2-outlm-alarm|<p>Instance 2 Program 2 loudness out of range.</p>|`SNMP agent`|aero.inst2-pgm2-outlm_alarm<p>Update: 15s</p>|
|Instance1-PGM1b-outlm|<p>Instance 1 Program 1b loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst1-pgm1b-outlm<p>Update: 15s</p>|
|Instance3-PGM2-outlm|<p>Instance 3 Program 2 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst3-pgm2-outlm<p>Update: 15s</p>|
|Instance4-PGM1c-silence|<p>Instance 4 Program 1c silence.</p>|`SNMP agent`|aero.inst4-pgm1c-silence<p>Update: 5s</p>|
|Instance2-PGM2r-silence|<p>Instance 2 Program 2r silence.</p>|`SNMP agent`|aero.inst2-pgm2r-silence<p>Update: 5s</p>|
|Instance8-PGM1b-outlm|<p>Instance 8 Program 1b loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst8-pgm1b-outlm<p>Update: 15s</p>|
|Instance6-PGM2-outlm-alarm|<p>Instance 6 Program 2 loudness out of range.</p>|`SNMP agent`|aero.inst6-pgm2-outlm_alarm<p>Update: 15s</p>|
|Instance3-PGM3-outlm|<p>Instance 3 Program 3 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst3-pgm3-outlm<p>Update: 15s</p>|
|Instance7-PGM3-silence|<p>Instance 7 Program 3 silence.</p>|`SNMP agent`|aero.inst7-pgm3-silence<p>Update: 5s</p>|
|Instance5-PGM3-outlm|<p>Instance 5 Program 3 loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst5-pgm3-outlm<p>Update: 15s</p>|
|Instance2-PGM1-silence|<p>Instance 2 Program 1 silence.</p>|`SNMP agent`|aero.inst2-pgm1-silence<p>Update: 5s</p>|
|Instance4-PGM2-outlm-alarm|<p>Instance 4 Program 2 loudness out of range.</p>|`SNMP agent`|aero.inst4-pgm2-outlm_alarm<p>Update: 15s</p>|
|Firmware version|<p>Devices's fpga version.</p>|`SNMP agent`|aero.fpga-version<p>Update: 1h</p>|
|Instance2-PGM1c-silence|<p>Instance 2 Program 1c silence.</p>|`SNMP agent`|aero.inst2-pgm1c-silence<p>Update: 5s</p>|
|Instance8-PGM2r-silence|<p>Instance 8 Program 2r silence.</p>|`SNMP agent`|aero.inst8-pgm2r-silence<p>Update: 5s</p>|
|Audio-Input-status|<p>Audio input status.</p>|`SNMP agent`|aero.audio-input-status<p>Update: 1m</p>|
|Instance6-PGM1c-outlm-alarm|<p>Instance 6 Program 1c silence.</p>|`SNMP agent`|aero.inst6-pgm1c-outlm_alarm<p>Update: 15s</p>|
|Instance6-PGM3-outlm-alarm|<p>Instance 6 Program 3 loudness out of range.</p>|`SNMP agent`|aero.inst6-pgm3-outlm_alarm<p>Update: 15s</p>|
|Instance7-PGM1b-outlm|<p>Instance 7 Program 1b loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst7-pgm1b-outlm<p>Update: 15s</p>|
|Instance7-PGM1-outlm-alarm|<p>Instance 7 Program 1 silence.</p>|`SNMP agent`|aero.inst7-pgm1-outlm_alarm<p>Update: 15s</p>|
|Instance2-PGM1b-outlm|<p>Instance 2 Program 1b loudness dB LKFS / LUFS.</p>|`SNMP agent`|aero.inst2-pgm1b-outlm<p>Update: 15s</p>|
|Instance8-PGM1b-silence|<p>Instance 8 Program 1b silence.</p>|`SNMP agent`|aero.inst8-pgm1b-silence<p>Update: 5s</p>|
|CPU-Fan-speed|<p>CPU fan speed (RPM).</p>|`SNMP agent`|aero.cpu-fan-speed<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

