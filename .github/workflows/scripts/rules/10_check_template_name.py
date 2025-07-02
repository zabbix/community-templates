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


def run_check(skip: bool = False) -> dict:
    """
    Check if the template name is valid.
    """
    step_name = 'Check template file name'
    if skip:
        return {
            'step': step_name,
            'status': 'skip',
            'message': ''
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

                elif file.endswith('README.md'):
                    file_type = 'readme'

                else:
                    file_type = 'unknown'

            if file_type == 'template':
                template_name = os.path.splitext(os.path.basename(file))[0]
                if not re.match(r'^template_[a-zA-Z0-9_-]+$', template_name):
                    return {
                        'step': step_name,
                        'status': 'fail',
                        'message': f'Template name "{template_name}" is invalid. Regular expression: ' + r'^template_[a-zA-Z0-9_-]+$'
                    }

            elif file_type == 'readme':
                readme_name = os.path.basename(file)
                if not re.match(r'^README\.md$', readme_name):
                    return {
                        'step': step_name,
                        'status': 'fail',
                        'message': f'README name "{readme_name}" is invalid. Regular expression: ' + r'^README\.md$'
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
