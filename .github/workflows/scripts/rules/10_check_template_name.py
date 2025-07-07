#!/usr/bin/env python

import os
import re
import json
from ruamel.yaml import YAML
from lxml import etree

yaml = YAML()
yaml.indent(mapping=2, sequence=4, offset=2)
yaml.preserve_quotes = False
yaml.width = 4096

regx_template = r'^template_[.a-zA-Z0-9()_-]+$'
regx_mediatype = r'^mediatype_[.a-zA-Z0-9()_-]+$'


def run_check(skip: bool = False) -> dict:
    """
    Check if the template name is valid.
    """
    skip = False

    step_name = 'Check template file name'
    if skip:
        return {
            'step': step_name,
            'status': 'skip',
            'message': ''
        }

    with open('.github/outputs/all_changed_files.json', 'r', encoding='utf-8') as file_list:
        changed_files = json.load(file_list)

    try:
        for file in changed_files:
            with open(file, 'r', encoding='utf-8') as read_file_n:
                if file.endswith(('.yaml', '.YAML')):
                    try:
                        data_obj = yaml.load(read_file_n)
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
                        data_obj = json.load(read_file_n)
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

                elif file.endswith('/README.md'):
                    file_type = 'readme'

                else:
                    file_type = 'unknown'

            if file_type == 'template':
                template_file_name = os.path.splitext(
                    os.path.basename(file))[0]
                if not re.match(regx_template, template_file_name):
                    return {
                        'step': step_name,
                        'status': 'fail',
                        'message': f'Template file name "{template_file_name}" is invalid. Regular expression: ' + regx_template
                    }
            elif file_type == 'mediatype':
                mediatype_file_name = os.path.splitext(
                    os.path.basename(file))[0]
                if not re.match(regx_mediatype, mediatype_file_name):
                    return {
                        'step': step_name,
                        'status': 'fail',
                        'message': f'Template file name "{mediatype_file_name}" is invalid. Regular expression: ' + regx_mediatype
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
