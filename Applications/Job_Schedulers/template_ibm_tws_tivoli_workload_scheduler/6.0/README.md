# IBM Tivoli Workload Scheduler Jobs - TWS

## Overview

Monitor TWS jobs parsing the application event.log as documented in [console-job-scheduling-events-format](https://www.ibm.com/docs/en/workload-automation/9.4.0?topic=console-job-scheduling-events-format)

Parsing the event.log is the most simple and common way to monitor the TWS Jobs status.

## Author

- Marco Ostaska
- Bruno Colobialle
- Thays Trindade

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$101_JOB_STATSU6}|(101) Job Abend with job status 6 (continue after recovery job)| ^101\s+\S+\s+\S+\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+6\s+\S+\s+\S+\s+\+++\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S\*|Text macro|
|{$101_JOB_STATUS1}|(101) Job Abend with job status 1 (stop)| ^101\s+\S+\s+\S+\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+1\s+\S+\s+\S+\s+\+++\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S\*|Text macro|
|{$101_JOB_STATUS2}|(101) Job Abend with job status 2 (stop after recovery job)| ^101\s+\S+\s+\S+\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+2\s+\S+\s+\S+\s+\+++\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S\*|Text macro|
|{$101_JOB_STATUS3}|(101) Job Abend with job status 3 (rerun)| ^101\s+\S+\s+\S+\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+3\s+\S+\s+\S+\s+\+++\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S\*|Text macro|
|{$101_JOB_STATUS4}|(101) Job Abend with job status 4 (rerunafter recovery job)| ^101\s+\S+\s+\S+\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+4\s+\S+\s+\S+\s+\+++\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S\*|Text macro|
|{$101_JOB_STATUS5}|(101) Job Abend with job status 5 (continue)| ^101\s+\S+\s+\S+\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+5\s+\S+\s+\S+\s+\+++\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S\*|Text macro|
|{$101_JOB_STATUS20}|(101) Job Abend with job status 20 (this is the run of the recovery job)| ^101\s+\S+\s+\S+\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+20\s+\S+\s+\S+\s+\+++\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S\*|Text macro|
|{$101_OUTPUT}|<schedule_name> (<schedule_ia>) <job_name>| \2 (\3) \1|Text macro|
|{$101_STATUS10}|(101) Job Abend with job status 10 (this is the rerun of the job)| ^101\s+\S+\s+\S+\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+10\s+\S+\s+\S+\s+\+++\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S\*|Text macro|
|{$102_JOB_FAILED}|(102)External Job is in Error status"| ^102\s+\S+\s+\S+\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S\*)|Text macro|
|{$102_OUTPUT}|<schedule_name> (<schedule_ia>) <job_name>| \2 (\3) \1|Text macro|
|{$105_JOB_SUSPENDED}|(105)Job suspended| ^105\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S\*)|Text macro|
|{$107_JOB_CANCEL}|(107) Job was canceled| ^107\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S\*)|Text macro|
|{$111_JOB_CANT}|(111) Job failed to start| ^111\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S++)\s+\+++\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S\*)|Text macro|
|{$111_OUTPUT}|<schedule_name>(<schedule_ia>).<job_name> failed to start on CPU <job_cpu> - Reason: <tws_msg>| \4(\5).\1 failed to start on CPU \2 - Reason: \3|Text macro|
|{$115_JOB_STUCK}|(115) is in Stuck status| ^115\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S\*)|Text macro|
|{$115_OUTPUT}|<schedule_name>(<schedule_ia>).<job_name> on CPU <job_cpu>| \3(\4).\1 on CPU \2|Text macro|
|{$120_JOB_LATE}|(120) Job is late| ^120\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S\*|Text macro|
|{$120_OUTPUT}|<schedule_name> (<schedule_ia>) <job_name> is late on CPU <job_cpu>| \3 (\4) \1 is late on CPU \2|Text macro|
|{$121_JOB_UNTIL_CONT}|(121) Job until(continue) expired| ^121\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S\*|Text macro|
|{$121_OUTPUT}|<schedule_name>(<schedule_ia>).<job_name>: <job_cpu>| \3(\4).\1: \2|Text macro|
|{$122_JOB_UNTIL_CANC}|(122) Job until(cancel) expired| ^122\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S\*|Text macro|
|{$122_OUTPUT}|<schedule_name> (<schedule_ia>) <job_name> until(cancel) expired on CPU <job_cpu>| \3 (\4) \1 until(cancel) expired on CPU \2|Text macro|
|{$151_OUTPUT}|<schedule_name> (<schedule_ia>)| \1(\2)|Text macro|
|{$151_SCHEDULE_ABEND}|(151) Schedule %s(%s) has failed| ^151\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S\*)|Text macro|
|{$152_OUTPUT}|Schedule <schedule_name> (<schedule_ia>) is stuck| Schedule \1 (\2) is stuck|Text macro|
|{$152_SCHEDULE_STUCK}|(152) Schedule is stuck| ^152\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S\*)|Text macro|
|{$155_OUTPUT}|Schedule <schedule_name> (<schedule_ia>) suspended| Schedule \1 (\2) suspended|Text macro|
|{$155_SCHEDULE_SUSP}|(155) Schedule suspended| ^153\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S\*)|Text macro|
|{$157_SCHEDULE_CANCEL}|(157) Schedule was canceled| ^157\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S\*)|Text macro|
|{$162_OUTPUT}|<property_number> of Schedule <schedule_name> (<schedule_ia>) changed to <property_value>| \1 of Schedule\3(\4) changed to \2|Text macro|
|{$162_SCHEDULE_MODIFY}|(162) Property of Schedule changed| ^162\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S\*)|Text macro|
|{$163_OUTPUT}|Schedule <schedule_name> (<schedule_ia>) is late| Schedule \1 (\2) is late|Text macro|
|{$163_SCHEDULE_LATE}|(163) Schedule is late| ^163\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S\*|Text macro|
|{$164_OUTPUT}|Schedule <schedule_name> (<schedule_ia>) until(continue) expired| Schedule \1 (\2) until(continue) expired|Text macro|
|{$164_SCHEDULE_UNTIL_CONT}|(164) Schedule until(continue) expired| ^164\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S\*|Text macro|
|{$165_OUTPUT}|<schedule_name> (<schedule_ia>)| \1 (\2)|Text macro|
|{$165_SCHEDULE_UNTIL_CANC}|(165) Schedule until(cancel) expired| ^165\s+\S+\s+\S+\s+\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)\s+\S\*|Text macro|
|{$251_LINK_DROPPED_STATE1}|(251) Comm unlinked - state 1(for unknown reason)| ^251\s+(\S+)\s+1\s\*\S\*|Text macro|
|{$251_LINK_DROPPED_STATE3}|(251) Comm link - state 3(down due to an error)| ^251\s+(\S+)\s+3\s\*\S\*|Text macro|
|{$251_OUTPUT}|<to_cpu>| \1|Text macro|
|{$252_LINK_FAILED_STATE1}|(252) Comm link - state 1(down for unknown reason)| ^252\s+(\S+)\s+1\s\*\S\*|Text macro|
|{$252_LINK_FAILED_STATE3}|(252) Comm link - state 3(down due to error)| ^252\s+(\S+)\s+3\s\*\S\*|Text macro|
|{$252_OUTPUT}|<to_cpu>| \1|Text macro|
|{$TWS_EVENT_LOG}|TWS even.log file to be monitored| /appl/maestro/IBM/wa/TWSDATA/event.log|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|101_job_abend_satus6| (101) Job Abend with with recovery status 6(succ)| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$101_JOB_STATSU6},,,skip,{$101_OUTPUT}] |
|101_job_abend_status1| (101) Job Abend with recovery status 1 (stop)| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$101_JOB_STATUS1},,,skip,{$101_OUTPUT}] |
|101_job_abend_status2| (101) Job Abend with recovery status 2 (stop after recovery job)| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$101_JOB_STATUS2},,,skip,{$101_OUTPUT}] |
|101_job_abend_status3| (101) Job Abend with recovery status 3(rerun)| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$101_JOB_STATUS3},,,skip,{$101_OUTPUT}] |
|101_job_abend_status4| (101) Job Abend with recovery status 4 (rerun after the recovery job)| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$101_JOB_STATUS4},,,skip,{$101_OUTPUT}] |
|101_job_abend_status5| (101) Job Abend with recovery status 5 (continue)| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$101_JOB_STATUS5},,,skip,{$101_OUTPUT}] |
|101_job_abend_status20| (101) Job Abend with recovery status 20 (this is the run of the recovery job)| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$101_JOB_STATUS20},,,skip,{$101_OUTPUT}] |
|101_job_abend_status10| (101) Job Abend with recovery status 10 (this is the rerun of the job)| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$101_STATUS10},,,skip,{$101_OUTPUT}] |
|102_job_failed| (102) Job Failed| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$102_JOB_FAILED},,,skip,{$102_OUTPUT}] |
|111_job_cant| (111) Job failed to start| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$111_JOB_CANT},,,skip,{$111_OUTPUT}] |
|115_in_stuck| (115) Job is in Stuck status| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$115_JOB_STUCK},,,skip,{$115_OUTPUT}] |
|120_job_late| (120) Job is late| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$120_JOB_LATE},,,skip,{$120_OUTPUT}] |
|121_job_until_cont| (121) Job until(continue) expired| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$121_JOB_UNTIL_CONT},,,skip,{$121_OUTPUT}] |
|122_job_until_canc| (122) Job until(cancel) expired| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$122_JOB_UNTIL_CANC},,,skip,{$122_OUTPUT}] |
|151_schedule_abend| (151) Schedule has failed| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$151_SCHEDULE_ABEND},,,skip,{$151_OUTPUT}] |
|152_schedule_stuck| (152) Schedule is stuck.| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$152_SCHEDULE_STUCK},,,skip,{$152_OUTPUT}] |
|155_schedule_susp| (155) Schedule is suspended.| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$155_SCHEDULE_SUSP},,,skip,{$155_OUTPUT}] |
|162_schedule_modify| (162) Property Schedule changed| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$162_SCHEDULE_MODIFY},,,skip,{$162_OUTPUT}] |
|163_schedule_late| (163) Schedule is late.| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$163_SCHEDULE_LATE},,,skip,{$163_OUTPUT}] |
|164_schedule_until_cont| (164) Schedule until(continue) expired.| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$164_SCHEDULE_UNTIL_CONT},,,skip,{$164_OUTPUT}] |
|165_schedule_until_canc| (165) Schedule until(cancel) expired| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$165_SCHEDULE_UNTIL_CANC},,,skip,{$165_OUTPUT}] |
|251_link_dropped_state1| (251) Comm unlinked - state 1(for unknown reason)| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$251_LINK_DROPPED_STATE1},,,skip,{$251_OUTPUT}] |
|251_link_dropped_state3| (251) Comm link - state 3(down due to an error)| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$251_LINK_DROPPED_STATE3},,,skip,{$251_OUTPUT}] |
|252_link_failed_state1| (252) Comm link - state 1(down for unknown reason)| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$252_LINK_FAILED_STATE1},,,skip,{$252_OUTPUT}] |
|252_link_failed_state3| (252) Comm link - state 3(down due to error)| ZABBIX_ACTIVE| log[{$TWS_EVENT_LOG},{$252_LINK_FAILED_STATE3},,,skip,{$252_OUTPUT}] |

## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----|----|
|101_job_abend_satus6| (101) Job Abend with with recovery status 6(succ)| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$101_JOB_STATSU6},,,skip,{$101_OUTPUT}])=1| HIGH |
|101_job_abend_status1| (101) Job Abend with recovery status 1 (stop)| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$101_JOB_STATUS1},,,skip,{$101_OUTPUT}])=1| AVERAGE |
|101_job_abend_status2| (101) Job Abend with recovery status 2 (stop after recovery job)| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$101_JOB_STATUS2},,,skip,{$101_OUTPUT}])=1| HIGH |
|101_job_abend_status3| (101) Job Abend with recovery status 3(rerun)| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$101_JOB_STATUS3},,,skip,{$101_OUTPUT}])=1| INFO |
|101_job_abend_status4| (101) Job Abend with recovery status 4 (rerun after the recovery job)| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$101_JOB_STATUS4},,,skip,{$101_OUTPUT}])=1| INFO |
|101_job_abend_status5| (101) Job Abend with recovery status 5 (continue)| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$101_JOB_STATUS5},,,skip,{$101_OUTPUT}])=1| HIGH |
|101_job_abend_status20| (101) Job Abend with recovery status 20 (this is the run of the recovery job)| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$101_JOB_STATUS20},,,skip,{$101_OUTPUT}])=1| WARNING |
|101_job_abend_status10| (101) Job Abend with recovery status 10 (this is the rerun of the job)| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$101_STATUS10},,,skip,{$101_OUTPUT}])=1| WARNING |
|102_job_failed| (102) Job Failed| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$102_JOB_FAILED},,,skip,{$102_OUTPUT}])=1| HIGH |
|111_job_cant| (111) Job failed to start| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$111_JOB_CANT},,,skip,{$111_OUTPUT}])=1| HIGH |
|115_in_stuck| (115) Job is in Stuck status| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$115_JOB_STUCK},,,skip,{$115_OUTPUT}])=1| WARNING |
|120_job_late| (120) Job is late| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$120_JOB_LATE},,,skip,{$120_OUTPUT}])=1| WARNING |
|121_job_until_cont| (121) Job until(continue) expired| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$121_JOB_UNTIL_CONT},,,skip,{$121_OUTPUT}])=1| WARNING |
|122_job_until_canc| (122) Job until(cancel) expired| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$122_JOB_UNTIL_CANC},,,skip,{$122_OUTPUT}])=1| WARNING |
|151_schedule_abend| (151) Schedule has failed| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$151_SCHEDULE_ABEND},,,skip,{$151_OUTPUT}])=1| HIGH |
|152_schedule_stuck| (152) Schedule is stuck.| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$152_SCHEDULE_STUCK},,,skip,{$152_OUTPUT}])=1| HIGH |
|155_schedule_susp| (155) Schedule is suspended.| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$155_SCHEDULE_SUSP},,,skip,{$155_OUTPUT}])=1| WARNING |
|162_schedule_modify| (162) Property Schedule changed| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$162_SCHEDULE_MODIFY},,,skip,{$162_OUTPUT}])=1| WARNING |
|163_schedule_late| (163) Schedule is late.| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$163_SCHEDULE_LATE},,,skip,{$163_OUTPUT}])=1| WARNING |
|164_schedule_until_cont| (164) Schedule until(continue) expired| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$164_SCHEDULE_UNTIL_CONT},,,skip,{$164_OUTPUT}])=1| WARNING |
|165_schedule_until_canc| (165) Schedule until(cancel) expired| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$165_SCHEDULE_UNTIL_CANC},,,skip,{$165_OUTPUT}])=1| WARNING |
|251_link_dropped_state1| (251) Comm unlinked - state 1(for unknown reason)| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$251_LINK_DROPPED_STATE1},,,skip,{$251_OUTPUT}])=1| WARNING |
|251_link_dropped_state3| (251) Comm link - state 3(down due to an error)| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$251_LINK_DROPPED_STATE3},,,skip,{$251_OUTPUT}])=1| WARNING |
|252_link_failed_state1| (252) Comm link - state 1(down for unknown reason)| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$252_LINK_FAILED_STATE1},,,skip,{$252_OUTPUT}])=1| HIGH |
|252_link_failed_state3| (252) Comm link - state 3(down due to error)| find(/IBM Tivoli Workload Scheduler Jobs - TWS/log[{$TWS_EVENT_LOG},{$252_LINK_FAILED_STATE3},,,skip,{$252_OUTPUT}])=1| HIGH |
