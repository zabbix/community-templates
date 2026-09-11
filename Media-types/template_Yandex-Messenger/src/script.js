var Yandex = {
    token: null,
    to: null,
    message: null,
    proxy: null,
    parse_mode: null,
    event: null,
    severity: null,

    escapeMarkup: function (str, mode) {
        switch (mode) {
            case 'markdown':
                return str.replace(/([_*\[`])/g, '\\$&amp;');

            case 'markdownv2':
                return str.replace(/([_*\[\]()~`&gt;#+\-=|{}.!])/g, '\\$&amp;');

            default:
                return str;
        }
    },

    sendMessage: function () {
        var params = {
            login: Yandex.to,
            text: Yandex.message,
            disable_web_page_preview: true,
            //payload_id: Yandex.event,
            //important: true,
            //disable_notification: true
            important: Yandex.severity
        },
        data,
        response,
        request = new HttpRequest(),
        url = 'https://botapi.messenger.yandex.net/bot/v1/messages/sendText/';

        if (Yandex.parse_mode !== null) {
            params['parse_mode'] = Yandex.parse_mode;
        }

        if (Yandex.proxy) {
            request.setProxy(Yandex.proxy);
        }
        request.addHeader('Content-Type: application/json');
        request.addHeader('Authorization: OAuth ' + Yandex.token);
        data = JSON.stringify(params);

        // Remove replace() function if you want to see the exposed token in the log file.
        Zabbix.log(4, '[Yandex Webhook] URL: ' + url.replace(Yandex.token, '&lt;TOKEN&gt;'));
        Zabbix.log(4, '[Yandex Webhook] params: ' + data);
        response = request.post(url, data);
        Zabbix.log(4, '[Yandex Webhook] HTTP code: ' + request.getStatus());

        try {
            response = JSON.parse(response);
        }
        catch (error) {
            response = null;
        }

        if (request.getStatus() !== 200 || typeof response.ok !== 'boolean' || response.ok !== true) {
            if (typeof response.description === 'string') {
                throw response.description;
            }
            else {
                throw 'Unknown error. Check debug log for more information.';
            }
        }
    }
};

try {
    var params = JSON.parse(value);

    if (params.Severity === 'Disaster' || params.Severity === 'High') {
        Yandex.severity = true;
    }
    else {
        Yandex.severity = false;
    }

    if (typeof params.Token === 'undefined') {
        throw 'Incorrect value is given for parameter &quot;Token&quot;: parameter is missing';
    }

    Yandex.token = params.Token;

    if (params.HTTPProxy) {
        Yandex.proxy = params.HTTPProxy;
    }

    params.ParseMode = params.ParseMode.toLowerCase();

    if (['markdown', 'html', 'markdownv2'].indexOf(params.ParseMode) !== -1) {
        Yandex.parse_mode = params.ParseMode;
    }

    Yandex.to = params.To.toLowerCase();
    Yandex.event = params.Event;

    Yandex.message = params.Subject + '\n' + params.Message + '\n' + 'ID: ' + params.Event;

    if (['markdown', 'markdownv2'].indexOf(params.ParseMode) !== -1) {
        Yandex.message = Yandex.escapeMarkup(Yandex.message, params.ParseMode);
    }

    Yandex.sendMessage();

    return 'OK';
}
catch (error) {
    Zabbix.log(4, '[Yandex Webhook] notification failed: ' + error);
    throw 'Sending failed: ' + error + '.';
}