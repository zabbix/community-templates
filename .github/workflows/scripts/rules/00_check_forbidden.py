#!/usr/bin/env python

import json

forbidden_names = [
    '.github/',
    '.git/',
    '.gitignore',
    'docs/',
    'License'
]

def run_check(skip: bool = False) -> dict:
    """ 
    Check for forbidden names in files.
    """ 
    step_name = 'Check forbidden names in files'
    
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
            if file.startswith(name):
                return {
                    'step': step_name,
                    'status': 'fail',
                    'message': f'Changing file "{file}" is forbidden.'
                }

    return {
        'step': step_name,
        'status': 'success',
        'message': ''
    }