#!/usr/bin/env python
from genericpath import isfile
import json
import os
import re
import xmltodict
from pyzabbix import ZabbixAPI
from ruamel.yaml import YAML
import shutil

yaml = YAML()
yaml.allow_unicode = True
yaml.encoding = 'utf-8'

servers_data = {
    '5.0': {
        'server': ZabbixAPI('http://localhost:8050/api_jsonrpc.php', user='Admin', password='zabbix'),
        'import_rule': {},
        'import_rule_file': '.github/workflows/import50.json',
        'max_id': 0,
        'export_default': 'xml',
        'file_types': ['xml']
    },
    '5.4': {
        'server': ZabbixAPI('http://localhost:8054/api_jsonrpc.php', user='Admin', password='zabbix'),
        'import_rule': {},
        'import_rule_file': '.github/workflows/import54.json',
        'max_id': 0,
        'export_default': 'yaml',
        'file_types': ['xml', 'json', 'yaml']
    }
}

for zabbix_server in servers_data:
    with open(servers_data[zabbix_server]['import_rule_file'], encoding='utf-8') as json_import:
        servers_data[zabbix_server]['import_rule'] = json.load(json_import)
        json_import.close()
    templates = servers_data[zabbix_server]['server'].template.get(output=[''])
    for template in templates:
        if int(template['templateid']) > servers_data[zabbix_server]['max_id']:
            servers_data[zabbix_server]['max_id'] = int(template['templateid'])


def delete_templates(template_names, template_default, zabbix_server):
    """Deleting templates by name. Built-in templates are ignored.

    Args:
        template_names (list): List of templates for removal.
        template_default (int): Maximum ID value for built-in templates 
        zabbix_server (object): ZabbixApi Object 
    """
    del_ids = []
    template_imported = zabbix_server.template.get(
        output=[
            'templateid',
            'host',
            'name'
        ],
        filter={
            'host': template_names
        }
    )
    for tmpl in template_imported:
        if int(tmpl['templateid']) > template_default:
            del_ids.append(tmpl['templateid'])

    if len(del_ids) > 0:
        zabbix_server.do_request('template.delete', del_ids)


def get_template_list(template_names, zabbix_server):
    """Addition of the list of templates by their dependencies

    Args:
        template_names (list): List of templates
        zabbix_server (object): ZabbixApi Object

    Returns:
        list: List of templates 
    """
    isParentUnresolved = False
    outIds = []
    template_imported = zabbix_server.template.get(
        output=[
            'templateid',
            'host'
        ],
        filter={
            'host': template_names
        },
        selectParentTemplates=[
            'templateid',
            'host'
        ]
    )
    for templ in template_imported:
        if not templ['templateid'] in outIds:
            isParentUnresolved = True
            outIds.append(templ['templateid'])
        if 'parentTemplates' in templ:
            for p_templ in templ['parentTemplates']:
                if not p_templ['templateid'] in outIds:
                    isParentUnresolved = True
                    outIds.append(p_templ['templateid'])

    while isParentUnresolved:
        isParentUnresolved = False
        template_imported = zabbix_server.template.get(
            output=[
                'templateid',
                'host'
            ],
            templateids=outIds,
            selectParentTemplates=[
                'templateid',
                'host'
            ]
        )
        for templ in template_imported:
            if not templ['templateid'] in outIds:
                isParentUnresolved = True
                outIds.append(templ['templateid'])
            if 'parentTemplates' in templ:
                for p_templ in templ['parentTemplates']:
                    if not p_templ['templateid'] in outIds:
                        isParentUnresolved = True
                        outIds.append(p_templ['templateid'])

    return outIds


def clear_template_name(name):
    """
    Args:
        name (string): 

    Returns:
        string:
    """
    out = re.sub(r'[\s\-_]{0,}[Tt]emplate[\s\-_]{0,}', ' ', name)
    out = out.replace('( )', '')
    return out.strip()


def rename_template(template_names, template_default, zabbix_server):
    """Rename templates. Built-in templates are ignored.

    Args:
        template_names (list): List of templates for renaming.
        template_default (int): Maximum ID value for built-in templates 
        zabbix_server (object): ZabbixApi Object

    Returns:
        list: List of updated names.
    """
    out_names = []
    desc = ''
    template_imported = zabbix_server.template.get(
        output=[
            'templateid',
            'host',
            'name'
        ],
        filter={
            'host': template_names
        }
    )
    for tmpl in template_imported:
        if int(tmpl['templateid']) <= template_default:
            out_names.append(tmpl['host'])
            continue
        else:
            new_host = clear_template_name(tmpl['host'])
            zabbix_server.template.update(
                templateid=tmpl['templateid'],
                name=clear_template_name(tmpl['name']),
                host=new_host,
                description=desc
            )

            out_names.append(new_host)

    return out_names


