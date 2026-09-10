#!/usr/bin/env python

import os
import re
import json

forbidden_names = [
    '.github/',
    '.git/',
    '.gitignore',
    'docs/',
    'LICENSE',
    '.venv/'
]

# All community templates and additional files are published under the MIT
# license. Third-party license files (even compatible ones, e.g. GPL) are not
# accepted anywhere in the repository, including "template_xxx/X.X/files/".
# See: https://www.zabbix.com/documentation/guidelines/en/thosts/community_templates
regx_license_file = re.compile(
    r'^(LICEN[CS]E|COPYING|COPYRIGHT)(\..*|[-_].*)?$', re.IGNORECASE)

# Markers of third-party licenses in text files (README, templates, scripts).
regx_license_text = re.compile(
    r'GNU (Lesser |Affero )?General Public License'
    r'|\b[AL]?GPL[ -]?v?[23](\.\d)?(\+| or later)?\b'
    r'|Apache License,? Version'
    r'|Mozilla Public License'
    r'|Creative Commons'
    r'|\bCC[ -]BY(-[A-Z]{2})*\b'
    r'|Eclipse Public License'
    r'|SPDX-License-Identifier:(?!\s*MIT\b)',
    re.IGNORECASE)

# Do not scan files larger than this (bytes).
max_scan_size = 5 * 1024 * 1024


def find_license_text(file: str):
    """
    Return the first third-party license marker found in a text file,
    or None if the file is missing, binary, too large or clean.
    """
    if not os.path.isfile(file) or os.path.getsize(file) > max_scan_size:
        return None
    try:
        with open(file, 'r', encoding='utf-8') as text_file:
            for line_no, line in enumerate(text_file, start=1):
                match = regx_license_text.search(line)
                if match:
                    return line_no, match.group(0)
    except (UnicodeDecodeError, OSError):
        return None
    return None


def run_check(skip: bool = False) -> dict:
    """ 
    Check for forbidden folders and files.
    """

    skip = False

    step_name = 'Check forbidden folders'

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
                    'message': f'Changing directory "{file}" is forbidden.'
                }

        if regx_license_file.match(os.path.basename(file)):
            return {
                'step': step_name,
                'status': 'fail',
                'message': f'License file "{file}" is not allowed. '
                           'All community templates are published under the MIT license, '
                           'third-party license files are not accepted.'
            }

    for file in changed_files:
        found = find_license_text(file)
        if found:
            line_no, marker = found
            return {
                'step': step_name,
                'status': 'fail',
                'message': f'File "{file}" (line {line_no}) mentions a third-party license: "{marker}". '
                           'Only MIT-licensed templates and additional files are accepted, '
                           'third-party licenses (even compatible ones, e.g. GPL) are not.'
            }

    return {
        'step': step_name,
        'status': 'success',
        'message': ''
    }
