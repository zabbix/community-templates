# MikroTik RB260 v1.17

## Overview

MikroTik RB260 v1.17



## Macros used

{$IF.UTIL.MAX} - Set the maximum network utilization before trigger goes off (Default: 90%)

## Template links

There are no template links in this template.

## Discovery rules

Network interfaces will get discovered and triggers set.
Items:
- Admin status
- Bits received
- Bits Send
- Inbound packets discarded
- Inbound packets with errors
- Outbound packets discarded
- Outbound packets with errors
- Interface type
- Operational status
- Interface speed

## Triggers

- Link down
- Lower speed than previous
- High bandwith usage
