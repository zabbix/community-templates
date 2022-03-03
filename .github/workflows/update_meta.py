# !/usr/bin/env python
import os
import json
import xmltodict
from ruamel.yaml import YAML
import time
import shutil
import re


class Template:
    def __init__(self, name, type='template', sync=int(time.time()), collection='_templates'):
        self.name = name
        self.template = ''
        self.versions = []
        self.path = []
        self.description = ''
        self.type = type
        self.sync = sync
        self.tags = []
        self.author = ''
        self.collection = collection

    def add_file(self, template_object={}, file = 'template.xml'):
        if not 'zabbix_export' in template_object:
            return
        if not 'templates' in template_object['zabbix_export']:
            return
        file_type = file.split('.')[-1]
        template = {
            'version': float(template_object['zabbix_export']['version']),
            'sync': int(time.time()),
            'description': '',
            'template_file': file
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

    def export_folders(self, isprint):
        file_mame = re.sub(r'[^A-Za-z0-9-]', '-', '-'.join(self.path))
        file_mame = re.sub("-+", "-", file_mame)
        file_mame = file_mame.lower()
        file_mame = file_mame.strip('-')
        iter = 1
        while os.path.exists('{}.md'.format(os.path.join(self.collection,'_zabbix_templates',file_mame))):
            file_mame = '{}-{}'.format(file_mame, iter)
            iter += 1
        info = {
            'versions': [],
            'tags': self.tags
        } 
        for ver in self.versions:
            info['versions'].append({
                'version': ver['version'],
                'template_file': ver['template_file']
            })
            os.makedirs(os.path.join(self.collection,os.sep.join(['_includes','markdown','zabbix_templates']),file_mame,str(ver['version'])))
            shutil.copyfile(os.path.join(os.sep.join(self.path),str(ver['version']),'README.md'),
                            os.path.join(self.collection,os.sep.join(['_includes','markdown','zabbix_templates']),file_mame,str(ver['version']),'README.md'))
        with open('{}.md'.format(os.path.join(self.collection,'_zabbix_templates',file_mame)), 'w', encoding='utf-8') as collect:
            collect.write('---\n\
layout: {}\n\
name: {}\n\
folder: {}\n\
github: {}\n\
---\n\
'.format('template',
                self.template,
                file_mame,
                '/'.join(self.path)))
            collect.close()
        with open('{}.json'.format(os.path.join(self.collection,'_data','zabbix_templates',file_mame)), 'w', encoding='utf-8') as json_tmpl:
            json_tmpl.write(json.dumps(info))
            json_tmpl.close()        
        return {
            'name': self.name,
            'template': self.template,
            'type': self.type,
            'sync': self.sync,
            'path': self.path,
            'jekyll': file_mame,
            'description': self.description,
            'versions': self.versions,
            'tags': self.tags,
            'author': self.author
        }


class Folder:
    def __init__(self, name='.', file='meta.json', type='folder', sync=int(time.time()), collection='_templates'):
        self.next = []
        self.name = name
        self.file = file
        self.type = type
        self.sync = sync
        self.collection = collection

    def update(self):
        self.next.clear()
        with open(os.path.join(self.collection,'_data',self.file), 'r', encoding='utf-8') as meta_json:
            fld = json.load(meta_json)
            self.import_folders(fld['next'])
            meta_json.close()

        self.sync = int(time.time())
        self.parse_dir(self.name)
        self.name = os.path.normpath(os.path.relpath(self.name))
        self.clear_old(int(time.time()) - self.sync + 2)

    def parse_dir(self, directory):
        """Iterative view of the catalog tree 

        Args:
            directory (path): Path to the catalog 
        """
        for dir in os.listdir(directory):
            if dir in ['.git', '.github', '.vscode', 'docs']:
                continue
            next_dir = os.path.join(directory, dir)
            if os.path.isdir(next_dir):
                if dir.startswith('template_'):
                    self.parse_template(next_dir)
                else:
                    normpath = os.path.relpath(next_dir)
                    normpath = os.path.normpath(normpath)
                    path = normpath.split(os.sep)
                    self.add_folder(path)
                    # add_directory(next_dir)
                    self.parse_dir(next_dir)

    def parse_template(self, directory):
        """Processing directory template 

        Args:
            directory (path): Path to the catalog 
        """
        yaml = YAML()
        yaml.allow_unicode = True
        yaml.encoding = 'utf-8'

        print(directory)
        normpath = os.path.relpath(directory)
        normpath = os.path.normpath(normpath)
        path = normpath.split(os.sep)
        tmpl = Template(directory.split(os.sep)
                        [-1], collection=self.collection)
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
                tmpl.add_file(in_template, file)
        if len(tmpl.versions) > 0:
            self.add_folder(path[:-1], template=tmpl)

    def add_folder(self, path=[], template=None):
        if len(path) == 0:
            if not template == None:
                for target in self.next:
                    if target.name == template.name:
                        template.tags = target.tags
                        template.author = target.author
                        break
                self.next.append(template)
            return
        for child in self.next:
            if child.name == path[0]:
                child.sync = int(time.time())
                child.add_folder(path[1:], template)
                break
        else:
            child = Folder(path[0], self.file, collection=self.collection)
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
            if new_folder['type'] == 'folder':
                child = Folder(name=new_folder['name'],
                               type=new_folder['type'], sync=new_folder['sync'], collection=self.collection)
                child.import_folders(new_folder['next'])
            elif new_folder['type'] == 'template':
                child = Template(name=new_folder['name'],
                                 type=new_folder['type'], sync=new_folder['sync'], collection=self.collection)
                child.versions = new_folder['versions']
                child.template = new_folder['template']
                child.path = new_folder['path']
                child.description = new_folder['description']
                child.tags = new_folder['tags']
                child.author = new_folder['author']
            self.next.append(child)

    def export_folders(self, isprint):
        if isprint:
            dirs = ['_zabbix_templates',
                    os.sep.join(['_includes','markdown','zabbix_templates']),
                    os.sep.join(['_data','zabbix_templates'])]
            for dr in dirs:                
                if os.path.exists(os.path.join(self.collection,dr)):
                    shutil.rmtree(os.path.join(self.collection,dr))
                os.makedirs(os.path.join(self.collection,dr))
        childs = []
        for child in self.next:
            childs.append(child.export_folders(False))
        out = {
            'name': self.name,
            'type': self.type,
            'sync': self.sync,
            'next': childs
        }
        if not isprint:
            return out
        with open(os.path.join(self.collection,'_data',self.file), 'w', encoding='utf-8') as meta_json:
            json.dump(out, meta_json, ensure_ascii=False, indent=4)
            meta_json.close()


def main():
    """The main function. Generation readme.md file.     """
    
    root = Folder(name=os.getcwd(), file='meta.json',
                  collection='.github/jekyll')
    root.update()
    root.export_folders(True)


main()
