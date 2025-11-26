#!/usr/bin/python3

from pprint import PrettyPrinter, pformat
from xml import dom
from pyzabbix import ZabbixMetric, ZabbixSender
from socket import gaierror
from requests.adapters import HTTPAdapter, Retry
from requests.exceptions import SSLError
from urllib.error import HTTPError
from urllib.request import ssl, socket
from json.decoder import JSONDecodeError
from cryptography import x509
import datetime
import sys
import argparse
import logging
import requests
import checkdmarc
import ssl
import sslpsk
import functools
import dns.resolver

class DmMetrics:
    """Collects metrics for domains and provides calc functions

    Returns:
        _type_: _description_
    """
    
    ## Prepare Metrics
    # Overall counts
    domains_cert_checks_enabled = 0
    domains_dns_checks_enabled = 0
    
    # Succeeded check counts
    domains_cert_trusted = 0
    domains_dns_spf_present = 0
    domains_dns_dmarc_present = 0
    domains_dns_dnssec_enabled = 0
    
    def get_metrics(self):
        """
        returns dict with metrics
        """
        metrics = {}
        
        ## CERT
        # not counted anything /error
        if self.domains_cert_checks_enabled == 0:
            metrics['percent_cert_trusted'] = 0
        else:
            # calc %
            metrics['percent_cert_trusted'] = round( (self.domains_cert_trusted / self.domains_cert_checks_enabled * 100),2)
        
        ## DNS
        if self.domains_dns_checks_enabled == 0:
            metrics['percent_spf_present'] = 0
            metrics['percent_dmarc_present'] = 0
            metrics['percent_dnssec_enabled'] = 0
        else:
            # calc %
            metrics['percent_spf_present'] = round( (self.domains_dns_spf_present / self.domains_dns_checks_enabled * 100),2)
            metrics['percent_dmarc_present'] = round( (self.domains_dns_dmarc_present / self.domains_dns_checks_enabled * 100),2)
            metrics['percent_dnssec_enabled'] = round( (self.domains_dns_dnssec_enabled / self.domains_dns_checks_enabled * 100),2)
        
        return metrics    
         
        


class PyZabbixPSKSocketWrapper:
    """Implements ssl.wrap_socket with PSK instead of certificates.
    Proxies calls to a `socket` instance.
    Needed for enabling sending encrypted results to Zabbix Server
    """

    def __init__(self, sock, *, identity, psk):
        self.__sock = sock
        self.__identity = identity
        self.__psk = psk

    def connect(self, *args, **kwargs):
        # `sslpsk.wrap_socket` must be called *after* socket.connect,
        # while the `ssl.wrap_socket` must be called *before* socket.connect.
        self.__sock.connect(*args, **kwargs)

        # `sslv3 alert bad record mac` exception means incorrect PSK
        self.__sock = sslpsk.wrap_socket(
            self.__sock,
            # https://github.com/zabbix/zabbix/blob/f0a1ad397e5653238638cd1a65a25ff78c6809bb/src/libs/zbxcrypto/tls.c#L3231
            ssl_version=ssl.PROTOCOL_TLSv1_2,
            # https://github.com/zabbix/zabbix/blob/f0a1ad397e5653238638cd1a65a25ff78c6809bb/src/libs/zbxcrypto/tls.c#L3179
            ciphers="PSK-AES128-CBC-SHA",
            psk=(self.__psk, self.__identity),
        )

    def __getattr__(self, name):
        return getattr(self.__sock, name)

def domain_a_record_exists(domain_name):
    """
    Check if A record of domains exists
    """
        
    try:
        resolver = dns.resolver.Resolver(configure=True)
        resolver.resolve(domain_name, "A")
        return True
    except dns.resolver.NXDOMAIN:
        return False
    except dns.resolver.NoAnswer:
        return False
    except dns.resolver.NoNameservers:
        return False