def get_readme(template_names, zabbix_server):
    """Generation readme file. 

    Args:
        template_names (list): List of templates
        zabbix_server (object): ZabbixApi Object

    Returns:
        string: 
    """
    out = ''
    out_obj = {
        'readme': '',
        'meta': []
    }

    template_imported = zabbix_server.template.get(
        output='extend',
        filter={
            'host': template_names
        },
        selectParentTemplates='extend',
        selectHttpTests='extend',
        selectGraphs='extend',
        selectMacros='extend',
        selectScreens='extend'
    )
    for tmpl in template_imported:
        item_types = {
            '0': 'Zabbix agent',
            '2': 'Zabbix trapper',
            '3': 'Simple check',
            '5': 'Zabbix internal',
            '7': 'Zabbix agent (active)',
            '8': 'Zabbix aggregate',
            '9': 'Web item',
            '10': 'External check',
            '11': 'Database monitor',
            '12': 'IPMI agent',
            '13': 'SSH agent',
            '14': 'Telnet agent',
            '15': 'Calculated',
            '16': 'JMX agent',
            '17': 'SNMP trap',
            '18': 'Dependent item',
            '19': 'HTTP agent',
            '20': 'SNMP agent',
            '21': 'Script'
        }
        trigger_priority = {
            '0': 'not classified',
            '1': 'information',
            '2': 'warning',
            '3': 'average',
            '4': 'high',
            '5': 'disaster'
        }

        out_obj['meta'].append(
            {
                'name': tmpl['name'],
                'desc': re.sub(r'[\t\\\r\n ]+', " ", tmpl['description']),
                'depd': len(tmpl['parentTemplates'])
            }
        )

        out += '# {}\n\n'.format(tmpl['name'])

        if not tmpl['description'] == '':
            out += tmpl['description']

        out += '## Macros used\n\n'.format(tmpl['name'])

        if len(tmpl['macros']) > 0:

            out += '|Name|Description|Default|Type|\n'
            out += '|----|-----------|-------|----|\n'

            for macro in tmpl['macros']:
                out += '|{}|<p>{}</p>|`{}`|{}|\n'.format(
                    macro['macro'],
                    '-' if macro['description'] == '' else re.sub(
                        r'[\t\\\r\n ]+', " ", macro['description']),
                    macro['value'] if macro['type'] == '0' else '****',
                    'Text macro' if macro['type'] == '0' else 'Secret macro')
        else:
            out += 'There are no macros links in this template.\n\n'

        linked_template = zabbix_server.template.get(
            output=['name', 'host'],
            templateids=get_template_list([tmpl['host']], zabbix_server)
        )

        out += '## Template links\n\n'

        if len(linked_template) > 1:
            out += '|Name|\n|----|\n'
            for link_tmpl in linked_template:
                if not link_tmpl['host'] == tmpl['host']:
                    out += '|{}|\n'.format(link_tmpl['name'])
        else:
            out += 'There are no template links in this template.\n\n'

        discovery = zabbix_server.discoveryrule.get(
            templateids=[tmpl['templateid']],
            selectFilter='extend',
            selectGraphs='extend',
            selectHostPrototypes='extend',
            selectItems='extend'
        )

        out += '## Discovery rules\n\n'

        d_items = []
        d_triggers = []

        if len(discovery) > 0:
            out += '|Name|Description|Type|Key and additional info|\n'
            out += '|----|-----------|----|----|\n'
            for rule in discovery:
                out += '|{}|<p>{}</p>|`{}`|{}<p>Update: {}</p>|\n'.format(
                    rule['name'],
                    '-' if rule['description'] == '' else re.sub(
                        r'[\t\\\r\n ]+', " ", rule['description']),
                    item_types[rule['type']],
                    rule['key_'],
                    rule['delay']
                )
                for d_itm in rule['items']:
                    d_items.append(
                        {
                            'name': d_itm['name'],
                            'key_': d_itm['key_'],
                            'delay': d_itm['delay'],
                            'type': d_itm['type'],
                            'description': d_itm['description'],
                        }
                    )
                tmp_triggers = zabbix_server.triggerprototype.get(
                    output='extend',
                    discoveryids=rule['itemid'],
                    expandExpression=True
                )
                for d_trg in tmp_triggers:
                    d_triggers.append(
                        {
                            'description': d_trg['description'],
                            'comments': d_trg['comments'],
                            'priority': d_trg['priority'],
                            'expression': d_trg['expression'],
                            'recovery_expression': d_trg['recovery_expression']
                        }
                    )
        else:
            out += 'There are no discovery rules in this template.\n\n'

        out += '## Items collected\n\n'

        items_template = zabbix_server.item.get(
            output='extend',
            templateids=tmpl['templateid'],
            inherited=False
        )

        if len(items_template) > 0 or len(d_items) > 0:
            out += '|Name|Description|Type|Key and additional info|\n'
            out += '|----|-----------|----|----|\n'
            for itm in items_template:
                out += '|{}|<p>{}</p>|`{}`|{}<p>Update: {}</p>|\n'.format(
                    itm['name'],
                    '-' if itm['description'] == '' else re.sub(
                        r'[\t\\\r\n ]+', " ", itm['description']),
                    item_types[itm['type']],
                    itm['key_'],
                    itm['delay']
                )

            for itm2 in d_items:
                out += '|{}|<p>{}</p>|`{}`|{}<p>Update: {}</p><p>LLD</p>|\n'.format(
                    itm2['name'],
                    '-' if itm2['description'] == '' else re.sub(
                        r'[\t\\\r\n ]+', " ", itm2['description']),
                    item_types[itm2['type']],
                    itm2['key_'],
                    itm2['delay']
                )
        else:
            out += 'There are no items in this template.\n\n'

        out += '## Triggers\n\n'

        tmp_triggers2 = zabbix_server.triggerprototype.get(
            output='extend',
            templateids=[tmpl['templateid']],
            expandExpression=True
        )

        if len(tmp_triggers2) > 0 or len(d_triggers) > 0:
            out += '|Name|Description|Expression|Priority|\n'
            out += '|----|-----------|----------|--------|\n'
            for trg in tmp_triggers2:
                out += '|{}|<p>{}</p>|<p>**Expression**: {}</p><p>**Recovery expression**: {}</p>|{}|\n'.format(
                    trg['description'],
                    '-' if trg['comments'] == '' else re.sub(
                        r'[\t\\\r\n ]+', " ", trg['comments']),
                    re.sub(r'[\t\\\r\n ]+', " ", trg['expression']),
                    re.sub(r'[\t\\\r\n ]+', " ", trg['recovery_expression']),
                    trigger_priority[trg['priority']]
                )
            for trg2 in d_triggers:
                out += '|{} (LLD)|<p>{}</p>|<p>**Expression**: {}</p><p>**Recovery expression**: {}</p>|{}|\n'.format(
                    trg2['description'],
                    '-' if trg2['comments'] == '' else re.sub(
                        r'[\t\\\r\n ]+', " ", trg2['comments']),
                    re.sub(r'[\t\\\r\n ]+', " ", trg2['expression']),
                    re.sub(r'[\t\\\r\n ]+', " ", trg2['recovery_expression']),
                    trigger_priority[trg2['priority']]
                )
        else:
            out += 'There are no triggers in this template.\n\n'

    out_obj['readme'] = out
    out_obj['meta'].sort(key=lambda e: e['links'], reverse=True)
    return out_obj


