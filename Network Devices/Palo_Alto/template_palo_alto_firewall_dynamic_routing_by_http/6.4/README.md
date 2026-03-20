# Template Palo Alto Firewall Dynamic Routing by HTTP

Monitor dynamic routing neighbors (OSPFv2, OSPFv3, and BGP) on a Palo Alto firewall using the XML API.

Template requires the `{$PAN_API_KEY}` macro to be entered/overridden with an API key for a user on the firewall. A superuser can be used and will work, but if setting up a limited user with an Admin Role, make sure to include the [XML API / Operational Requests] permission in the Admin Role.

Obtaining the API key from the firewall requires using the API. This can be done one of two ways:

1.  Use your browser to obtain the API key: Copy the URL example below and replace it with the firewall's IP/hostname as well as the username and password of the user you want to use. You should get an XML response with the API key contained within. Copy the API key and override the {$PAN_API_KEY} macro for monitored hosts.
    - Browser URL: `https://X.X.X.X/api/?type=keygen&user=SOMEUSER&password=SUPERSECRETPASSWORD`

2.  Use CURL to query the firewall's API and obtain the API key: Copy the command example below and replace it with the firewall's IP/hostname as well as the username and password of the user you want to use. You should get an XML response with the API key contained within. Copy the API key and override the {$PAN_API_KEY} macro for monitored hosts.
    - > Note: If your password uses special characters, you may need to escape them with backslashes.
    - `curl -k -G -X GET "https://X.X.X.X/api/?type=keygen" --data-urlencode "user=SOMEUSER" --data-urlencode "password=SUPER\!SECRETPASSWORD"`

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|BGP Neighbors|Pull a list of configured BGP neighbors and their states|Dependent Item|`bgp.neighbor.discovery`|
|OSPFv2 Neighbors|Pull a list of OSPFv2 adjacencies and their states|Dependent Item|`ospfv2.neighbor.discovery`|
|OSPFv3 Neighbors|Pull a list of OSPFv3 adjacencies and their states|Dependent Item|`ospfv3.neighbor.discovery`|



## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Get BGP Neighbors|Retrieve list of BGP neighbors and their details|`HTTP agent`|`bgp.neighbors` - Used by discovery rule to enumerate BGP neighbors|
|Get OSPFv2 Neighbors|Retrieve list of OSPFv2 (IPv4) adjacencies and their details|`HTTP agent`|`ospfv2.neighbors` - Used by discovery rule to enumerate dynamic OSPFv2 adjacencies|
|Get OSPFv3 Neighbors|Retrieve list of OSPFv3 (IPv6) adjacencies and their details|`HTTP agent`|`ospfv3.neighbors` - Used by discovery rule to enumerate dynamic OSPFv3 adjacencies|
|High-Availability State|Retrieve the firewall's HA state|`HTTP agent`|`ha.state` - Used to determine if triggers should fire for states of neighbors/adjacencies.|




## Triggers

|Name|Description|Expression|Priority|
|----|-----------|----------|--------|
|No API data for 5 minutes|-|<p>**Expression**: `nodata(/Palo Alto Firewall Dynamic Routing by HTTP/ospfv2.neighbors,5m)=1 or nodata(/Palo Alto Firewall Dynamic Routing by HTTP/ospfv3.neighbors,5m)=1 or nodata(/Palo Alto Firewall Dynamic Routing by HTTP/bgp.neighbors,5m)=1`</p><p>**Recovery expression**: </p>|high|



## BGP Neighbors

### Item Prototypes