def domain_mx_record_exists(domain_name):
    """
    Check if MX record of domains exists
    """
        
    try:
        resolver = dns.resolver.Resolver(configure=True)
        resolver.resolve(domain_name, "MX")
        return True
    except dns.resolver.NXDOMAIN:
        return False
    except dns.resolver.NoAnswer:
        return False
    except dns.resolver.NoNameservers:
        return False    

def domain_exists(domain_name):
    """
    Tries to find out if domain exists leveraging different DNS checks
    """
    if domain_a_record_exists(domain_name):
        return True
    if domain_mx_record_exists(domain_name):
        return True
    else:
        return False
    
def get_domain_file(dm_args):
    """downloads json file with domain defintions
    """
    l.info("Fetching domain file from %s", dm_args.file_url)
    headers = {}

    # Set header for retrieving raw contents from github. without only metadta received.
    headers['Accept'] = 'application/vnd.github.raw+json'
    
    # If provided, set Bearer token for authenticated download (Github personal access token)
    if dm_args.auth_token:
        headers['Authorization'] = f"Bearer {dm_args.auth_token}"

    try:
        r = requests.get(url=dm_args.file_url, headers=headers, timeout=5)
        if r.status_code == 200:
            data = r.json()
            l.debug("Downloaded json domain file: %s", data)
            return data
        else:
            l.fatal("Received Status Code not OK: %s Auth. needed? URL correct?", r.status_code)
            exit(-1)

    except HTTPError as http_e:
        l.fatal("Error fetching domains file: %s", str(http_e))
        exit(-1)
    except JSONDecodeError as json_e:
        l.fatal("Error parsing domains file: %s", str(json_e))
        exit(-1)


def check_cert_expire_days(domain_name):
    """Retrieves certificate of domain name and extracts issuer and valid days.

    Args:
        domain_name (str): domain name to connect and to check
    """
    check_result = {}
    
    try:
        ctx = ssl.create_default_context()

        # do not fail on self signed certs
        ctx.check_hostname = False
        ctx.verify_mode = ssl.CERT_NONE
        
        # assume default port 443
        conn = ctx.wrap_socket(socket.socket(socket.AF_INET),
                           server_hostname=domain_name)
        conn.connect((domain_name, 443))
        
        # if self-signed, only call with binary_form=true contains certificate (?)
        cert_bin = conn.getpeercert(binary_form=True)
        cert = x509.load_der_x509_certificate(cert_bin)
        
        l.debug("Cert received:\n %s", cert.subject)
        
        certExpireDays = (cert.not_valid_after - datetime.datetime.now()).days
        check_result['cert_expire_days'] = certExpireDays
        
        issuer = cert.issuer.get_attributes_for_oid(x509.NameOID.COMMON_NAME)
        check_result['cert_issuer'] = issuer[0].value
        
    except gaierror as e_nosrv:
        l.error("Error Checking SSL cert for %s: %s",
                domain_name, str(e_nosrv))
        check_result['cert_expire_days'] = f"Error: Could not connect"
        check_result['cert_issuer'] = f"Error: Could not connect"
    except Exception as e:
        l.error("Error Checking SSL cert for %s: %s", domain_name, str(e))
        check_result['cert_expire_days'] = f"Error: {str(e)}"
        check_result['cert_issuer'] = f"Error: {str(e)}"
        
    return check_result


