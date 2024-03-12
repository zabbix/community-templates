# Template Ambient Weather by HTTP

Gather weather stats from your Ambient Weather station using your Ambient Weather online account.

You will need to replace the `{$AWNET.APPLICATIONKEY}` and `{$AWNET.APIKEY}` macros with a developer application key and an API key.

Zabbix server will poll the Ambient Weather website API to pull data. Zabbix does not poll the weather station directly.

To generate an **Application Key**:

- Log in to your Ambient Weather web dashboard
- Navigate to your profile
- Scroll to the "API Keys" section
- Click on the link in the text "Developers: An Application Key is also required for each application that you develop. **Click here** to create one."
- Enter a description in the field and click "**Create Application Key**"

To generate an **API Key**:

- Log in to your Ambient Weather web dashboard
- Navigate to your profile
- Scroll to the "API Keys" section
- Click on the "**Create Application Key**" button
- Give the API key a name if desired



## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|`{$AWNET.APPLICATIONKEY}`|Ambient Weather generated application key|none|Text macro|
|`{$AWNET.APIKEY}`|Ambient Weather generated API key|none|Text macro|



## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Get Stats|Process weather station data into items|Dependent Item|`tempf[{#DEVICE.MAC}]`|



## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Get Devices|Get a list of Ambient Weather stations from the account to be used by the discovery rule|`HTTP agent`|`devices`|
|`{#DEVICE.NAME}` Barometric Pressure (Absolute)|Barometric Pressure (Absolute)|`Dependent Item`|`baromabsin[{#DEVICE.MAC}]`|
|`{#DEVICE.NAME}` Barometric Pressure (Relative)|Barometric Pressure (Relative)|`Dependent Item`|`baromrelin[{#DEVICE.MAC}]`|
|`{#DEVICE.NAME}` Indoor Dew Point|Indoor Dew Point|`Dependent Item`|`dewPointin[{#DEVICE.MAC}]`|
|`{#DEVICE.NAME}` Outdoor Dew Point|Outdoor Dew Point|`Dependent Item`|`dewPoint[{#DEVICE.MAC}]`|
|`{#DEVICE.NAME}` Indoor Feels Like|Indoor Feels Like|`Dependent Item`|`feelsLikein[{#DEVICE.MAC}]`|
|`{#DEVICE.NAME}` Outdoor Feels Like|Outdoor Feels Like|`Dependent Item`|`feelsLike[{#DEVICE.MAC}]`|
|`{#DEVICE.NAME}` Indoor Humidity|Indoor Humidity|`Dependent Item`|`humidityin[{#DEVICE.MAC}]`|
|`{#DEVICE.NAME}` Outdoor Humidity|Outdoor Humidity|`Dependent Item`|`humidity[{#DEVICE.MAC}]`|
|`{#DEVICE.NAME}` Solar Radiation|Solar Radiation|`Dependent Item`|`solarradiation[{#DEVICE.MAC}]`|
|`{#DEVICE.NAME}` Indoor Temperature (C)|Indoor Temperature (C)|`Dependent Item`|`tempinc[{#DEVICE.MAC}]`|
|`{#DEVICE.NAME}` Indoor Temperature|Indoor Temperature|`Dependent Item`|`tempin[{#DEVICE.MAC}]`|
|`{#DEVICE.NAME}` Outdoor Temperature (C)|Outdoor Temperature (C)|`Dependent Item`|`tempoutc[{#DEVICE.MAC}]`|
|`{#DEVICE.NAME}` Outdoor Temperature|Outdoor Temperature|`Dependent Item`|`tempout[{#DEVICE.MAC}]`|
|`{#DEVICE.NAME}` Wind Direction|Wind Direction|`Dependent Item`|`winddir[{#DEVICE.MAC}]`|
|`{#DEVICE.NAME}` Wind Gust|Wind Gust|`Dependent Item`|`windgustmph[{#DEVICE.MAC}]`|
|`{#DEVICE.NAME}` Wind Speed|Wind Speed|`Dependent Item`|`windspeedmph[{#DEVICE.MAC}]`|



## Triggers

There are no triggers in this template.