def clear_file_name(name):
    """
    Args:
        name (string): 

    Returns:
        string:
    """
    name = re.sub(r'[\t\\/:"*?<>| ]+', "_", name)
    name = re.sub(r'[_-]?template[_-]?', "", name)
    name = name.replace('_-_', '-')
    name = name.strip()
    name = 'template_{}'.format(name)
    return name


def parse_dir(directory):
    """Iterative view of the catalog tree 

    Args:
        directory (path): Path to the catalog 
    """
    for dir in os.listdir(directory):
        if dir in ['.git', '.github']:
            continue
        if dir in servers_data.keys():
            parse_template(directory)
        next_dir = os.path.join(directory, dir)
        if os.path.isdir(next_dir):
            if dir.startswith('template_'):
                parse_template(next_dir)
            else:
                parse_dir(next_dir)


def check_p1(directory):
    """Checking the structure of the catalog.         

    Args:
        directory (path): Path to the catalog 
    """
    normpath = os.path.relpath(directory)
    normpath = os.path.normpath(normpath)
    template_directory = normpath.split(os.sep)[-1]
    if re.match(r'template_[a-z_\-0-9\.]{4,}', template_directory) == None:
        print(json.dumps({
            'code': 1,
            'message': 'Directory name error',
            'detail': 'Critical error in "{}". Automatic correction is not possible. Stop checking.'.format(directory)
        }, indent=4))
        exit(1)