def check_cert_trusted(domain_name, metrics: DmMetrics):
    """Connects to hostname per https. If cert cannot be verified, return false.

    Args:
        domain_name (str): domain name to connect and to check
        metrics (dmMetrics): Metrics Object to update
    """
    check_result = {}
    
    # Only try once
    s = requests.Session()
    retries = Retry(total=1)
    s.mount('http://', HTTPAdapter(max_retries=retries))

    try:
        r = s.get(f"https://{domain_name}", verify=True, timeout=4)
        if r.ok:
            check_result['cert_trusted'] = True
            l.debug("Cert of %s is trusted", domain_name)
            metrics.domains_cert_trusted += 1
        if r.status_code == 403:
            metrics.domains_cert_trusted += 1
            check_result['cert_trusted'] = True
            l.warning("Cert of %s is trusted, but connect was forbidden!", domain_name)

    except SSLError as e_ssl:
        l.warning("Cert of %s is NOT trusted: %s", domain_name, str(e_ssl))
        check_result['cert_trusted'] = False
    except requests.exceptions.ConnectionError as e_connect:
        l.warning("Error: Could not connect to %s: %s",
                  domain_name, str(e_connect))
        check_result['cert_trusted'] = "Error: Could not connect"
    except Exception as e_other:
        l.warning("Error: Could not connect to %s: %s",
                  domain_name, str(e_other))
        check_result['cert_trusted'] = "Error: Could not connect"

    return check_result


def check_spf_present(domain_name, metrics: DmMetrics):
    """Checks if Domain name has valid SPF record

    Args:
        domain_name (str): Domain to check for SPF
        metrics (dmMetrics): Metrics Object to update
    """
    
    check_result = {}
    
    try:
        spf_check_result = checkdmarc.query_spf_record(domain_name)
        l.info("Found SPF record for %s", domain_name)
        check_result['spf_present'] = True
        metrics.domains_dns_spf_present += 1
    
    except checkdmarc.SPFRecordNotFound as e_spf:
        l.debug("No SPF record found for %s: %s", domain_name, str(e_spf))
        check_result['spf_present'] = False

    return check_result


def check_dmarc_present(domain_name, metrics: DmMetrics):
    """Checks if Domain name has valid DMARC record

    Args:
        domain_name (str): Domain to check for DMARC
        metrics (dmMetrics): Metrics Object to update
    """
    check_result = {}
    if not domain_exists(domain_name):
        l.warning("Error: Could not connect to %s", domain_name)
        check_result['dmarc_present'] = "Error: Could not connect"
        return check_result
    
    try:
        dmarc_check_result = checkdmarc.query_dmarc_record(domain_name)
        l.info("Found DMARC record for %s: %s", domain_name, str(dmarc_check_result))
        check_result['dmarc_present'] = True
        metrics.domains_dns_dmarc_present += 1
    except checkdmarc.DMARCRecordNotFound as e_dmarc:
        l.debug("No DMARC record found for %s: %s", domain_name, str(e_dmarc))
        check_result['dmarc_present'] = False
    except (checkdmarc.DMARCRecordInWrongLocation, checkdmarc.MultipleDMARCRecords, checkdmarc.SPFRecordFoundWhereDMARCRecordShouldBe):
        l.debug("No VALID DMARC record found for %s", domain_name)
        check_result['dmarc_present'] = False

    return check_result


def check_dnssec_enabled(domain_name, metrics: DmMetrics):
    """Checks if Domain name has DNSSEC enabled

    Args:
        domain_name (str): Domain to check for DNSSEC
        metrics (dmMetrics): Metrics Object to update
    """
    check_result = {}
    dnssec_enabled = checkdmarc.test_dnssec(domain_name)
    if (dnssec_enabled):
        l.info("DNSSEC enabled for %s", domain_name)
        check_result['dnssec_enabled'] = True
        metrics.domains_dns_dnssec_enabled += 1
    else:
        l.debug("DNSSEC NOT enabled for %s", domain_name)
        check_result['dnssec_enabled'] = False

    return check_result


