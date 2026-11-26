# Starlink dish by Browser

## Overview

This template monitors a Starlink dish through the [Starlink web application](https://webapp.starlink.com/) by using a Zabbix [Browser item](https://www.zabbix.com/documentation/7.4/en/manual/config/items/itemtypes/browser).

The master item opens the web application in a WebDriver-controlled browser, clicks the **Diagnostics** button, extracts the dish diagnostics JSON shown in the diagnostics window, and passes it to dependent items and a low-level discovery rule for dish alerts.

The script disables Chrome's HTTPS-First mode, because the web application is served over plain HTTP and Chrome would otherwise show a "This site doesn't support a secure connection" warning that WebDriver cannot click. If another element covers the **Diagnostics** button, the script focuses the button and presses Enter instead. Only the Diagnostics button is ever pressed, never **Reboot** or **Stow**.

The web application reads data directly from the dish over the local network, so **the browser used by Zabbix must be on the same network as the dish** (the dish must be reachable at `192.168.100.1`).

Author: Aleksandrs Petrovs-Gavrilovs (AlexPG)

Template version: 7.4-0

## Requirements

Zabbix version: 7.4 and higher.

- Zabbix server or proxy with Browser items enabled: `WebDriverURL` and `StartBrowserPollers` configured in the server/proxy configuration file.
- A WebDriver, for example Selenium with Chrome. See [Browser item setup](https://www.zabbix.com/documentation/7.4/en/manual/config/items/itemtypes/browser).
- Network access from the WebDriver host to the Starlink web application and to the dish.

## Setup

1. Configure the Zabbix server or proxy for Browser items.
2. Import the template.
3. Create a host (no host interface is required) and link the **Starlink dish by Browser** template. The template is Host Wizard ready.
4. If needed, adjust the macros listed below.

## Macros used

| Name | Description | Default |
|------|-------------|---------|
| {$STARLINK.URL} | URL of the Starlink web application. | `http://webapp.starlink.com` |
| {$STARLINK.DISH.DIAG.BUTTON.XPATH} | XPath of the "Diagnostics" button that opens the diagnostics data. Change only if the web application layout changes. | `//button[normalize-space(.)='Diagnostics']` |
| {$STARLINK.DISH.DATA.XPATH} | XPath of the element(s) in the diagnostics window that contain the dish diagnostics JSON. Change only if the web application layout changes. | `//pre[contains(@class,'Json-Format')]/div[contains(@class,'Json-Text')]` |
| {$STARLINK.DISH.DATA.WAIT} | Maximum time in seconds to wait for the web application to load and render the diagnostics data. Must be lower than the master item timeout (60s). | `15` |
| {$STARLINK.DISH.NODATA.TIMEOUT} | Time without data after which the "Dish: Failed to get data" trigger fires. | `15m` |
| {$STARLINK.DISH.ALERT.MATCHES} | Filter of discoverable dish alerts by name. | `.*` |
| {$STARLINK.DISH.ALERT.NOT_MATCHES} | Filter to exclude discovered dish alerts by name. | `CHANGE_IF_NEEDED` |

## Items

| Name | Description | Type | Key |
|------|-------------|------|-----|
| Dish: Get data | Opens the web application and extracts the dish diagnostics JSON. Master item. | Browser | starlink.dish.get |
| Dish: Disablement code | The reason why the dish service is disabled, if any (value mapped). | Dependent item | starlink.dish.disablement_code |
| Dish: Hardware version | Dish hardware revision. Populates the *Hardware* inventory field. | Dependent item | starlink.dish.hardware.version |
| Dish: Hardware self-test status | Result of the dish hardware self-test: 0 - No result, 1 - Passed, 2 - Failed. | Dependent item | starlink.dish.self_test.status |
| Dish: Hardware self-test codes | Codes reported by the hardware self-test, or "None". | Dependent item | starlink.dish.self_test.codes |
| Dish: ID | Unique identifier of the dish. | Dependent item | starlink.dish.id |
| Dish: Overage rate limited | Whether the data rate is limited because the plan data allowance is exceeded: 0 - No, 1 - Yes. | Dependent item | starlink.dish.overage_rate_limited |
| Dish: Software version | Dish firmware version. Populates the *Software* inventory field. | Dependent item | starlink.dish.software.version |
| Dish: Stowed | Whether the dish is stowed: 0 - No, 1 - Yes. | Dependent item | starlink.dish.stowed |
| Dish: UTC offset | Difference between the dish local time zone and UTC. | Dependent item | starlink.dish.utc_offset |

## Triggers

| Name | Description | Expression | Severity |
|------|-------------|------------|----------|
| Dish: Failed to get data | No data has been received from the web application for `{$STARLINK.DISH.NODATA.TIMEOUT}`. | `nodata(/Starlink dish by Browser/starlink.dish.get,{$STARLINK.DISH.NODATA.TIMEOUT})=1` | Warning |
| Dish: Service is disabled | The dish reports that the service is disabled. The reason is shown in the operational data. | `last(/Starlink dish by Browser/starlink.dish.disablement_code)<>0 and last(/Starlink dish by Browser/starlink.dish.disablement_code)<>1` | Average |
| Dish: Hardware self-test failed | The dish hardware self-test failed. | `last(/Starlink dish by Browser/starlink.dish.self_test.status)=2` | Average |
| Dish: Software version has changed | The dish firmware version has changed. Manual close: Yes. | `last(/Starlink dish by Browser/starlink.dish.software.version,#1)<>last(/Starlink dish by Browser/starlink.dish.software.version,#2) and length(last(/Starlink dish by Browser/starlink.dish.software.version))>0` | Info |
| Dish: Data rate is limited due to overage | The plan data allowance is exceeded and the data rate is limited. | `last(/Starlink dish by Browser/starlink.dish.overage_rate_limited)=1` | Warning |
| Dish: Is stowed | The dish is stowed and does not provide service. | `last(/Starlink dish by Browser/starlink.dish.stowed)=1` | Warning |

## LLD rule Alert discovery

| Name | Description | Type | Key |
|------|-------------|------|-----|
| Alert discovery | Discovers the alerts reported by the dish (e.g. thermal throttling, motors stuck). | Dependent item | starlink.dish.alert.discovery |

### Item prototypes for Alert discovery

| Name | Description | Type | Key |
|------|-------------|------|-----|
| Alert [{#ALERT}]: Status | Status of the dish alert: 0 - Inactive, 1 - Active. | Dependent item | starlink.dish.alert.status["{#ALERT}"] |

### Trigger prototypes for Alert discovery

| Name | Description | Expression | Severity |
|------|-------------|------------|----------|
| Alert [{#ALERT}]: Alert is active | The dish reports the alert. Resolved automatically when the dish clears it. | `last(/Starlink dish by Browser/starlink.dish.alert.status["{#ALERT}"])=1` | Warning |

## Troubleshooting

Check the error message of the **Dish: Get data** item in *Monitoring → Latest data*.

| Error | Cause and fix |
|-------|---------------|
| `the browser shows an empty page for http://webapp.starlink.com/` | Chrome blocked the HTTP page. The template disables HTTPS-First mode, so check for a Chrome policy (e.g. `HttpsOnlyMode`) on the WebDriver host and make sure `{$STARLINK.URL}` uses `http`. |
| `the "Diagnostics" button was not found` | The web application did not load or cannot reach the dish. Check what the WebDriver browser shows, or increase `{$STARLINK.DISH.DATA.WAIT}`. |
| `diagnostics data was not found after clicking the "Diagnostics" button` | The web application layout changed. Update `{$STARLINK.DISH.DIAG.BUTTON.XPATH}` and `{$STARLINK.DISH.DATA.XPATH}`. |

## Feedback

Please report any issues with the template at the [Zabbix community templates repository](https://github.com/zabbix/community-templates/issues) or on the [Zabbix forum](https://www.zabbix.com/forum/).
