try {
	const params = JSON.parse(value);
	const url = params.GanetiRAPIProtocol + '://' + params.GanetiMaster + ':' + params.GanetiRAPIPort + '/2/instances/' + params.Instance + '';

	request = new HttpRequest();
        request.addHeader('Authorization: Basic ' + btoa(params.Username + ":" + params.Password));
	
        response = request.get(url);
        response = JSON.parse(response);

	return response.pnode + ':' + response.network_port ;
}catch (error) {
	Zabbix.log(4, '[Ganeti Instances] Info failed: ' + error);
	throw error;	
}