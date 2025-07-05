#!/usr/bin/env python

import time
import json
from ruamel.yaml import YAML
from lxml import etree
from zabbix_utils import ZabbixAPI, APIRequestError
from zabbix_utils.version import __max_supported__
from pathlib import Path

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

    instances = [
        {
            'port': '8050',
            'ver': '5.0'
        },
        {
            'port': '8060',
            'ver': '6.0'
        },
        {
            'port': '8070',
            'ver': '7.0'
        },
        {
            'port': '8074',
            'ver': '7.4'
        }
    ]

    def get_inst(zbx_ver):

        inst_count = len(instances)

        out = instances[inst_count - 1]['zbx']

        for i in range(inst_count):

            if float(zbx_ver) <= float(instances[inst_count - (i + 1)]['ver']):
                out = instances[inst_count - (i + 1)]['zbx']
            else:
                return out

        return out

    for i, inst in enumerate(instances):
        for x in range(10):
            try:
                instances[i]['zbx'] = ZabbixAPI(
                    url=f"http://127.0.0.1:{inst['port']}",
                    validate_certs=False,
                    skip_version_check=True,
                    timeout=10,
                )
                instances[i]['zbx'].login(user="Admin", password="zabbix")
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

    with open('.github/outputs/all_changed_files.json', 'r', encoding='utf-8') as file_list:
        changed_files = json.load(file_list)
    try:
        for file in changed_files:
            with open(file, 'r', encoding='utf-8') as read_file_i:
                if file.endswith(('.yaml', '.YAML')):
                    try:
                        data_obj = yaml.load(read_file_i)
                        if 'zabbix_export' in data_obj and 'templates' in data_obj['zabbix_export']:
                            file_type = 'template'
                        elif 'zabbix_export' in data_obj and 'readme' in data_obj['media_types']:
                            file_type = 'mediatype'
                    except:
                        return {
                            'step': step_name,
                            'status': 'fail',
                            'message': f'File "{file}" is not a valid YAML file.'
                        }

                elif file.endswith(('.json', '.JSON')):
                    try:
                        data_obj = json.load(read_file_i)
                        if 'zabbix_export' in data_obj and 'templates' in data_obj['zabbix_export']:
                            file_type = 'template'
                        elif 'zabbix_export' in data_obj and 'readme' in data_obj['media_types']:
                            file_type = 'mediatype'
                    except:
                        return {
                            'step': step_name,
                            'status': 'fail',
                            'message': f'File "{file}" is not a valid JSON file.'
                        }

                elif file.endswith(('.xml', '.XML')):
                    try:
                        data_obj = etree.parse(file)
                        if data_obj.xpath('//zabbix_export/templates'):
                            file_type = 'template'
                        elif data_obj.xpath('//zabbix_export/media_types'):
                            file_type = 'mediatype'
                    except:
                        return {
                            'step': step_name,
                            'status': 'fail',
                            'message': f'File "{file}" is not a valid XML file.'
                        }

                else:
                    file_type = 'unknown'

            if file_type == 'template' or file_type == 'mediatype':
                json_data = {
                    '7.4': """
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
                    },
                    "template_groups": {
                    "createMissing": true,
                    "updateExisting": true
                    },
                    "mediaTypes": {
                    "createMissing": true,
                    "updateExisting": true
                    }
                },
                "source": ""
                }
                """,
                    '7.0': """
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
                    },
                    "template_groups": {
                    "createMissing": true,
                    "updateExisting": true
                    },
                    "mediaTypes": {
                    "createMissing": true,
                    "updateExisting": true
                    }
                },
                "source": ""
                }
                """,
                    '6.0': """
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
                    },
                    "mediaTypes": {
                    "createMissing": true,
                    "updateExisting": true
                    }
                },
                "source": ""
                }
                """,
                    '5.0': """
                {
                "rules": {
                    "templateScreens": {
                        "createMissing": true,
                        "updateExisting": true,
                        "deleteMissing": true
                    },
                    "screens": {
                        "createMissing": true,
                        "updateExisting": true
                    },
                    "httptests": {
                        "createMissing": true,
                        "updateExisting": true,
                        "deleteMissing": true
                    },
                    "groups":{
                        "createMissing": true
                    },
                    "applications":{
                        "createMissing": true,
                        "deleteMissing": true
                    },
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
                    "mediaTypes": {
                    "createMissing": true,
                    "updateExisting": true
                    }
                },
                "source": ""
                }
                """
                }

                # path_list = Path(file).parts
                # folder_ver = path_list[-2]

                last_error = ''
                for zabbix in instances:

                    params = json.loads(json_data[zabbix['ver']])
                    with open(file, 'r', encoding='utf-8') as read_file_i:
                        params['source'] = read_file_i.read()

                    if file.endswith(('.yaml', '.YAML')):
                        params['format'] = 'yaml'
                    elif file.endswith(('.json', '.JSON')):
                        params['format'] = 'json'
                    elif file.endswith(('.xml', '.XML')):
                        params['format'] = 'xml'

                    zapi = zabbix['zbx']
                    # zapi = get_inst(folder_ver)
                    try:
                        response = zapi.send_api_request(
                            'configuration.import', params)
                        break
                    except APIRequestError as error:
                        last_error = error
                        continue
                else:
                    return {
                        'step': step_name,
                        'status': 'fail',
                        'message': f'Import error... File: {file} Zabbix: {zapi.url} Data: {last_error}'
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
