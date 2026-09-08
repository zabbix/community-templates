"""Regression tests for the template's actual plugin discovery JavaScript.

Run with Python 3, PyYAML and Node.js:
    python files/test_plugin_discovery.py
"""

import json
from pathlib import Path
import subprocess
import unittest

import yaml


class PluginDiscoveryTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        template_path = Path(__file__).resolve().parents[1] / 'template_jellyfin_by_http.yaml'
        template = yaml.safe_load(template_path.read_text())['zabbix_export']['templates'][0]
        discovery = next(rule for rule in template['discovery_rules'] if rule['key'] == 'jellyfin.plugin.discovery')
        cls.script = discovery['preprocessing'][0]['parameters'][0]

    def discover(self, plugins):
        runner = """
const input = JSON.parse(require('fs').readFileSync(0, 'utf8'));
const result = new Function('value', input.script)(JSON.stringify(input.plugins));
process.stdout.write(result);
"""
        result = subprocess.run(['node', '-e', runner],
            input=json.dumps({'script': self.script, 'plugins': plugins}),
            text=True, capture_output=True, check=True)
        return json.loads(result.stdout)

    def test_duplicate_versions_keep_first_entry_for_existing_item_keys(self):
        rows = self.discover([
            {'Id': 'ldap', 'Name': 'LDAP', 'Version': '24.0.0.0', 'Status': 'Restart'},
            {'Id': 'ldap', 'Name': 'LDAP-Auth', 'Version': '24.0.0.0', 'Status': 'Active'},
            {'Id': 'ldap', 'Name': 'LDAP-Auth', 'Version': '23.0.0.0', 'Status': 'Superseded'},
            {'Id': 'other', 'Name': 'Other', 'Version': '1.0.0.0', 'Status': 'Active'},
        ])
        self.assertEqual(len(rows), 2)
        self.assertEqual(rows[0], {'{#PLUGIN.ID}': 'ldap', '{#PLUGIN.NAME}': 'LDAP',
            '{#PLUGIN.STATUS}': 'Restart', '{#PLUGIN.VERSION}': '24.0.0.0'})
        self.assertEqual(rows[1]['{#PLUGIN.ID}'], 'other')

    def test_name_fallback_and_object_property_names(self):
        rows = self.discover([
            {'Name': '__proto__'}, {'Name': '__proto__'},
            {'Id': 'constructor'}, {'Id': 'toString'}, {},
        ])
        self.assertEqual([row['{#PLUGIN.ID}'] for row in rows],
            ['__proto__', 'constructor', 'toString'])

    def test_empty_plugin_list(self):
        self.assertEqual(self.discover([]), [])


if __name__ == '__main__':
    unittest.main()
