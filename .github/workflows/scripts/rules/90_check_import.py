#!/usr/bin/env python

import time
import json
from ruamel.yaml import YAML
from lxml import etree
from zabbix_utils import ZabbixAPI, APIRequestError
from zabbix_utils.version import __max_supported__

yaml = YAML()
yaml.indent(mapping=2, sequence=4, offset=2)
yaml.preserve_quotes = False
yaml.width = 4096


def run_check(skip: bool = False) -> dict:
    """
    Check able to import template to Zabbix instance.
    """
    step_name = 'Check import to Zabbix instance'
    if skip:
        return {
            'step': step_name,
            'status': 'skip',
            'message': ''
        }

    for x in range(10):
        try:
            zapi = ZabbixAPI(
                url="http://localhost:8080", validate_certs=False)
            zapi.login(user="Admin", password="zabbix")
        except:
            time.sleep(3)
        else:
            break
    else:
        return {
            'step': step_name,
            'status': 'error',
            'message': f'Failed to wait for Zabbix API to be ready'
        }

    with open('.github/outputs/all_changed_files.json', 'r') as file_list:
        changed_files = json.load(file_list)
    try:
        for file in changed_files:
            with open(file, 'r', encoding='utf-8') as read_file:
                if file.endswith(('.yaml', '.YAML')):
                    try:
                        data_obj = yaml.load(read_file)
                        if 'zabbix_export' in data_obj and 'templates' in data_obj['zabbix_export']:
                            file_type = 'template'
                    except:
                        pass

                elif file.endswith(('.json', '.JSON')):
                    try:
                        data_obj = json.load(read_file)
                        if 'zabbix_export' in data_obj and 'templates' in data_obj['zabbix_export']:
                            file_type = 'template'
                    except:
                        pass

                elif file.endswith(('.xml', '.XML')):
                    try:
                        data_obj = etree.fromstring(read_file.read())
                        if data_obj.xpath('//zabbix_export/templates'):
                            file_type = 'template'
                    except:
                        pass

                else:
                    file_type = 'unknown'

            if file_type == 'template':
                json_data = """
                {
                "rules": {
                    "hosts": {
                    "createMissing": true,
                    "updateExisting": true
                    },
                    "templates": {
                    "createMissing": true,
                    "updateExisting": true
                    },
                    "templateLinkage": {
                    "createMissing": true,
                    "deleteMissing": true
                    },
                    "discoveryRules": {
                    "createMissing": true,
                    "updateExisting": true,
                    "deleteMissing": true
                    },
                    "items": {
                    "createMissing": true,
                    "updateExisting": true,
                    "deleteMissing": true
                    },
                    "triggers": {
                    "createMissing": true,
                    "updateExisting": true,
                    "deleteMissing": true
                    },
                    "graphs": {
                    "createMissing": true,
                    "updateExisting": true,
                    "deleteMissing": true
                    },
                    "maps": {
                    "createMissing": true,
                    "updateExisting": true
                    },
                    "images": {
                    "createMissing": true,
                    "updateExisting": true
                    },
                    "valueMaps": {
                    "createMissing": true,
                    "updateExisting": true
                    },
                    "templateDashboards":{
                    "createMissing": true,
                    "updateExisting": true
                    }
                },
                "source": ""
                }
                """

                params = json.loads(json_data)
                params['source'] = read_file.read()

                if file.endswith(('.yaml', '.YAML')):
                    params['format'] = 'yaml'
                elif file.endswith(('.json', '.JSON')):
                    params['format'] = 'json'
                elif file.endswith(('.xml', '.XML')):
                    params['format'] = 'xml'

                try:
                    response = zapi.send_api_request(
                        'configuration.import', params)
                except APIRequestError as error:
                    return {
                        'step': step_name,
                        'status': 'fail',
                        'message': f'Import error... File: {file} Data: {error}'
                    }

        return {
            'step': step_name,
            'status': 'success',
            'message': ''
        }

    except Exception as e:
        return {
            'step': step_name,
            'status': 'error',
            'message': str(e)
        }
