#!/usr/bin/env python

import json

forbidden_names = [
    '.zip',
    '.rar',
    '.7z',
    '.tar',
    '.gz',
    '.bz2',
    '.xz',
    '.tar.gz',
    '.tar.bz2',
    '.tar.xz',
    '.arj',
    '.cab',
    '.iso',
    '.ace',
    '.lha',
    '.lzh'
]


def run_check(skip: bool = False) -> dict:
    """ 
    Check for forbidden file types.
    """

    skip = False
    step_name = 'Check forbidden file types'

    if skip:
        return {
            'step': step_name,
            'status': 'skip',
            'message': ''
        }

    with open('.github/outputs/all_changed_files.json', 'r', encoding='utf-8') as file_list:
        changed_files = json.load(file_list)

    for file in changed_files:
        for name in forbidden_names:
            if str(file).lower().endswith(name):
                return {
                    'step': step_name,
                    'status': 'fail',
                    'message': f'Files type of {",".join(forbidden_names)} is forbidden. File: "{file}"'
                }

    return {
        'step': step_name,
        'status': 'success',
        'message': ''
    }
