# AllSwap API by HTTP

## Overview
This Zabbix 7.0 template monitors the availability and health status of the [AllSwap](https://allswap.io/) non-custodial cross-chain swap protocol API using the native Zabbix HTTP Agent.

## Requirements
- Zabbix 7.0 or higher
- Outbound HTTPS connectivity from the Zabbix Server or Proxy

## Macros
| Name | Default | Description |
| :--- | :--- | :--- |
| `{$ALLSWAP.API.URL}` | `https://allswap.io/api/v1/health` | API health endpoint URL |
| `{$ALLSWAP.API.TIMEOUT}` | `5s` | HTTP request timeout |

## Items
| Name | Key | Type | Interval |
| :--- | :--- | :--- | :--- |
| AllSwap API: Health status | `allswap.api.health` | HTTP Agent | `1m` |

## Triggers
| Name | Severity | Expression |
| :--- | :--- | :--- |
| AllSwap API: Health check returned empty or unreachable | High | `last(/AllSwap API by HTTP/allswap.api.health)=0` |

## License
MIT License