def send_zabbix(dm_args, domains_with_check_results):
    """Sends all Check results to Zabbix Server via zabbix send / trapper.
    Items need to be prepared on Zabbix to receive values.

    Args:
        check_results (dict): dict with domains and check results
        dm_args (Namespace): All cmd line parameters incl. z server / host / psk
    """

    # prepare packet to send
    zabbix_packet = []
    
    # for all domains
    for entry in domains_with_check_results['domains']:
        # for all check results
        domain_name = entry['domain']
        for cr in entry['check_results'].keys():
            keyname = f"dm.{cr}[{domain_name}]"
            val = entry['check_results'][cr]
            chunk = ZabbixMetric(host=dm_args.zabbix_host, key=keyname, value=val)
            zabbix_packet.append(chunk)
            l.debug("item %s=%s", keyname, val)

    # for all metrics
    for entry in domains_with_check_results['metrics']:
        val = domains_with_check_results['metrics'][entry]
        keyname = f"dm.{entry}"
        
        chunk = ZabbixMetric(host=dm_args.zabbix_host, key=keyname, value=val)
        zabbix_packet.append(chunk)
        l.debug("item %s=%s", keyname, val)
    
    
    # send via trapper, check if psk provided
    if dm_args.psk:
        l.debug("Sending Trapper Items encrpyted using PSK and TLS Identity...")
        zbx = ZabbixSender(zabbix_server=dm_args.zabbix_server,
                           socket_wrapper=functools.partial(
                               PyZabbixPSKSocketWrapper,
                               identity=dm_args.psk_id,
                               psk=bytes.fromhex(dm_args.psk),
                           )
                           )

    else:
        # no encrypted connection needed, send plain
        l.debug("Sending Trapper Items unencrpyted...")
        zbx = ZabbixSender(
            zabbix_server=dm_args.zabbix_server, use_config=None)

    try:
        zbx_result = zbx.send(zabbix_packet)
        l.debug("Zabbix response: %s", zbx_result)
        l.info("Sent %s check results to Zabbix Server", len(zabbix_packet))
    except Exception as e:
        l.error("Error sending to Zabbix: %s. Hint: Using PSK Macros although ZBX connection needs to be unencrypted?", str(e))


