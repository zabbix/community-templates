#!/usr/bin/env python

import glob
import os
from tabulate import tabulate

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
        'Step', 'Status', 'Message'
    ]

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
        result['status'],
        result['message']
    ])

print(tabulate(out_table, headers=headers_table, tablefmt="github"))

if is_failed:
    exit(1)
else:
    exit(0)