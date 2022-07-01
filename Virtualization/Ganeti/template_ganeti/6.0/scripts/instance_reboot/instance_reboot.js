try {
	const params = JSON.parse(value);
	const url = params.GanetiRAPIProtocol + '://' + params.GanetiMaster + ':' + params.GanetiRAPIPort + '/2/instances/' + params.Instance + '/reboot';

	request = new HttpRequest();
        request.addHeader('Authorization: Basic ' + btoa(params.Username + ":" + params.Password));
        data = JSON.stringify({});
	
        response = request.post(url);
        response = JSON.parse(response);

	return 'Instance ' + params.Instance + ' rebooted';
}catch (error) {
	Zabbix.log(4, '[Ganeti Instances] Info failed: ' + error);
	throw error;	
}