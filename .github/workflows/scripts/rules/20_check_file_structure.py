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

regx_template = r'^template_[.a-zA-Z0-9()_-]+$'
regx_mediatype = r'^mediatype_[.a-zA-Z0-9()_-]+$'

regx_other = r'(template_[.a-zA-Z0-9()_-]+|mediatype_[.a-zA-Z0-9()_-]+)(\/\d.\d\/files\/)(.+)'
regx_readme = r'(template_[.a-zA-Z0-9()_-]+|mediatype_[.a-zA-Z0-9()_-]+)(\/\d.\d\/)README\.md$|(template_[.a-zA-Z0-9()_-]+|mediatype_[.a-zA-Z0-9()_-]+)(\/\d.\d\/)(files\/)(.*)(README\.md$)'


def run_check(skip: bool = False) -> dict:
    """
    Check if directory structure is valid.
    """

    skip = False
    step_name = 'Check directory structure'
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
            with open(file, 'r', encoding='utf-8') as read_file_fs:
                if file.endswith(('.yaml', '.YAML')):
                    try:
                        data_obj = yaml.load(read_file_fs)
                        if 'zabbix_export' in data_obj and 'templates' in data_obj['zabbix_export']:
                            file_type = 'template'
                            version = data_obj['zabbix_export']['version']
                        elif 'zabbix_export' in data_obj and 'readme' in data_obj['media_types']:
                            file_type = 'mediatype'
                            version = data_obj['zabbix_export']['version']
                        else:
                            file_type = 'unknown'
                    except:
                        return {
                            'step': step_name,
                            'status': 'fail',
                            'message': f'File "{file}" is not a valid YAML file.'
                        }

                elif file.endswith(('.json', '.JSON')):
                    try:
                        data_obj = json.load(read_file_fs)
                        if 'zabbix_export' in data_obj and 'templates' in data_obj['zabbix_export']:
                            file_type = 'template'
                            version = data_obj['zabbix_export']['version']
                        elif 'zabbix_export' in data_obj and 'readme' in data_obj['media_types']:
                            file_type = 'mediatype'
                            version = data_obj['zabbix_export']['version']
                        else:
                            file_type = 'unknown'
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
                            version = data_obj.xpath(
                                '//zabbix_export/version')[0].text
                        elif data_obj.xpath('//zabbix_export/media_types'):
                            file_type = 'mediatype'
                            version = data_obj.xpath(
                                '//zabbix_export/version')[0].text
                        else:
                            file_type = 'unknown'
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
                path_list = Path(file).parts
                template_name = path_list[-3]
                folder_ver = path_list[-2]

                fail_message = ''
                file_template_list = glob.glob(os.path.join(
                    os.sep.join(path_list[:-1]), 'template_*'))
                file_media_list = glob.glob(os.path.join(
                    os.sep.join(path_list[:-1]), 'mediatype_*'))

                if len(file_template_list + file_media_list) > 1:
                    fail_message += f'There are multiple template files in the folder: {", ".join(file_template_list + file_media_list)}. '

                if not re.match(regx_template, template_name):
                    fail_message += f'Template folder name "{template_name}" is invalid. Regular expression: {regx_template}. File: {file}. '

                if folder_ver != version:
                    fail_message += f'Folder version "{folder_ver}" does not match template/mediatype version "{version}". File: {file}. '

                if fail_message != '':
                    return {
                        'step': step_name,
                        'status': 'fail',
                        'message': fail_message
                    }

            elif file_type == 'mediatype':
                path_list = Path(file).parts
                template_name = path_list[-3]
                folder_ver = path_list[-2]

                fail_message = ''
                file_template_list = glob.glob(os.path.join(
                    os.sep.join(path_list[:-1]), 'template_*'))
                file_media_list = glob.glob(os.path.join(
                    os.sep.join(path_list[:-1]), 'mediatype_*'))

                if len(file_template_list + file_media_list) > 1:
                    fail_message += f'There are multiple template files in the folder: {", ".join(file_template_list + file_media_list)}. '

                if not re.match(regx_mediatype, template_name):
                    fail_message += f'Mediatype folder name "{template_name}" is invalid. Regular expression: {regx_mediatype}. File: {file}. '

                if folder_ver != version:
                    fail_message += f'Folder version "{folder_ver}" does not match template/mediatype version "{version}". File: {file}. '

                if fail_message != '':
                    return {
                        'step': step_name,
                        'status': 'fail',
                        'message': fail_message
                    }

            elif file_type == 'readme':

                fail_message = ''
                if not re.search(regx_readme, file):
                    fail_message += f'README.md file allow only in "template_xxx/X.X/" folder. File: {file}. '

                if fail_message != '':
                    return {
                        'step': step_name,
                        'status': 'fail',
                        'message': fail_message
                    }

            elif file_type == 'unknown':
                
                fail_message = ''
                if not re.search(regx_other, file):
                    fail_message += f'Other files allow only in "template_xxx/X.X/files/" folder. File: {file}. '

                if fail_message != '':
                    return {
                        'step': step_name,
                        'status': 'fail',
                        'message': fail_message
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
