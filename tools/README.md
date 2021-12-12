
Notice that from Zabbix version 5.4 and onwards, templates
[requires unique uuid values](https://support.zabbix.com/browse/ZBXNEXT-6411).
This means that if you want to create a new template based on an existing
template with just a few modifications (e.g. very typical for printer templates)
then you need to replace all the existing uuid values with new values in your
new template. The `renew_uuids.py` script makes that trivially simple.