def check_p2_2(directory, version):
    """Checking the structure of the catalog.         

    Args:
        directory (path): Path to the catalog
        version (string): Nested template version catalog 
    """
    contain_template_file = False
    contain_readme_file = False
    template_names = []
    t_directory = os.path.join(directory, version)
    for dir in os.listdir(t_directory):
        if os.path.isfile(os.path.join(t_directory, dir)):
            if dir.split('.')[-1] in servers_data[version]['file_types']:
                if contain_template_file:
                    print(json.dumps({
                        'code': 2,
                        'message': 'Error structure directory',
                        'detail': 'Multiple template files. The template file must be only one. Template directory: "{}"'.format(t_directory)
                    }, indent=4))
                    exit(2)
                else:
                    contain_template_file = True
                    template_format = dir.split('.')[-1]
                    with open(os.path.join(t_directory, dir), 'r', encoding='utf-8') as template_file:
                        r_file = template_file.read()
                        template_file.close()
                    if template_format == 'xml':
                        try:
                            in_template = xmltodict.parse(
                                r_file, encoding='utf-8')
                            if not 'zabbix_export' in in_template:
                                print(json.dumps({
                                    'code': 6.11,
                                    'message': 'Import error',
                                    'detail': 'Error importing in the stock server. Template directory: "{}"'.format(t_directory)
                                }, indent=4))
                                exit(6)
                            else:
                                if not float(in_template['zabbix_export']['version']) == float(version):
                                    print(json.dumps({
                                        'code': 2,
                                        'message': 'Non-compliance version',
                                        'detail': 'The version in the template does not match the directory. Template directory: "{}"'.format(t_directory)
                                    }, indent=4))
                                    exit(2)
                        except Exception as err:
                            print(json.dumps({
                                'code': 6.1,
                                'message': 'Import error',
                                'detail': 'Error importing in the stock server. Template directory: "{}"'.format(t_directory)
                            }, indent=4))
                            exit(6)
                        if 'templates' in in_template['zabbix_export']:
                            if isinstance(in_template['zabbix_export']['templates']['template'], list):
                                for template in in_template['zabbix_export']['templates']['template']:
                                    template_names.append(
                                        template['template'].strip())
                            else:
                                template_names.append(
                                    in_template['zabbix_export']['templates']['template']['template'].strip())
                    if template_format == 'json':
                        try:
                            in_template = json.dumps(r_file)
                            if not 'zabbix_export' in in_template:
                                print(json.dumps({
                                    'code': 6.2,
                                    'message': 'Import error',
                                    'detail': 'Error importing in the stock server. Template directory: "{}"'.format(t_directory)
                                }, indent=4))
                                exit(6)
                            else:
                                if not float(in_template['zabbix_export']['version']) == float(version):
                                    print(json.dumps({
                                        'code': 2,
                                        'message': 'Non-compliance version',
                                        'detail': 'The version in the template does not match the directory. Template directory: "{}"'.format(t_directory)
                                    }, indent=4))
                                    exit(2)
                        except Exception as err:
                            print(json.dumps({
                                'code': 6.3,
                                'message': 'Import error',
                                'detail': 'Error importing in the stock server. Template directory: "{}"'.format(t_directory)
                            }, indent=4))
                            exit(6)
                        if 'templates' in in_template['zabbix_export']:
                            for template in in_template['zabbix_export']['templates']:
                                template_names.append(
                                    template['template'].strip())
                    if template_format == 'yaml':
                        try:
                            in_template = yaml.load(r_file)
                            if not 'zabbix_export' in in_template:
                                print(json.dumps({
                                    'code': 6.4,
                                    'message': 'Import error',
                                    'detail': 'Error importing in the stock server. Template directory: "{}"'.format(t_directory)
                                }, indent=4))
                                exit(6)
                            else:
                                if not float(in_template['zabbix_export']['version']) == float(version):
                                    print(json.dumps({
                                        'code': 2,
                                        'message': 'Non-compliance version',
                                        'detail': 'The version in the template does not match the directory. Template directory: "{}"'.format(t_directory)
                                    }, indent=4))
                                    exit(2)
                        except Exception as err:
                            print(json.dumps({
                                'code': 6.5,
                                'message': 'Import error',
                                'detail': 'Error importing in the stock server. Template directory: "{}"'.format(t_directory)
                            }, indent=4))
                            exit(6)
                        if 'templates' in in_template['zabbix_export']:
                            for template in in_template['zabbix_export']['templates']:
                                template_names.append(
                                    template['template'].strip())
                    if len(template_names) > 0:
                        servers_data[version]['import_rule']['source'] = r_file
                        servers_data[version]['import_rule']['format'] = template_format
                        import_result = False
                        try:
                            import_result = servers_data[version]['server'].do_request(
                                'configuration.import', servers_data[version]['import_rule'])
                        except Exception as err:
                            print(err.data)
                        if not import_result:
                            print(json.dumps({
                                'code': 6.6,
                                'message': 'Import error',
                                'detail': 'Error importing in the stock server. Template directory: "{}"'.format(t_directory)
                            }, indent=4))
                            exit(6)
                        for template_name in template_names:
                            if not template_name == clear_template_name(template_name):
                                tmp_template_names = rename_template(
                                    template_names, servers_data[version]['max_id'], servers_data[version]['server'])
                                exportIds = get_template_list(
                                    tmp_template_names, servers_data[version]['server'])
                                out_template_file = servers_data[version]['server'].configuration.export(
                                    options={
                                        'templates': exportIds
                                    },
                                    format=template_format
                                )
                                delete_templates(
                                    tmp_template_names, servers_data[version]['max_id'], servers_data[version]['server'])
                                with open(os.path.join(t_directory, dir), 'w', encoding='utf-8') as out_file:
                                    out_file.write(out_template_file)
                                break
            else:
                if not dir == 'README.md':
                    print(json.dumps({
                        'code': 2,
                        'message': 'Error structure directory',
                        'detail': 'It is prohibited to use compressed files (zip, tar.gz, etc.). Template directory: "{}"'.format(t_directory)
                    }, indent=4))
                    exit(2)
            if dir == 'README.md':
                contain_readme_file = True
            check_p3(t_directory, dir)
    if not contain_readme_file:
        if len(template_names) > 0:
            with open(os.path.join(t_directory, 'README.md'), 'w', encoding='utf-8') as readme_md:
                readme_obj = get_readme(
                    template_names, servers_data[version]['server'])
                readme_md.write(readme_obj['readme'])


