# Zabbix Template: PowerDNS Recursor by HTTP

[![Zabbix](https://img.shields.io/badge/Zabbix-7.4-d40000)](https://www.zabbix.com/)
[![PowerDNS Recursor](https://img.shields.io/badge/PowerDNS%20Recursor-5.x-4b8bbe)](https://doc.powerdns.com/recursor/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](../../../../LICENSE)

Zabbix 7.4 template for monitoring a standard single-instance PowerDNS
Recursor deployment through its built-in HTTP API.

The template assumes that the DNS service listens on port 53 and the HTTP API
listens on port 8082. Both ports are macros and can be overridden without
editing the template.

## Features

- Agentless statistics collection through the Recursor HTTP API
- One API request per minute per monitored host
- Master/dependent item design to reduce API load
- DNS TCP service availability check on port 53
- Query and outgoing-query rates
- Record-cache and packet-cache hit/miss rates
- Five-minute record-cache and packet-cache hit ratios
- SERVFAIL, NXDOMAIN, timeout and policy-result rates
- Capacity, age and UDP receive-buffer drop/error rates
- Concurrent queries, query-answer latency and cache entry counts
- Resident memory, uptime and security-status metrics
- Availability and over-capacity triggers
- No helper script, UserParameter, sudoers rule or `rec_control get-all`
  dependency

## Requirements

- Zabbix 7.4 server or proxy with network access to the Recursor HTTP API
- PowerDNS Recursor 5.x with the webservice and REST API enabled
- One standard Recursor instance represented by each Zabbix host
- DNS service on TCP port 53 by default
- An API key accepted by PowerDNS Recursor

Zabbix Agent is not required for this template. The HTTP Agent request and the
TCP service check are executed by the Zabbix server or assigned proxy.

## Repository contents

```text
.
├── README.md
├── template_powerdns_recursor_by_http.yaml
└── files/
    └── recursor-api.yml.example
```

## PowerDNS Recursor configuration

Copy the relevant `webservice` settings from
[`files/recursor-api.yml.example`](files/recursor-api.yml.example) into
your Recursor YAML configuration and replace the documentation-only addresses.

For Recursor 4.6 and later, generate a hashed API key interactively:

```bash
rec_control hash-password
```

Place the generated complete hash in `webservice.api_key`. The Zabbix secret
macro must contain the original plaintext API key, not the hash.

Check the active configuration file name and validate the configuration using
the commands provided by your package. Then restart Recursor because the
webserver listen settings are startup settings. A common systemd deployment can
be restarted with:

```bash
sudo systemctl restart pdns-recursor
sudo systemctl --no-pager --full status pdns-recursor
```

## Test the API

Run this from the Zabbix server or the proxy assigned to the monitored host:

```bash
read -rsp 'Recursor API key: ' RECURSOR_API_KEY
echo

curl -fsS \
  -H "X-API-Key: ${RECURSOR_API_KEY}" \
  'http://192.0.2.10:8082/api/v1/servers/localhost/statistics'

unset RECURSOR_API_KEY
```

A successful request returns HTTP 200 and a JSON array of statistic objects.
Also test the standard DNS TCP port from the same monitoring path:

```bash
nc -vz 192.0.2.10 53
```

## Import and link the template

1. In Zabbix, open **Data collection → Templates**.
2. Select **Import**.
3. Import `template_powerdns_recursor_by_http.yaml`.
4. Link `PowerDNS Recursor by HTTP` to the Recursor host.
5. Set `{$PDNS.RECURSOR.API.KEY}` as a host-level **Secret text** macro.
6. Override the API scheme, API port or DNS port if your standard deployment
   differs from the defaults.
7. Wait for two collection intervals, then check **Monitoring → Latest data**.

Rate items use change-per-second preprocessing and need two master-item samples
before the first value can be calculated.

## Template macros

| Macro | Default | Description |
|---|---:|---|
| `{$PDNS.RECURSOR.API.KEY}` | Empty | Plaintext Recursor API key sent in the `X-API-Key` header. Store it as Secret text. |
| `{$PDNS.RECURSOR.API.PORT}` | `8082` | Recursor HTTP API port. |
| `{$PDNS.RECURSOR.API.SCHEME}` | `http` | API scheme: `http` or `https`. |
| `{$PDNS.RECURSOR.DNS.PORT}` | `53` | DNS service port used by the TCP availability item. |
| `{$PDNS.RECURSOR.HTTP.TIMEOUT}` | `10s` | HTTP Agent request timeout. |

The API master item uses this URL:

```text
{$PDNS.RECURSOR.API.SCHEME}://{HOST.CONN}:{$PDNS.RECURSOR.API.PORT}/api/v1/servers/localhost/statistics
```

## Collected metrics

The template contains 28 items in total.

| Category | Metrics |
|---|---|
| Availability | DNS TCP service state and HTTP API statistics master item |
| Traffic | Questions, outgoing queries, TCP questions and IPv6 questions per second |
| Cache | Record/packet-cache hits, misses, five-minute hit ratios and entry counts |
| Responses | SERVFAIL and NXDOMAIN answers per second |
| Resolver health | Outgoing timeouts and query-answer latency |
| Policy | Policy drops and policy NXDOMAIN results |
| Capacity | Over-capacity drops, too-old drops and concurrent queries |
| Network | IPv4 and IPv6 UDP receive-buffer errors |
| Resources | Real memory usage and uptime |
| Security | PowerDNS security status |

## Triggers

| Severity | Trigger | Condition |
|---|---|---|
| High | PowerDNS Recursor: DNS TCP service is unavailable | TCP service check remains unavailable for three minutes |
| High | PowerDNS Recursor: API statistics are unavailable | No API master-item data for three minutes |
| High | PowerDNS Recursor: Queries are being dropped due to capacity | Over-capacity drops remain above zero for five minutes |

## Security recommendations

- Restrict `webservice.allow_from` to the Zabbix server or assigned proxy.
- Restrict the API port with the host and network firewalls as well.
- Store the API key in Zabbix as **Secret text**.
- Use a hashed API key in the Recursor configuration when supported.
- Do not expose the API to `0.0.0.0/0` or `::/0`.
- Prefer HTTPS when the monitoring path crosses an untrusted network.
- Do not commit production addresses, credentials or configuration files.

## Troubleshooting

### API item is unsupported

Test the exact API URL from the assigned Zabbix proxy/server. Verify routing,
firewall rules, `webservice.webserver`, the bind address, `allow_from`, the API
key and the host interface configuration in Zabbix.

### HTTP 401 or 403

Confirm that the Zabbix macro contains the plaintext key corresponding to the
hash configured in Recursor. Confirm that the source address of the Zabbix
server/proxy is present in `webservice.allow_from`.

### DNS availability is down while UDP queries work

The template deliberately checks TCP port 53 because DNS requires both UDP and
TCP service. Verify that Recursor is listening on TCP, the firewall permits TCP
53, and `{$PDNS.RECURSOR.DNS.PORT}` matches the deployment.

### Dependent items have no data

Check the API master item first. Some statistics depend on Recursor version,
build options or enabled features. Missing fields are intentionally discarded
by preprocessing. Rate items require two samples.

### Multiple Recursor instances exist on one host

This public template models the standard single-instance deployment. Create a
separate Zabbix host/interface per reachable API endpoint or maintain a custom
multi-instance template outside this repository.

## Compatibility

- Template export version: Zabbix 7.4
- Target service: PowerDNS Recursor 5.x
- Verified application version: PowerDNS Recursor 5.4.0
- Deployment model: one Recursor instance per Zabbix host
- Default DNS port: 53
- Default API port: 8082

The template should be imported and tested in the target Zabbix release before
production use. Do not change the export version field manually to claim
compatibility with another Zabbix release.

## Documentation

- [PowerDNS Recursor HTTP API](https://doc.powerdns.com/recursor/http-api/)
- [PowerDNS Recursor statistics endpoint](https://doc.powerdns.com/recursor/common/api/endpoint-statistics.html)
- [PowerDNS Recursor YAML webservice settings](https://doc.powerdns.com/recursor/yamlsettings.html#webservice-address)
- [Zabbix HTTP Agent items](https://www.zabbix.com/documentation/7.4/en/manual/config/items/itemtypes/http)
- [Zabbix template import](https://www.zabbix.com/documentation/7.4/en/manual/xml_export_import)

## License

This template and its accompanying files are licensed under the
[MIT License](../../../../LICENSE).

## Author

Emre Melih Çelik ([@imagineTh4t](https://github.com/imagineTh4t))
