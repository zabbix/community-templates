# Coronavirus - Covid19 Monitoring

## Description

Getting cases from worldometers.info and plotting on Zabbix

## Overview

**Gets statistics of COVID19 - CORONAVIRUS and presents to JSON and Zabbix**


Updated template and code to work with current worldometers.info results (as they changed slightly) and the old code was not working properly.


I forked the original repo from Rickk Barbosa and uploaded changes there, all the credits goes to him.


If you have any suggestion please do send your feedback to improve!



## Author

Christian Reizlein

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Covid19 - Selected Countries|<p>-</p>|`External check`|covid19_affectedcountries.py<p>Update: 1h</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Covid19 - Total of Active Cases|<p>-</p>|`Dependent item`|covid19.data[ActiveCases]<p>Update: 0</p>|
|Covid19 - Total Recovered|<p>-</p>|`Dependent item`|covid19.data[TotalRecovered]<p>Update: 0</p>|
|Covid19 - Total of Deaths|<p>-</p>|`Dependent item`|covid19.data[TotalDeaths]<p>Update: 0</p>|
|Covid19 - Total of New Deaths|<p>-</p>|`Dependent item`|covid19.data[NewDeaths]<p>Update: 0</p>|
|Covid19 - Total of Serious,Critical Cases|<p>-</p>|`Dependent item`|covid19.data[Serious]<p>Update: 0</p>|
|Covid19 Full Info|<p>-</p>|`External check`|covid19_status.py<p>Update: 60m</p>|
|Covid19 - Total  Cases per 1M habitants|<p>-</p>|`Dependent item`|covid19.data[CasesperMillion]<p>Update: 0</p>|
|Covid19 - Total Cases|<p>-</p>|`Dependent item`|covid19.data[TotalCases]<p>Update: 0</p>|
|Covid19 - Total of New Cases|<p>-</p>|`Dependent item`|covid19.data[NewCases]<p>Update: 0</p>|
|[ {#COUNTRY_NAME} | {#COUNTRY_IBAN} ] - TotalCases|<p>-</p>|`Calculated`|covid19.data["{#COUNTRY_NAME}", TotalCases]<p>Update: 30m</p><p>LLD</p>|
|[ {#COUNTRY_NAME} | {#COUNTRY_IBAN} ] - ActiveCases|<p>-</p>|`Dependent item`|covid19.data["{#COUNTRY_NAME}", ActiveCases]<p>Update: 0</p><p>LLD</p>|
|[ {#COUNTRY_NAME} | {#COUNTRY_IBAN} ] - Cases per Million habitants|<p>-</p>|`Dependent item`|covid19.data["{#COUNTRY_NAME}", CasesperMillion]<p>Update: 0</p><p>LLD</p>|
|[ {#COUNTRY_NAME} | {#COUNTRY_IBAN} ] - NewCases|<p>-</p>|`Dependent item`|covid19.data[ "{#COUNTRY_NAME}", NewCases]<p>Update: 0</p><p>LLD</p>|
|[ {#COUNTRY_NAME} | {#COUNTRY_IBAN} ] - NewDeaths|<p>-</p>|`Dependent item`|covid19.data["{#COUNTRY_NAME}", NewDeaths]<p>Update: 0</p><p>LLD</p>|
|[ {#COUNTRY_NAME} | {#COUNTRY_IBAN} ] - Serious,Critical|<p>-</p>|`Dependent item`|covid19.data["{#COUNTRY_NAME}", Serious]<p>Update: 0</p><p>LLD</p>|
|[ {#COUNTRY_NAME} | {#COUNTRY_IBAN} ] - TotalDeaths|<p>-</p>|`Dependent item`|covid19.data["{#COUNTRY_NAME}", TotalDeaths]<p>Update: 0</p><p>LLD</p>|
|[ {#COUNTRY_NAME} | {#COUNTRY_IBAN} ] - TotalRecovered|<p>-</p>|`Dependent item`|covid19.data["{#COUNTRY_NAME}", TotalRecovered]<p>Update: 0</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