def check_p3(directory, file):
    """Checking the structure of the catalog. Check file name         

    Args:
        directory (path): Path to the catalog
        file (string): File name 
    """
    if file == 'README.md':
        return
    if re.match(r'template_[a-z_\-0-9\.]{4,}\.(xml|json|yaml)', file) == None:
        new_file_name = clear_file_name(file)
        os.rename(os.path.join(directory, file),
                    os.path.join(directory, new_file_name))


def check_p2_1(directory):
    """Checking the structure of the catalog.         

    Args:
        directory (path): Path to the catalog 
    """
    contain_version = False
    for dir in os.listdir(directory):
        if os.path.isfile(os.path.join(directory, dir)):
            print(json.dumps({
                'code': 2,
                'message': 'Error structure directory',
                'detail': 'In the template directory "{}", there can be only directories with versions (for example, 5.0, 5.4, etc.) '.format(directory)
            }, indent=4))
            exit(2)

        if not dir in servers_data.keys():
            print(json.dumps({
                'code': 2,
                'message': 'Error structure directory',
                'detail': 'In the template directory "{}", there can be only directories with versions (for example, 5.0, 5.4, etc.) '.format(directory)
            }, indent=4))
            exit(2)
        else:
            contain_version = True

        check_p2_2(directory, dir)

    if not contain_version:
        print(json.dumps({
            'code': 2,
            'message': 'Error structure directory',
            'detail': 'Lack of nested version directory. Template directory: "{}"'.format(directory)
        }, indent=4))
        exit(2)


