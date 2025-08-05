# Descoberta do site VPN um site Sophos XG/SFOS IPsec

## Resumo

Este modelo é uma versão preparada do modelo oficial da comunidade para Sophos XG v18.

A partir da versão 20, é possível monitorar redes VPN IPsec, mas manualmente criando cada item. Criei a regra de descoberta para as VPNs para que as conexões sejam descobertas e relacionadas no monitoramento.

* **Fonte do modelo original:** 

Esta versão inclui todos os recursos originais, além de uma nova regra Low-Level Discovery (LLD) para túneis VPN IPsec Site-to-Site.

## Versão Zabbix

Testado em **Zabbix 7,0**.

---

### Novo recurso adicionado: descoberta do site VPN IPsec um site

Esta regra LLD descobre automaticamente todos os túneis IPsec configurados em um firewall Sophos (SFOS) e cria itens e gatilhos para monitorar seu status.

**Itens descobertos:**
* **Status da conexão:** Monitoro o status da conexão em tempo real (ativo, inativo, parcialmente ativo) usando o OID `1.3.6.1.4.1.2604.5.1.6.1.1.1.1.9`.
* **Status de ativação:** Monitore se o túnel está habilitado ou desativado na configuração do firewall usando o OID `1.3.6.1.4.1.2604.5.1.6.1.1.10`.

**Protótipos de gatilho:**
* Incluir um gato inteligente que só menospreza se um túnel estiver **Habilitado**, mas seu status de conexão para **Não Ativo (1)**. Essa lógica evita falsos positivos para backup ou links VPN desativados intencionalmente.

---

### Instruções de configuração

1. . **Importar o arquivo de modelo** (`modelo_sophos_xg_ipsec_vpn.yaml`) para sua instância do Zabbix em `Configuração - > Modelos`. . . . . 2. . Mapas de valores já criados nos modelos:

* **Nome:** `Status da conexão VPN da Sophos`
* `0` -> `Inativo`
* `1` -> `Ativo`
* `2` -> `Parcialmente Ativo`

* **Nome:** `Status de ativação do Sophos VPN`
* `0` -> `Inativo`
* `1` -> `Ativo`

3. **Vincule o modelo** ao seu host Sophos Firewall.
4. . **Configurar uma macro `{$SNMP_COMMUNITY}` no host com sua string de comunidade SNMP.
