#!/usr/bin/env python

import os
import re
import json
import glob
from ruamel.yaml import YAML
from lxml import etree
from pathlib import Path

yaml = YAML()
yaml.indent(mapping=2, sequence=4, offset=2)
yaml.preserve_quotes = False
yaml.width = 4096


def run_check(skip: bool = False) -> dict:
    """
    Check if file structure is valid.
    """
    step_name = 'Check file structure'
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
            with open(file, 'r', encoding='utf-8') as read_file:
                if file.endswith(('.yaml', '.YAML')):
                    try:
                        data_obj = yaml.load(read_file)
                        if 'zabbix_export' in data_obj and 'templates' in data_obj['zabbix_export']:
                            file_type = 'template'
                            version = data_obj['zabbix_export']['version']
                        elif 'zabbix_export' in data_obj and 'readme' in data_obj['media_types']:
                            file_type = 'mediatype'
                            version = data_obj['zabbix_export']['version']
                    except:
                        pass

                elif file.endswith(('.json', '.JSON')):
                    try:
                        data_obj = json.load(read_file)
                        if 'zabbix_export' in data_obj and 'templates' in data_obj['zabbix_export']:
                            file_type = 'template'
                            version = data_obj['zabbix_export']['version']
                        elif 'zabbix_export' in data_obj and 'readme' in data_obj['media_types']:
                            file_type = 'mediatype'
                            version = data_obj['zabbix_export']['version']
                    except:
                        pass

                elif file.endswith(('.xml', '.XML')):
                    try:
                        data_obj = etree.fromstring(read_file.read())
                        if data_obj.xpath('//zabbix_export/templates'):
                            file_type = 'template'
                            version = data_obj.xpath('//zabbix_export/version')[0].text
                        elif data_obj.xpath('//zabbix_export/media_types'):
                            file_type = 'mediatype'
                            version = data_obj.xpath('//zabbix_export/version')[0].text
                    except:
                        pass

                elif file.endswith('/README.md'):
                    file_type = 'readme'

                else:
                    file_type = 'unknown'

            if file_type == 'template' or file_type == 'mediatype':
                path_list = Path(file).parts
                template_name = path_list[-3]
                folder_ver = path_list[-2]
                
                fail_message = ''
                file_list = glob.glob(os.sep.join(path_list[:-1], 'template_*'))
                
                if len(file_list) > 1:
                    fail_message = f'There are multiple template files in the folder: {", ".join(file_list)}. '
                
                if not re.match(r'^template_[a-zA-Z0-9_-]+$', template_name):
                    fail_message += f'Template name "{template_name}" is invalid. Regular expression: ' + r'^template_[a-zA-Z0-9_-]+$' + '. '
                
                if folder_ver != version:
                    fail_message += f'Folder version "{folder_ver}" does not match template/mediatype version "{version}".'
                
                if fail_message != '':
                    return {
                        'step': step_name,
                        'status': 'fail',
                        'message': f'Template name "{template_name}" is invalid. Regular expression: ' + r'^template_[a-zA-Z0-9_-]+$'
                    }

            elif file_type == 'readme':
                path_list = Path(file).parts
                folder_ver = path_list[-2]
                
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