def check_p7(directory):
    """Checking the structure of the catalog.         

    Args:
        directory (path): Path to the catalog 
    """
    list_version = list(servers_data.keys())
    list_dir = os.listdir(directory)
    ver_index_max = 0
    for index in range(0, len(list_version)):
        if list_version[index] in list_dir:
            ver_index_max = index

    for index in range(ver_index_max + 1, len(list_version)):
        os.mkdir(os.path.join(directory, list_version[index]))
        prev_directory = os.path.join(directory, list_version[index - 1])
        cur_directory = os.path.join(directory, list_version[index])
        if 'files' in os.listdir(prev_directory):
            shutil.copytree(os.path.join(prev_directory, 'files'),
                            os.path.join(directory, list_version[index]))
        shutil.copyfile(os.path.join(prev_directory, 'README.md'),
                        os.path.join(cur_directory, 'README.md'))
        for dir in os.listdir(prev_directory):
            if dir == 'README.md' or dir == 'files':
                continue
            template_names = []
            template_format = dir.split('.')[-1]
            with open(os.path.join(prev_directory, dir), 'r', encoding='utf-8') as template_file:
                r_file = template_file.read()
                template_file.close()
            if template_format == 'xml':
                try:
                    in_template = xmltodict.parse(
                        r_file, encoding='utf-8')
                except Exception as err:
                    print(json.dumps({
                        'code': 6.7,
                        'message': 'Import error',
                        'detail': 'Error importing in the stock server. Template directory: "{}"'.format(prev_directory)
                    }, indent=4))
                    exit(6)
                if 'templates' in in_template['zabbix_export']:
                    if isinstance(in_template['zabbix_export']['templates']['template'], list):
                        for template in in_template['zabbix_export']['templates']['template']:
                            template_names.append(
                                template['template'].strip())
                    else:
                        template_names.append(
                            in_template['zabbix_export']['templates']['template']['template'].strip())
            if template_format == 'json':
                try:
                    in_template = json.dumps(r_file)
                except Exception as err:
                    print(json.dumps({
                        'code': 6.8,
                        'message': 'Import error',
                        'detail': 'Error importing in the stock server. Template directory: "{}"'.format(prev_directory)
                    }, indent=4))
                    exit(6)
                if 'templates' in in_template['zabbix_export']:
                    for template in in_template['zabbix_export']['templates']:
                        template_names.append(
                            template['template'].strip())
            if template_format == 'yaml':
                try:
                    in_template = yaml.load(r_file)
                except Exception as err:
                    print(json.dumps({
                        'code': 6.9,
                        'message': 'Import error',
                        'detail': 'Error importing in the stock server. Template directory: "{}"'.format(prev_directory)
                    }, indent=4))
                    exit(6)
                if 'templates' in in_template['zabbix_export']:
                    for template in in_template['zabbix_export']['templates']:
                        template_names.append(
                            template['template'].strip())
            if len(template_names) > 0:
                servers_data[list_version[index]
                             ]['import_rule']['source'] = r_file
                servers_data[list_version[index]
                             ]['import_rule']['format'] = template_format
                import_result = False
                try:
                    import_result = servers_data[list_version[index]]['server'].do_request(
                        'configuration.import', servers_data[list_version[index]]['import_rule'])
                except Exception as err:
                    print(json.dumps(err.data))
                if not import_result:
                    print(json.dumps({
                        'code': 6.10,
                        'message': 'Import error',
                        'detail': 'Error importing in the stock server. Template directory: "{}"'.format(prev_directory)
                    }, indent=4))
                    exit(6)
                exportIds = get_template_list(
                    template_names, servers_data[list_version[index]]['server'])
                out_template_file = servers_data[list_version[index]]['server'].configuration.export(
                    options={
                        'templates': exportIds
                    },
                    format=servers_data[list_version[index]]['export_default']
                )
                delete_templates(
                    template_names, servers_data[list_version[index]]['max_id'], servers_data[list_version[index]]['server'])
                with open(os.path.join(cur_directory, '{}.{}'.format('.'.join(dir.split('.')[:-1]), servers_data[list_version[index]]['export_default'])), 'w', encoding='utf-8') as out_file:
                    out_file.write(out_template_file)


def parse_template(directory):
    """Processing directory template 

    Args:
        directory (path): Path to the catalog 
    """
    print(directory)
    check_p1(directory)
    check_p2_1(directory)
    check_p7(directory)


def main():
    """The main function.
    """
    print(os.getcwd())
    parse_dir(os.getcwd())


main()