- BGP Neighbor `{#NEIGHBOR.VIRTUAL_ROUTER}`/`{#NEIGHBOR.PEER_GROUP}`/`{#NEIGHBOR.NAME}` (`{#NEIGHBOR.REMOTE_AS}`) Incoming Routes (Accepted)
- BGP Neighbor `{#NEIGHBOR.VIRTUAL_ROUTER}`/`{#NEIGHBOR.PEER_GROUP}`/`{#NEIGHBOR.NAME}` (`{#NEIGHBOR.REMOTE_AS}`) Incoming Routes (Total)
- BGP Neighbor `{#NEIGHBOR.VIRTUAL_ROUTER}`/`{#NEIGHBOR.PEER_GROUP}`/`{#NEIGHBOR.NAME}` (`{#NEIGHBOR.REMOTE_AS}`) Outgoing Routes (Advertised)
- BGP Neighbor `{#NEIGHBOR.VIRTUAL_ROUTER}`/`{#NEIGHBOR.PEER_GROUP}`/`{#NEIGHBOR.NAME}` (`{#NEIGHBOR.REMOTE_AS}`) Outgoing Routes (Total)
- BGP Neighbor `{#NEIGHBOR.VIRTUAL_ROUTER}`/`{#NEIGHBOR.PEER_GROUP}`/`{#NEIGHBOR.NAME}` (`{#NEIGHBOR.REMOTE_AS}`) State
- BGP Neighbor `{#NEIGHBOR.VIRTUAL_ROUTER}`/`{#NEIGHBOR.PEER_GROUP}`/`{#NEIGHBOR.NAME}` (`{#NEIGHBOR.REMOTE_AS}`) Status Flap Count

### Trigger Prototypes

- BGP Neighbor `{#NEIGHBOR.VIRTUAL_ROUTER}`/`{#NEIGHBOR.PEER_GROUP}`/`{#NEIGHBOR.NAME}` (`{#NEIGHBOR.REMOTE_AS}`) Down
- BGP Neighbor `{#NEIGHBOR.VIRTUAL_ROUTER}`/`{#NEIGHBOR.PEER_GROUP}`/`{#NEIGHBOR.NAME}` (`{#NEIGHBOR.REMOTE_AS}`) Flapped



## OSPFv2 Neighbors

### Item Prototypes

- OSPFv2 Neighbor `{#NEIGHBOR.ROUTERID}` (`{#NEIGHBOR.ADDRESS}` - `{#NEIGHBOR.VIRTUAL_ROUTER}`) State

### Trigger Prototypes

- OSPFv2 Neighbor `{#NEIGHBOR.ROUTERID}` (`{#NEIGHBOR.ADDRESS}` - `{#NEIGHBOR.VIRTUAL_ROUTER}`) Disappeared
- OSPFv2 Neighbor `{#NEIGHBOR.ROUTERID}` (`{#NEIGHBOR.ADDRESS}` - `{#NEIGHBOR.VIRTUAL_ROUTER}`) State Changed
- OSPFv2 Neighbor `{#NEIGHBOR.ROUTERID}` (`{#NEIGHBOR.ADDRESS}` - `{#NEIGHBOR.VIRTUAL_ROUTER}`) Stuck



## OSPFv3 Neighbors

### Item Prototypes

- OSPFv3 Neighbor `{#NEIGHBOR.ROUTERID}` (`{#NEIGHBOR.ADDRESS}` - `{#NEIGHBOR.VIRTUAL_ROUTER}` - Intf`{#NEIGHBOR.INTERFACE_ID}`) State
- OSPFv3 Neighbor `{#NEIGHBOR.ROUTERID}` (`{#NEIGHBOR.ADDRESS}` - `{#NEIGHBOR.VIRTUAL_ROUTER}` - Intf`{#NEIGHBOR.INTERFACE_ID}`) Status

### Trigger Prototypes

- OSPFv3 Neighbor `{#NEIGHBOR.ROUTERID}` (`{#NEIGHBOR.ADDRESS}` - `{#NEIGHBOR.VIRTUAL_ROUTER}` - Intf`{#NEIGHBOR.INTERFACE_ID}`) Disappeared
- OSPFv3 Neighbor `{#NEIGHBOR.ROUTERID}` (`{#NEIGHBOR.ADDRESS}` - `{#NEIGHBOR.VIRTUAL_ROUTER}` - Intf`{#NEIGHBOR.INTERFACE_ID}`) State Changed]
- OSPFv3 Neighbor `{#NEIGHBOR.ROUTERID}` (`{#NEIGHBOR.ADDRESS}` - `{#NEIGHBOR.VIRTUAL_ROUTER}` - Intf`{#NEIGHBOR.INTERFACE_ID}`) Stuck
