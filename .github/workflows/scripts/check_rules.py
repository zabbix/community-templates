#!/usr/bin/env python

import glob
import os
import json
from tabulate import tabulate

with open('.github/outputs/all_changed_files.json', 'r') as file_list:
    changed_files = json.load(file_list)

print("# Changed files:\n\n")
for file in changed_files:
    print(f"* {file}")

folder_rules = '.github/workflows/scripts/rules'

rules = {}

for filename_rule in glob.glob(os.path.join(folder_rules, '*.py')):
    rule_name = os.path.splitext(os.path.basename(filename_rule))[0]
    try:
        rules[rule_name] = __import__(f'rules.{rule_name}', fromlist=['object'])
    except ImportError as e:
        print(f"Error importing rule {rule_name}: {e}")
        continue
    
rules = dict(sorted(rules.items()))

out_table = []
headers_table = [
        'Step', 'Mark','Status', 'Message'
    ]

mark_map = {
    'success': ':white_check_mark:',
    'fail': ':x:',
    'error': ':warning:',
    'skip': ':fast_forward:'
}

is_failed = False

for rule in rules:
    try:
        result = rules[rule].run_check(is_failed)
        is_failed = is_failed or result['status'] == 'error' or result['status'] == 'fail'
    except:
        result = {
            'step': rule,
            'status': 'error',
            'message': 'Error running rule'
        }
        is_failed = True
    
    out_table.append([
        result['step'],
        mark_map.get(result['status'], ':interrobang:'),
        result['status'],
        result['message']
    ])

print("\n# Rules check results:\n\n")
print(tabulate(out_table, headers=headers_table, tablefmt="github"))

if is_failed:
    exit(1)
else:
    exit(0)