try {
	const params = JSON.parse(value);
	const url = params.GanetiRAPIProtocol + '://' + params.GanetiMaster + ':' + params.GanetiRAPIPort + '/2/instances/' + params.Instance + '/shutdown';

	request = new HttpRequest();
        request.addHeader('Authorization: Basic ' + btoa(params.Username + ":" + params.Password));
	
        response = request.put(url);
        response = JSON.parse(response);

	return 'Instance ' + params.Instance + ' stopped';
}catch (error) {
	Zabbix.log(4, '[Ganeti Instances] Info failed: ' + error);
	throw error;	
}