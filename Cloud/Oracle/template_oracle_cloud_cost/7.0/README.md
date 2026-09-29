# Zabbix Template — Oracle Cloud Cost

Template para monitoramento de **custos da Oracle Cloud Infrastructure (OCI)** através da **Usage API**, desenvolvido para **Zabbix 7.0 LTS**.

O template é focado exclusivamente no acompanhamento de custos da tenancy em **BRL**, permitindo visualizar o custo acumulado do mês e os custos diários, além de gerar alertas quando um limite diário for atingido.

> **Importante:** este template é complementar ao template oficial **Oracle Cloud by HTTP** do Zabbix. Recomenda-se utilizar o `Oracle Cloud by HTTP` para monitorar os demais recursos e serviços da OCI, enquanto este template é utilizado especificamente para monitoramento de custos. O template oficial possui descoberta e monitoramento de recursos como Compute, Autonomous Database, VCN, Block Volumes, Boot Volumes e Object Storage.

## Author

Developed and maintained by [luizcarmo1](https://github.com/luizcarmo1).

Repository:
https://github.com/luizcarmo1/oracle-cloud-cost-zabbix-template

## Requisitos

* Zabbix **7.0 LTS**
* Oracle Cloud Infrastructure (OCI)
* Usuário dedicado para monitoramento
* API Key da OCI
* Acesso HTTPS do Zabbix à OCI
* Permissão IAM para consulta da Usage API

---

## OCI IAM Policy

Recomenda-se criar um usuário e um grupo dedicados ao monitoramento.

Exemplo:

```text
Grupo: ZABBIX-OCI-Monitoring
Usuário: zabbix-oci-monitoring
```

Para consultar os dados de custo através da Usage API, a principal permissão necessária é:

```text
Allow group ZABBIX-OCI-Monitoring to read usage-report in tenancy
```

A Oracle documenta `read usage-report` como uma das permissões que permitem utilizar a Usage API para consulta de dados de custo.

No ambiente em que este template foi desenvolvido também são utilizadas:

```text
Allow group ZABBIX-OCI-Monitoring to inspect tenancies in tenancy
Allow group ZABBIX-OCI-Monitoring to inspect compartments in tenancy
Allow group ZABBIX-OCI-Monitoring to manage usage-report in tenancy
```

Essas permissões adicionais **não são necessárias para a finalidade básica deste template** e podem ser avaliadas de acordo com as necessidades do ambiente.

> Recomenda-se aplicar o princípio do menor privilégio e não utilizar um usuário administrativo para o monitoramento.

---

## Autenticação na OCI

O template utiliza **OCI API Key Authentication**.

Crie uma API Key em:

```text
OCI Console
→ Identity & Security
→ Domains
→ (seu domínio)
→ User management
→ Users
→ <usuário>
→ API Keys
→ Add API Key
→ Guardar a private key e fingerprint.
```

São necessários:

* Tenancy OCID
* User OCID
* Fingerprint
* Private Key

A API da OCI exige que as requisições sejam assinadas. O template utiliza **RSA-SHA256** para assinar cada requisição utilizando a chave privada da API Key.

A comunicação com a OCI ocorre através de **HTTPS/TLS**.

Em resumo:

```text
Zabbix
   │
   │ RSA-SHA256
   │
   ▼
HTTPS/TLS
   │
   ▼
OCI Usage API
```

HTTPS protege os dados durante o transporte, enquanto a assinatura RSA-SHA256 permite à OCI validar a autenticidade e a integridade da requisição.

A chave privada **nunca deve ser publicada no repositório**.

---

## Macros

Configure as seguintes macros no host:

| Macro                          | Descrição                     |
| ------------------------------ | ----------------------------- |
| `{$OCI.API.TENANCY}`           | OCID da tenancy               |
| `{$OCI.API.USER}`              | OCID do usuário               |
| `{$OCI.API.FINGERPRINT}`       | Fingerprint da API Key        |
| `{$OCI.API.PRIVATE.KEY}`       | Chave privada RSA             |
| `{$OCI.API.USAGE.HOST}`        | Endpoint da Usage API         |
| `{$OCI.API.HTTP.PROXY}`        | Proxy HTTP, se utilizado      |
| `{$OCI.HTTP.RESPONSE.CODE.OK}` | Código HTTP esperado          |
| `{$OCI.COST.DAILY.LIMIT}`      | Limite diário de custo em BRL |

Exemplo:

```text
{$OCI.API.USAGE.HOST}
usageapi.sa-saopaulo-1.oci.oraclecloud.com

{$OCI.API.HTTP.PROXY}
<deixe vazio se não utilizar proxy>

{$OCI.HTTP.RESPONSE.CODE.OK}
200

{$OCI.COST.DAILY.LIMIT}
1
```

A macro `{$OCI.API.PRIVATE.KEY}` deve ser configurada como **Secret text**.

O valor padrão `1` para `{$OCI.COST.DAILY.LIMIT}` existe apenas para facilitar testes após a instalação. Em produção, configure o limite desejado.

---

## Proxy HTTP

O template suporta ambientes onde o Zabbix não possui acesso direto à Internet.

Configure:

```text
{$OCI.API.HTTP.PROXY}
```

Exemplo:

```text
http://proxy.exemplo.local:8080
```

### Sem proxy

```text
Zabbix ───── HTTPS/TLS ─────> OCI
```

### Com proxy

```text
Zabbix ── HTTP Proxy ── HTTPS/TLS ──> OCI
```

O proxy é opcional. Caso não seja utilizado, deixe a macro vazia.

O proxy deve permitir acesso HTTPS ao endpoint:

```text
usageapi.<regiao>.oci.oraclecloud.com
```

---

## Itens

O template possui quatro itens:

| Item                        | Key                      | Unidade | Descrição                    |
| --------------------------- | ------------------------ | ------- | ---------------------------- |
| **OCI Cost: Current Month** | `oci.cost.current_month` | BRL     | Custo acumulado do mês atual |
| **OCI Cost: Today**         | `oci.cost.today`         | BRL     | Custo do dia atual           |
| **OCI Cost: Yesterday**     | `oci.cost.yesterday`     | BRL     | Custo do dia anterior        |
| **OCI Cost: 2 Days Ago**    | `oci.cost.2days_ago`     | BRL     | Custo de dois dias antes     |

Cada item é do tipo **Script** e realiza sua própria consulta à OCI Usage API.

Os itens são executados uma vez por hora, com intervalo de 10 minutos entre as consultas:

```text
00:00 → Current Month
00:10 → Today
00:20 → Yesterday
00:30 → 2 Days Ago
```

O ciclo se repete a cada hora.

---

## Custo de hoje

O item `OCI Cost: Today` considera **somente o dia atual em UTC**.

Caso a OCI ainda não tenha disponibilizado os dados do dia atual, o item retorna:

```text
0 BRL
```

O valor de ontem não é utilizado como substituto.

Além disso, os itens diários validam a data retornada pela API através do campo `timeUsageStarted`, evitando que dados de outro dia sejam contabilizados incorretamente.

A Usage API da OCI permite consultas por granularidade, incluindo `DAILY` e `MONTHLY`, e utiliza intervalos de início inclusivo e fim exclusivo.

---

## Triggers

O template possui duas triggers, ambas com severidade **Atenção**.

### Custo de hoje

```text
OCI Custo: Custo de hoje atingiu o limite diário de {$OCI.COST.DAILY.LIMIT} BRL
```

```text
last(/Oracle Cloud Cost by HTTP/oci.cost.today)>={$OCI.COST.DAILY.LIMIT}
```

### Custo de ontem

```text
OCI Custo: Custo de ontem atingiu o limite diário de {$OCI.COST.DAILY.LIMIT} BRL
```

```text
last(/Oracle Cloud Cost by HTTP/oci.cost.yesterday)>={$OCI.COST.DAILY.LIMIT}
```

As triggers são independentes e utilizam a mesma macro de limite:

```text
{$OCI.COST.DAILY.LIMIT}
```

---

## Segurança

Nunca publique no GitHub:

* Private Key
* Senhas
* Tokens
* PFX contendo chave privada
* PEM contendo chave privada
* Arquivos de credenciais

O template utiliza a chave privada somente para assinar as requisições à OCI.

Recomenda-se:

* utilizar um usuário dedicado;
* utilizar um grupo IAM dedicado;
* aplicar o princípio do menor privilégio;
* armazenar a chave privada como **Secret text** no Zabbix;
* nunca incluir credenciais reais no arquivo YAML publicado.

---

## Uso em conjunto com o template oficial da OCI

Para um monitoramento completo da OCI, recomenda-se utilizar os dois templates:

```text
Oracle Cloud by HTTP
        +
Oracle Cloud Cost by HTTP
```

### Oracle Cloud by HTTP

Utilize o template oficial do Zabbix para monitorar a infraestrutura e os serviços OCI, incluindo recursos como:

* Compute
* Autonomous Database
* VCN / Networking
* Block Volumes
* Boot Volumes
* Object Storage

O template oficial utiliza Script items para realizar as chamadas às APIs da OCI e possui descoberta dos recursos suportados.

### Oracle Cloud Cost by HTTP

Utilize este template especificamente para:

* Custo mensal
* Custo diário
* Custo de ontem
* Custo de dois dias atrás
* Alertas de limite diário

Dessa forma, os templates possuem responsabilidades complementares:

```text
┌──────────────────────────────────────┐
│        Oracle Cloud by HTTP          │
│                                      │
│ Compute • VCN • Storage • Database   │
│ Recursos e infraestrutura OCI        │
└──────────────────────────────────────┘
                    +
┌──────────────────────────────────────┐
│      Oracle Cloud Cost by HTTP       │
│                                      │
│ Mês • Hoje • Ontem • 2 dias atrás    │
│ Custos e alertas financeiros         │
└──────────────────────────────────────┘
```

---

## API utilizada

Endpoint:

```text
https://usageapi.<region>.oci.oraclecloud.com/20200107/usage
```

Exemplo para São Paulo:

```text
https://usageapi.sa-saopaulo-1.oci.oraclecloud.com/20200107/usage
```

A Usage API é a API oficial da OCI para recuperação de dados de uso e custo.

---

## Compatibilidade

| Informação   | Valor               |
| ------------ | ------------------- |
| Zabbix       | 7.0 LTS             |
| OCI API      | Usage API           |
| Autenticação | API Key             |
| Assinatura   | RSA-SHA256          |
| Transporte   | HTTPS/TLS           |
| Moeda        | BRL                 |
| Proxy        | Opcional            |
| Itens        | 4                   |
| Triggers     | 2                   |
| Frequência   | 1 vez/hora por item |

---

## Licença

Distribuído sob a licença **MIT**.

---

## Referências

* [Oracle Cloud Infrastructure — Cost Analysis](https://docs.oracle.com/en-us/iaas/Content/Billing/Concepts/costanalysisoverview.htm)
* [Oracle Cloud Infrastructure — IAM Policies](https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/policies.htm)
* [Oracle Cloud Infrastructure — API Signing](https://docs.oracle.com/en-us/iaas/Content/API/Concepts/signingrequests.htm)
* [Zabbix — Oracle Cloud by HTTP](https://www.zabbix.com/integrations/oracle_cloud)
* [Zabbix — Community Templates](https://www.zabbix.com/documentation/guidelines/en/thosts/community_templates)
