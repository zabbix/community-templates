# !/usr/bin/env python
import os
import json
import xmltodict
from ruamel.yaml import YAML
import time

yaml = YAML()
yaml.allow_unicode = True
yaml.encoding = 'utf-8'


class Template:
    def __init__(self, name, type='template', sync=int(time.time())):
        self.name = name
        self.template = ''
        self.versions = []
        self.path = []
        self.description = ''
        self.type = type
        self.sync = sync
        self.tags = []

    def add_file(self, template_object={}, file_type='xml'):
        if not 'zabbix_export' in template_object:
            return
        if not 'templates' in template_object['zabbix_export']:
            return
        template = {
            'version': float(template_object['zabbix_export']['version']),
            'sync': int(time.time()),
            'description': ''
        }
        if file_type == 'xml':
            if isinstance(template_object['zabbix_export']['templates']['template'], list):
                template['name'] = template_object['zabbix_export']['templates']['template'][0]['template']
                if 'description' in template_object['zabbix_export']['templates']['template'][0]:
                    template['description'] = template_object['zabbix_export']['templates']['template'][0]['description']
            else:
                template['name'] = template_object['zabbix_export']['templates']['template']['template']
                if 'description' in template_object['zabbix_export']['templates']['template']:
                    template['description'] = template_object['zabbix_export']['templates']['template']['description']
        else:
            if not isinstance(template_object['zabbix_export']['templates'], list):
                template['name'] = template_object['zabbix_export']['templates']['template'][0]['template']
                if 'description' in template_object['zabbix_export']['templates']['template'][0]:
                    template['description'] = template_object['zabbix_export']['templates']['template'][0]['description']
            else:
                template['name'] = template_object['zabbix_export']['templates'][0]['template']
                if 'description' in template_object['zabbix_export']['templates'][0]:
                    template['description'] = template_object['zabbix_export']['templates'][0]['description']
        self.versions.append(template)
        max_version = 0.0
        for version in self.versions:
            if version['version'] > max_version:
                max_version = version['version']
                self.description = version['description']
                self.template = version['name']

    def clear_old(self, max_age):
        for version in list(self.versions):
            if int(time.time()) - version['sync'] > max_age:
                self.versions.remove(version)

    def export_folders(self):
        return {
            'name': self.name,
            'template': self.template,
            'type': self.type,
            'sync': self.sync,
            'path': self.path,
            'description': self.description,
            'versions': self.versions,
            'tags': self.tags
        }


class Folder:
    def __init__(self, new_name='.', type='folder', sync=int(time.time())):
        self.next = []
        self.name = new_name
        self.type = type
        self.sync = sync

    def add_folder(self, path=[], template=None):
        if len(path) == 0:
            if not template == None:
                self.next.append(template)
            return
        for child in self.next:
            if child.name == path[0]:
                self.sync = int(time.time())
                child.add_folder(path[1:], template)
                break
        else:
            child = Folder(path[0])
            child.add_folder(path[1:], template)
            self.next.append(child)

    def clear_old(self, max_age):
        for child in list(self.next):
            if int(time.time()) - child.sync > max_age:
                self.next.remove(child)
            else:
                child.clear_old(max_age)

    def import_folders(self, folders=[]):
        for new_folder in folders:
            if new_folder.type == 'folder':
                child = Folder(new_name=new_folder.name,
                               type=new_folder.type, sync=new_folder.sync)
                child.import_folders(new_folder.next)
            elif new_folder.type == 'template':
                child = Template(new_folder.name,
                                 type=new_folder.type, sync=new_folder.sync)
                child.versions = new_folder.versions
                child.template = new_folder.template
                child.path = new_folder.path
                child.description = new_folder.description
                child.tags = new_folder.tags
            self.next.append(child)

    def export_folders(self):
        childs = []
        for child in self.next:
            childs.append(child.export_folders())
        return {
            'name': self.name,
            'type': self.type,
            'sync': self.sync,
            'next': childs
        }


root = Folder()

def parse_dir(directory):
    """Iterative view of the catalog tree 

    Args:
        directory (path): Path to the catalog 
    """
    for dir in os.listdir(directory):
        if dir in ['.git', '.github']:
            continue
        next_dir = os.path.join(directory, dir)
        if os.path.isdir(next_dir):
            if dir.startswith('template_'):
                parse_template(next_dir)
            else:
                normpath = os.path.relpath(next_dir)
                normpath = os.path.normpath(normpath)
                path = normpath.split(os.sep)
                root.add_folder(path)
                # add_directory(next_dir)
                parse_dir(next_dir)


def parse_template(directory):
    """Processing directory template 

    Args:
        directory (path): Path to the catalog 
    """
    print(directory)
    normpath = os.path.relpath(directory)
    normpath = os.path.normpath(normpath)
    path = normpath.split(os.sep)
    tmpl = Template(directory.split(os.sep)[-1])
    tmpl.path = path
    for version in os.listdir(directory):
        if not os.path.isdir(os.path.join(directory, version)):
            continue
        for file in os.listdir(os.path.join(directory, version)):
            if not os.path.isfile(os.path.join(directory, version, file)):
                continue
            with open(os.path.join(directory, version, file), 'r', encoding='utf-8') as template_file:
                r_file = template_file.read()
                template_file.close()
            in_template = {}
            if file.split('.')[-1] == 'xml':
                try:
                    in_template = xmltodict.parse(r_file, encoding='utf-8')
                except Exception as err:
                    print('Error:', err)
            elif file.split('.')[-1] == 'json':
                in_template = json.dumps(r_file)
            elif file.split('.')[-1] == 'yaml':
                in_template = yaml.load(r_file)
            tmpl.add_file(in_template, file.split('.')[-1])
    if len(tmpl.versions) > 0:        
        root.add_folder(path[:-1], template=tmpl)


def main():
    """The main function. Generation readme.md file. 
    """

    parse_dir(os.getcwd())

    root.clear_old(120)
    global_readme_obj = root.export_folders()

    with open('.github/homepage/meta.json', 'w', encoding='utf-8') as meta_json:
        json.dump(global_readme_obj, meta_json, ensure_ascii=False, indent=4)


main()
