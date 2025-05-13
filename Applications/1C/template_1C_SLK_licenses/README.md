# Monitoring SLK licenses for 1C service

## Overview

This template is intended for monitoring the service SLK licenses (https://licencecenter.ru/)

- Automatic detection and notification of failures of SLK licenses.

- Checking the availability of the web service.

## Author

Vadim Gurko <VA.Gurko@yandex.ru>

## Setup

Import the Template_App_1C_SLK_licenses.yaml template into your Zabbix instance (Configuration --> Templates --> Import), and apply the template to a host.

## Zabbix configuration

|Name|Description| Default     | Type         |
|----|-----------|-------------|--------------|
|{$LICENSE_SERVER}|<p>The IP address of the license server</p>| `127.0.0.1` | Text   |
|{$LICENSE_SERVER_PORT}|<p>The Port of the license server</p>| `9099`      | Text   |
|{$LICENSE_SERVER_USERNAME}|<p>Username</p>| `admin` | Text   |
|{$LICENSE_SERVER_PASSWORD}|<p>Password</p>| `admin` | Secret text |

## Template links

Information and plug-in are available here: https://github.com/VAGurko/zabbix-community-templates/tree/main/Applications/1C/template_1C_SLK_licenses

The procedure for making changes is described here: https://github.com/VAGurko/zabbix-community-templates/wiki/Порядок-внесения-изменений-в-шаблон

## Discovery rules

|Name| Description | Type          | Key and additional info                   |
|----|-------------|---------------|-------------------------------------------|
|Connections discovery| <p>-</p>    | `Dependent item` | DiscoveryListConnections<p>Update: 1h</p> |
|Licenses discovery| <p>-</p>    | `Dependent item` | DiscoveryListLicenses<p>Update: 1d</p>    |
|Sessions discovery| <p>-</p>    | `Dependent item` | DiscoveryListSessions<p>Update: 1d</p>    |


## Items collected

|Name| Description                                                             | Type             | Key and additional info                     |
|----|-------------------------------------------------------------------------|------------------|---------------------------------------------|
|License server data| <p>-</p>| `HTTP agent`     | LicenseServerData<p>Update: 1m</p>|
|License server data connections ID list| <p>-</p>| `HTTP agent`     | LicenseServerDataConnectionsIDs<p>Update: 1m</p>|
|License server data licences ID list| <p>-</p>| `HTTP agent`     | LicenseServerDataLicencesIDs<p>Update: 1m</p>|
|License server data serverinfo| <p>-</p>| `HTTP agent`     | LicenseServerDataServerinfo<p>Update: 1h</p>|
|License server data sessions ID list| <p>https://licencecenter.ru/downloads/licence/3.0/doc/%D0%A1%D0%9B%D0%9A3.0_%D0%92%D0%BD%D0%B5%D1%88%D0%BD%D0%B5%D0%B5_API_%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80%D0%B0_%D0%A1%D0%9B%D0%9A.pdf</p>| `HTTP agent`     | LicenseServerDataSessionsIDs<p>Update: 1m</p>|
|License server version| <p>-</p>| `Dependent item`     | LicenseServerVersion|
|Connections {#ID_CONN} Data| <p>-</p>| `HTTP agent`     | ConnectionsData[{#ID_CONN}]<p>Update: 1m</p> |
|Connections {#ID_CONN} ComputerName| <p>ComputerName</p>| `Dependent item` | ConnectionsComputerName[{#ID_CONN}]         |
|Connections {#ID_CONN} CPU| <p>Bit depth (i386 / x86_64)</p>| `Dependent item` | ConnectionsCPU[{#ID_CONN}]                  |
|Connections {#ID_CONN} Created| <p>Connection time</p>| `Dependent item` | ConnectionsCreated[{#ID_CONN}]              |
|Connections {#ID_CONN} Expired| <p>Indicates that the connection's lifetime has expired.</p>| `Dependent item` | ConnectionsExpired[{#ID_CONN}]              |
|Connections {#ID_CONN} ExpireTime| <p>The time when the connection lifetime expires</p>| `Dependent item` | ConnectionsExpireTime[{#ID_CONN}]           |
|Connections {#ID_CONN} ID| <p>Connection ID</p>| `Dependent item` | ConnectionsID[{#ID_CONN}]                   |
|Connections {#ID_CONN} IsServer| <p>A sign of the server process of the 1C:Enterprises</p>| `Dependent item` | ConnectionsIsServer[{#ID_CONN}]             |
|Connections {#ID_CONN} KeyID| <p>A series of keys</p>| `Dependent item` | ConnectionsKeyID[{#ID_CONN}]                |
|Connections {#ID_CONN} LastUsed| <p>Time of last request</p>| `Dependent item` | ConnectionsLastUsed[{#ID_CONN}]             |
|Connections {#ID_CONN} LocalIP| <p>Local IP addresses</p>| `Dependent item` | ConnectionsLocalIP[{#ID_CONN}]              |
|Connections {#ID_CONN} ModuleName| <p>Module Name components</p>| `Dependent item` | ConnectionsModuleName[{#ID_CONN}]           |
|Connections {#ID_CONN} OSVersion| <p>OS Version</p>| `Dependent item` | ConnectionsOSVersion[{#ID_CONN}]            |
|Connections {#ID_CONN} PeerIP| <p>IP address</p>| `Dependent item` | ConnectionsPeerIP[{#ID_CONN}]               |
|Connections {#ID_CONN} PID| <p>Process ID</p>| `Dependent item` | ConnectionsPID[{#ID_CONN}]                  |
|Connections {#ID_CONN} PlatformVersion| <p>Platform version</p>| `Dependent item` | ConnectionsPlatformVersion[{#ID_CONN}]      |
|Connections {#ID_CONN} Version| <p>Component version</p>| `Dependent item` | ConnectionsVersion[{#ID_CONN}]              |
|Key {#ID_KEY} Data| <p>-</p>| `HTTP agent`     | KeyData[{#ID_KEY}]<p>Update: 30m</p>        |
|Key {#ID_KEY} ActivationCode| <p>Activation code</p>| `Dependent item` |KeyActivationCode[{#ID_KEY}]|
|Key {#ID_KEY} ActivationDate| <p>Activation date</p>| `Dependent item` |KeyActivationDate[{#ID_KEY}]|
|Key {#ID_KEY} Article| <p>Article of the nomenclature</p>| `Dependent item` |KeyArticle[{#ID_KEY}]|
|Key {#ID_KEY} ArticleName| <p>Article name</p>| `Dependent item` |KeyArticleName[{#ID_KEY}]|
|Key {#ID_KEY} BlankKeyNo| <p>S/N of the hardware media, if the software key is installed on it</p> | `Dependent item` |KeyBlankKeyNo[{#ID_KEY}]|
|Key {#ID_KEY} DaysLeft| <p>Remaining validity period in days</p>| `Dependent item` |KeyDaysLeft[{#ID_KEY}]|
|Key {#ID_KEY} Enabled| <p>A common sign of accessibility</p>| `Dependent item` |KeyEnabled[{#ID_KEY}]|
|Key {#ID_KEY} Expired| <p>Indicates that the validity period has expired</p>| `Dependent item` |KeyExpired[{#ID_KEY}]|
|Key {#ID_KEY} ExpireDate| <p>Expiration date</p>| `Dependent item` |KeyExpireDate[{#ID_KEY}]|
|Key {#ID_KEY} FileName| <p>File Name</p>| `Dependent item` |KeyFileName[{#ID_KEY}]|
|Key {#ID_KEY} Flags| <p>Flags of functionality in binary form</p>| `Dependent item` |KeyFlags[{#ID_KEY}]|
|Key {#ID_KEY} IEC (KPP)| <p>KPP</p>| `Dependent item` |KeyIEC[{#ID_KEY}]|
|Key {#ID_KEY} IndustrySupportDate| <p>The start date of the ITS Industry service for this reg. number</p>| `Dependent item` |KeyIndustrySupportDate[{#ID_KEY}]|
|Key {#ID_KEY} IndustrySupportPeriod| <p>The validity period of the ITS Industry service in days</p>| `Dependent item` |KeyIndustrySupportPeriod[{#ID_KEY}]|
|Key {#ID_KEY} ITN (INN)| <p>INN</p>| `Dependent item` |KeyITN[{#ID_KEY}]|
|Key {#ID_KEY} KeyID| <p>Series</p>| `Dependent item` |KeyID[{#ID_KEY}]|
|Key {#ID_KEY} KeyNo| <p>Unique S/N</p>| `Dependent item` |KeyNo[{#ID_KEY}]|
|Key {#ID_KEY} KeyType| <p>Key type: 3 – Main, 4 – Additional, 5 – Demo</p>| `Dependent item` |KeyKeyType[{#ID_KEY}]|
|Key {#ID_KEY} LicenceCount| <p>Number of licenses</p>| `Dependent item` |KeyLicenceCount[{#ID_KEY}]|
|Key {#ID_KEY} OpenError| <p>Opening error, if any</p>| `Dependent item` |KeyOpenError[{#ID_KEY}]|
|Key {#ID_KEY} Period| <p>Validity period in days</p>| `Dependent item` |KeyPeriod[{#ID_KEY}]|
|Key {#ID_KEY} ProductName| <p>Product Name</p>| `Dependent item` |KeyProductName[{#ID_KEY}]|
|Key {#ID_KEY} ProductVersion| <p>Product Version</p>| `Dependent item` |KeyProductVersion[{#ID_KEY}]|
|Key {#ID_KEY} ProductVersionName| <p>The name of the version, if installed in the Center Licensing</p>| `Dependent item` |KeyProductVersionName[{#ID_KEY}]|
|Key {#ID_KEY} Recovered| <p>Indicates that the key was recovered by the recovery team.</p>| `Dependent item` |KeyRecovered[{#ID_KEY}]|
|Key {#ID_KEY} RegNo| <p>Registration number</p>| `Dependent item` |KeyRegNo[{#ID_KEY}]|
|Key {#ID_KEY} ServiceType| <p>The type of service when using the key in special 1C</p>| `Dependent item` |KeyServiceType[{#ID_KEY}]|
|Key {#ID_KEY} StartDate| <p>Start date of the action</p>| `Dependent item` |KeyStartDate[{#ID_KEY}]|
|Key {#ID_KEY} SupportDate| <p>The start date of the ITS agreement for this registration number</p>| `Dependent item` |KeySupportDate[{#ID_KEY}]|
|Key {#ID_KEY} Type| <p>Key type (Virtual – software, USB – hardware)</p>| `Dependent item` |KeyType[{#ID_KEY}]|
|Key {#ID_KEY} UpdateDate| <p>Date and time of the last update</p>| `Dependent item` |KeyUpdateDate[{#ID_KEY}]|
|Key {#ID_KEY} Version| <p>Version of the internal software or file format</p>| `Dependent item` |KeyVersion[{#ID_KEY}]|
|Key {#ID_KEY} Workable| <p>Indicates that the device is working properly, returns false if the device is defective or the computer ID has changed.</p>| `Dependent item` |KeyWorkable[{#ID_KEY}]|
|Session {#ID_SES} Data| <p>-</p>| `HTTP agent`     | SessionData[{#ID_SES}]<p>Update: 1m</p>|
|Session {#ID_SES} AccessCode| <p>Access code</p>| `Dependent item` |SessionAccessCode[{#ID_SES}]|
|Session {#ID_SES} AppName| <p>Information Database application</p>| `Dependent item` |SessionAppName[{#ID_SES}]|
|Session {#ID_SES} ComputerName| <p>Computer name of the information database</p>| `Dependent item` |SessionComputerName[{#ID_SES}]|
|Session {#ID_SES} Expired| <p>Indicates that the session lifetime has expired.</p>| `Dependent item` |SessionExpired[{#ID_SES}]|
|Session {#ID_SES} ExpireTime| <p>The time when the session lifetime expires</p>| `Dependent item` |SessionExpireTime[{#ID_SES}]|
|Session {#ID_SES} ID| <p>Session ID</p>| `Dependent item` |SessionID[{#ID_SES}]|
|Session {#ID_SES} InfoBaseConnectionStr| <p>Connection String of the information database</p>| `Dependent item` |SessionInfoBaseConnectionStr[{#ID_SES}]|
|Session {#ID_SES} IsServer| <p>Server session flag</p>| `Dependent item` |SessionIsServer[{#ID_SES}]|
|Session {#ID_SES} KeyID| <p>A series of keys</p>| `Dependent item` |SessionKeyID[{#ID_SES}]|
|Session {#ID_SES} SessionConnection| <p>ID of the connection that created the session</p>| `Dependent item` |SessionSessionConnection[{#ID_SES}]|
|Session {#ID_SES} SessionNumber| <p>Session number</p>| `Dependent item` |SessionSessionNumber[{#ID_SES}]|
|Session {#ID_SES} SessionStarted| <p>Session start time</p>| `Dependent item` |SessionSessionStarted[{#ID_SES}]|
|Session {#ID_SES} UsedLicence| <p>S/N of the used license</p>| `Dependent item` |SessionUsedLicence[{#ID_SES}]|
|Session {#ID_SES} UserName| <p>Name of the Information Database user</p>| `Dependent item` |SessionUserName[{#ID_SES}]|

## Triggers

|Name|Description|Expression| Priority    |
|----|-----------|----------|-------------|
|License server SLK not available on {HOST.NAME}|<p>-</p>|<p>**Expression**: nodata(/Template_App_1C_SLK_licenses/LicenseServerData,2m)=1</p><p>**Recovery expression**: </p>| Average |

## Known issues

You can report problems here: https://github.com/VAGurko/zabbix-community-templates/issues

## References

Official website: https://licencecenter.ru/