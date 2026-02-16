# FSP UPS ViewPower by USB

## Overview

This template monitors FSP UPS devices connected locally via USB using
ViewPower software.

Data is collected using a custom PowerShell script (`ups.ps1`) executed
through Zabbix Agent 2 UserParameters.

The template monitors:

-   Battery capacity\
-   Remaining runtime\
-   Input voltage\
-   Output voltage\
-   Load percentage\
-   Output frequency\
-   UPS temperature\
-   UPS mode (Line/Battery/etc.)

The USB port identifier is defined per-host using a macro.

------------------------------------------------------------------------

## Author

Jan Dvořák

------------------------------------------------------------------------

## Macros used

  -------------------------------------------------------------------------
  Name           Description               Default             Type
  -------------- ------------------------- ------------------- ------------
  {\$UPS.PORT}   USB port identifier from  USB388D857_P01      Text macro
                 ViewPower                                     
                 (e.g. USB388D857_P01)                         

  -------------------------------------------------------------------------

------------------------------------------------------------------------

## Template links

There are no template links in this template.

------------------------------------------------------------------------

## Items collected

  ----------------------------------------------------------------------------
  Name          Description       Type     Key and additional info
  ------------- ----------------- -------- -----------------------------------
  UPS Battery   Battery charge    Zabbix   ups.battery (Update: 30s)
  Capacity      level in %        agent    

  UPS Runtime   Remaining battery Zabbix   ups.runtime (Update: 30s)
                runtime in        agent    
                minutes                    

  UPS Input     Current input     Zabbix   ups.input (Update: 30s)
  Voltage       voltage           agent    

  UPS Output    Current output    Zabbix   ups.output (Update: 30s)
  Voltage       voltage           agent    

  UPS Load      Current load      Zabbix   ups.load (Update: 30s)
                percentage        agent    

  UPS Frequency Output frequency  Zabbix   ups.freq (Update: 30s)
                                  agent    

  UPS           UPS internal      Zabbix   ups.temp (Update: 30s)
  Temperature   temperature       agent    

  UPS Mode      Current UPS mode  Zabbix   ups.mode (Update: 30s)
                (Line mode /      agent    
                Battery mode)              
  ----------------------------------------------------------------------------

------------------------------------------------------------------------

## Triggers

  --------------------------------------------------------------------------------------------
  Name       Description           Expression                                Priority
  ---------- --------------------- ----------------------------------------- -----------------
  UPS        UPS is operating on   find(/Template UPS                        High
  running on battery (excluding    ViewPower/ups.mode,,"like","Battery")=1   
  battery    self-test if                                                    
             configured)                                                     

  Low        Battery level below   last(/Template UPS                        Warning
  battery    threshold             ViewPower/ups.battery)\<30                
  capacity                                                                   

  Critical   Battery level         last(/Template UPS                        High
  battery    critically low        ViewPower/ups.battery)\<15                
  capacity                                                                   
  --------------------------------------------------------------------------------------------

------------------------------------------------------------------------

## Requirements

-   Windows Server\
-   Zabbix Agent 2\
-   ViewPower software installed and running\
-   PowerShell script `C:\Scripts\ups.ps1`\
-   Increased item timeout (recommended ≥ 10 seconds)

------------------------------------------------------------------------

## Notes

-   Each host must define macro `{$UPS.PORT}` with its own USB ID.\
-   Script execution time is \~450 ms, but timeout must be increased to
    avoid unsupported items.\
-   Designed for one UPS per server.

## License

GNU General Public License v3.0
