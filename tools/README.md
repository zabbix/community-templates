
# Tools

## renew_uuids.py

Notice that from Zabbix version 5.4 and onwards, templates
[requires unique uuid values](https://support.zabbix.com/browse/ZBXNEXT-6411).
This means that if you want to create a new template based on an existing
template with just a few modifications (e.g. very typical for printer templates)
then you need to replace all the existing uuid values with new values in your
new template. The `renew_uuids.py` script makes that trivially simple.

### Example usage

Creating a new `template_nginx_for_zabbix_5.0` based on the existing 4.0 template:

```shell
$ cd Applications/Web-servers
$ cp -a template_nginx_for_zabbix_4.0 template_nginx_for_zabbix_5.0
$ cd template_nginx_for_zabbix_5.0/5.0
$ mv template_nginx_for_zabbix_4.0.xml template_nginx_for_zabbix_5.0.xml
$ cd ../5.4
$ mv template_nginx_for_zabbix_4.0.yaml template_nginx_for_zabbix_5.0.yaml
$ ../../../../tools/renew_uuids.py --help      # Optional
$ ../../../../tools/renew_uuids.py --input template_nginx_for_zabbix_5.0.yaml --output newfile
$ kdiff3 template_nginx_for_zabbix_5.0.yaml newfile      # (optional) review
$ mv newfile template_nginx_for_zabbix_5.0.yaml
$ ... # whatever further changes are needed to update to 5.0 ...
```
