# OpenVPN

## Description

Template to monitor VPN Services according to the Open Source configuration provided at https://thevpncompany.com.au The VPN Company provides the source code to create an end-to-end VPN Company.

## Overview

[TheVPNCompany.com.au](https://thevpncompany.com.au) offers an open source end to end solution for VPN Companies. In order to manage the OpenVPN Infrastructure, those templates are published.


Please visit [TheVPNCompany.com.au](https://thevpncompany.com.au) on how to install and configure the templates.


Those templates allows the user to:


 - Discover how many users are connected to the OpenVPN backend


 - Monitor how much bandwidth those users have consumed in the current month


 - Monitor how much total bandwidth the OpenVPN server has consumed in the current month


 


 


 


 


 



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discover Connected Users|<p>Discover the users that are connected to an OpenVPN Server</p>|`Zabbix agent`|thevpncompany.openvpn.client.discovery<p>Update: 1m</p>|


## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Data for {#ID}|<p>-</p>|`Zabbix agent`|thevpncompany.openvpn.client.if.size[{#ID}]<p>Update: 30s</p><p>LLD</p>|


## Triggers

There are no triggers in this template.

# VPN Server

## Description

Template to monitor VPN Services according to the Open Source configuration provided at https://thevpncompany.com.au The VPN Company provides the source code to create an end-to-end VPN Company.

## Overview

[TheVPNCompany.com.au](https://thevpncompany.com.au) offers an open source end to end solution for VPN Companies. In order to manage the OpenVPN Infrastructure, those templates are published.


Please visit [TheVPNCompany.com.au](https://thevpncompany.com.au) on how to install and configure the templates.


Those templates allows the user to:


 - Discover how many users are connected to the OpenVPN backend


 - Monitor how much bandwidth those users have consumed in the current month


 - Monitor how much total bandwidth the OpenVPN server has consumed in the current month


 


 


 


 


 



## Description

Template to monitor VPN Services according to the Open Source configuration provided at https://thevpncompany.com.au The VPN Company provides the source code to create an end-to-end VPN Company.

## Overview

[TheVPNCompany.com.au](https://thevpncompany.com.au) offers an open source end to end solution for VPN Companies. In order to manage the OpenVPN Infrastructure, those templates are published.


Please visit [TheVPNCompany.com.au](https://thevpncompany.com.au) on how to install and configure the templates.


Those templates allows the user to:


 - Discover how many users are connected to the OpenVPN backend


 - Monitor how much bandwidth those users have consumed in the current month


 - Monitor how much total bandwidth the OpenVPN server has consumed in the current month


 


 


 


 


 



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Total Network Usage|<p>-</p>|`Zabbix agent`|vpncompany.if.size<p>Update: 1m</p>|


## Triggers

There are no triggers in this template.

