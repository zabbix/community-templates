Zabbix.log(4, 'Starting Domain Monitor discovery...');

// init return
var result = {};
var file_contents;

try {

    // get parameters from Zabbix Server Template
    var params = JSON.parse(value);
    Zabbix.log(4, 'Getting domain file from ' + params['DM_DOMAIN_FILE']);

    // Prepare http request with needed headers / auth for github
    var req = new HttpRequest();
    req.addHeader('Accept: application/vnd.github.raw+json');
    req.addHeader('Authorization: Bearer ' + params['DM_GIT_TOKEN']);
    req.addHeader('User-Agent: Zabbix Script API');

    // get content of file
    file_contents = req.get(params['DM_DOMAIN_FILE']);

} catch (error) {
    Zabbix.log(4, 'DM error fetching domains: ' + error);
    result = { "Error downloading file": String(error) };
}

try {
    Zabbix.log(4, 'Parsing domain file...');
    var result_json = JSON.parse(file_contents);

    // create domain entry for each domain in json file
    var domainList = result_json.domains;
    result = [];
    for (var i = 0; i < domainList.length; i++) {
        var entry = {};
        if (domainList[i].cert_checks) {
            entry = {
                "{#DM_CERTCHECK_DOMAIN_NAME}": domainList[i].domain,
                "{#DM_CERTCHECK_DOMAIN_DESC}": domainList[i].description,
            }
            result.push(entry);
        }
        if (domainList[i].dns_checks) {
            entry = {
                "{#DM_DNSCHECK_DOMAIN_NAME}": domainList[i].domain,
                "{#DM_DNSCHECK_DOMAIN_DESC}": domainList[i].description,
            }
            result.push(entry);
        }
        else {
            Zabbix.log(4, 'Domain ' + domainList[i].domain + ' not enabled for any checks. Not adding.');
        }
    }


} catch (error) {
    Zabbix.log(4, 'DM error parsing domains: ' + error);
    Zabbix.log(4, 'File contents downloaded: ' + file_contents);
    result = { "Error parsing file" : String(error) };
}


return JSON.stringify(result);