def main():
    """
    Start main program
    """
    # Prepare arguments to be parsed
    argparser = argparse.ArgumentParser(
        prog='Zabbix Domain Monitor',
        description='Fetches json with domains from URL and executes checks for each domain. Sends results to Zabbix.',
        epilog='Example: dm-check -f https://api.github.com/x/x/domains.json -a token123 -s 192.168.100.50 -d agent --std-out -v')
    argparser.add_argument('-f', '--file-url', required=True,
                           help='URL to file with domain definitions')
    argparser.add_argument('-a', '--auth-token', required=False,
                           help="Bearer Token for HTTP request when downloading file")

    argparser.add_argument('-s', '--zabbix-server', required=False,
                           help='IP of Zabbix Server to send Check results')
    argparser.add_argument('-d', '--zabbix-host', required=False,
                           help='Display Name of Host on Zabbix which is expecting check results')

    argparser.add_argument('--psk-id', required=False,
                           help='PSK ID to use when sending to Zabbix Server')
    argparser.add_argument('--psk', required=False,
                           help='PSK / Key to use when sending to Zabbix Server')

    argparser.add_argument('--log-stdout', action="store_true", required=False,
                           help="Also log to stdout beside log file. For debugging")
    argparser.add_argument(
        '-v', '--verbose', action="store_true", help='log additional debug info')

    # execute cmd arg parser
    dm_args = argparser.parse_args()

    # init logging to file with std. log level
    global l
    l = logging.getLogger(__name__)
    # ensure not conflicting with logger of imported modules
    l.propagate = False

    # increase log level if set on cmd line
    if dm_args.verbose:
        l.setLevel(logging.DEBUG)
    else:
        l.setLevel(logging.CRITICAL)

    log_format = logging.Formatter(
        fmt='%(asctime)s [%(levelname)s] %(message)s', datefmt='%m/%d/%Y %H:%M:%S')
    file_log_handler = logging.FileHandler(filename='log/dm.log', encoding='utf-8')
    file_log_handler.setFormatter(log_format)
    l.addHandler(file_log_handler)

    # also log to std out if requested by parameter
    if dm_args.log_stdout:
        stdout_log_handler = logging.StreamHandler(sys.stdout)
        stdout_log_handler.setFormatter(log_format)
        l.addHandler(stdout_log_handler)

    l.info("-------- Starting Domain Monitor --------")
    l.debug("Parsed arguments: %s", dm_args)

    


    # read and parse domain file
    domains_with_check_results = get_domain_file(dm_args)
    
    # Prepare Metrics
    metrics = DmMetrics()
    
    ### Main loop executing checks for each domain
    for entry in domains_with_check_results['domains']:
        # prepare results branch
        if not 'check_results' in entry:
            entry['check_results'] = {}
        domain_name = entry['domain']
        l.debug("----- Checks for %s starting...", domain_name)
        
        # Pre-Check: Only continue if domain exists / can be queried
        if not domain_exists(domain_name):
            l.error("Domain %s does not exist. Not executing checks.", domain_name)
            error_str = "Error: Could not connect"
            # add error as result for enabled checks
            if 'cert_checks' in entry and entry['cert_checks']:
                entry['check_results']['cert_expire_days'] = error_str
                entry['check_results']['cert_issuer'] = error_str
                entry['check_results']['cert_trusted']= error_str
            if 'dns_checks' in entry and entry['dns_checks']:
                entry['check_results']['spf_present']= error_str
                entry['check_results']['dmarc_present']= error_str
                entry['check_results']['dnssec_enabled']= error_str
            # end loop for this domain
            continue
        
        # Execute Cert checks if enabled
        if 'cert_checks' in entry and entry['cert_checks']:
            l.debug("Cert Checks for %s enabled, executing cert checks...", domain_name)
            
            # Count domain to checked cert domains
            metrics.domains_cert_checks_enabled += 1

            # check domains for ssl cert validity
            l.debug("Checking validity for domain %s", domain_name)
            entry['check_results'].update(check_cert_expire_days(domain_name))

            # check domains for cert trust
            l.debug("Checking trust for domain %s", domain_name)
            entry['check_results'].update(check_cert_trusted(domain_name, metrics))
        else:
            l.debug("Cert Checks for %s not enabled", domain_name)

        if 'dns_checks' in entry and entry['dns_checks']:
            l.debug(
                "DNS Checks for %s enabled, executing DNS checks...", domain_name)
            
            # Count domain to checked DNS domains
            metrics.domains_dns_checks_enabled += 1

            # check for SPF presence
            l.debug("Checking SPF for domain %s", domain_name)
            entry['check_results'].update(check_spf_present(domain_name, metrics))

            # check for DMARC presence
            l.debug("Checking DMARC for domain %s", domain_name)
            entry['check_results'].update(check_dmarc_present(domain_name, metrics))

            # check for DNSSEC
            l.debug("Checking DNSSEC for domain %s", domain_name)
            entry['check_results'].update(check_dnssec_enabled(domain_name, metrics))
        else:
            l.debug("DNS Checks for %s not enabled", domain_name)

    # Add calculated metrics to final dict
    domains_with_check_results['metrics'] = metrics.get_metrics()
    
    # If parameters are present, send results to Zabbix trapper items
    if dm_args.zabbix_server:
        if not dm_args.zabbix_host:
            l.error("Zabbix Host not set. Use -d <hostname> to set")

        else:
            l.info("Sending check results to Zabbix Server %s for host %s...",
                   dm_args.zabbix_server, dm_args.zabbix_host)
            send_zabbix(dm_args, domains_with_check_results)
    else:
        l.debug("Zabbix Server not set. Not sending to Zabbix.")

    
    
    
    # output final result = domain file with enriched check results
    pp = PrettyPrinter(indent=4, width=80, depth=4, compact=False)
    pretty_result = pp.pformat(domains_with_check_results)
    l.info("\n%s", pretty_result)

    exit(0)


if __name__ == '__main__':
    main()
