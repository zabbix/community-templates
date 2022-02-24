# MBTC Trading

## Description

Trading using MercadoBitcoin API. Build using MBTC api documentation (https://www.mercadobitcoin.com.br/api-doc/)

## Overview

**Template - MBTC Trading**
===========================


 


Seeks Bitcoin, Ethereum and Litecoin trading using [MercadoBitcoin API](https://www.mercadobitcoin.com.br/api-doc/). 


 


 


 


* [BTC] - Current
* [BTC] - High
* [BTC] - Low
* [ETH] - Current
* [ETH] - High
* [ETH] - Low
* [LTC] - Current
* [LTC] - High
* [LTC] - Low


## Author

Rickk Barbosa

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{$TRADER_API_URL}|<p>-</p>|`https://www.mercadobitcoin.net/api`|Text macro|


## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|BTC Full Info|<p>-</p>|`HTTP agent`|currency.trade[BTC]<p>Update: 1m</p>|
|ETH Full Info|<p>Full information about Ethereum</p>|`HTTP agent`|currency.trade[ETH]<p>Update: 1m</p>|
|[BTC] - Low|<p>Lowest exchange price on the last 24 hours</p>|`Dependent item`|currency.trade[BTC,low]<p>Update: 0</p>|
|[LTC] - High|<p>Higher exchange price on the last 24 hours</p>|`Dependent item`|currency.trade[LTC,high]<p>Update: 0</p>|
|LTC Full Info|<p>Full information about Litecoin</p>|`HTTP agent`|currency.trade[LTC]<p>Update: 1m</p>|
|[BTC] - Current|<p>Last negotiation value</p>|`Dependent item`|currency.trade[BTC,last]<p>Update: 0</p>|
|[LTC] - Current|<p>Last negotiation value</p>|`Dependent item`|currency.trade[LTC,last]<p>Update: 0</p>|
|[ETH] - Current|<p>Last negotiation value</p>|`Dependent item`|currency.trade[ETH,last]<p>Update: 0</p>|
|[BTC] - High|<p>Higher exchange price on the last 24 hours</p>|`Dependent item`|currency.trade[BTC,high]<p>Update: 0</p>|
|[ETH] - High|<p>Higher exchange price on the last 24 hours</p>|`Dependent item`|currency.trade[ETH,high]<p>Update: 0</p>|
|[ETH] - Low|<p>Lowest exchange price on the last 24 hours</p>|`Dependent item`|currency.trade[ETH,low]<p>Update: 0</p>|
|[LTC] - Low|<p>Lowest exchange price on the last 24 hours</p>|`Dependent item`|currency.trade[LTC,low]<p>Update: 0</p>|


## Triggers

There are no triggers in this template.

