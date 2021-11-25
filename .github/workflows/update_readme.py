#!/usr/bin/env python
import json
import os
import xmltodict


global_readme_obj = []


def get_from_list(list_tmpl=[], index=0):
    """Getting a list of the index list 

    Args:
        list_tmpl (list, optional): . Defaults to [].
        index (int, optional): . Defaults to 0.

    """
    if index < len(list_tmpl):
        return list_tmpl[index]
    else:
        return None


def print_ident(col):
    """Adding indents in accordance with the level 

    Args:
        col (int): level 

    Returns:
        str: 
    """
    ident = '    '
    out = ''
    for i in range(0, col):
        out += ident
    return out


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
                parse_dir(next_dir)


def parse_template(directory):
    """Processing directory template 

    Args:
        directory (path): Path to the catalog 
    """
    print(directory)
    next_dir_50 = os.path.join(directory, '5.0')
    if not os.path.isdir(next_dir_50):
        return
    for file in os.listdir(next_dir_50):
        if not os.path.isfile(os.path.join(next_dir_50, file)):
            continue
        if not file.split('.')[-1] == 'xml':
            continue
        template_names = []
        with open(os.path.join(next_dir_50, file), 'r', encoding='utf-8') as xml_file:
            r_file = xml_file.read()
            try:
                in_template = xmltodict.parse(
                    r_file, encoding='utf-8')
                if not 'templates' in in_template['zabbix_export']:
                    return
                if isinstance(in_template['zabbix_export']['templates']['template'], list):
                    for template in in_template['zabbix_export']['templates']['template']:
                        if 'templates' in template:
                            template_names.append({
                                'name': template['template'],
                                'links': len(template['templates'])
                            })
                        else:
                            template_names.append({
                                'name': template['template'],
                                'links': 0
                            })
                else:
                    template_names.append({
                        'name': in_template['zabbix_export']['templates']['template']['template'],
                        'links': 0
                    })
            except Exception as err:
                print('Error:', err)
        template_names.sort(
            key=lambda e:  e['links'], reverse=True)
        normpath = os.path.relpath(directory)
        normpath = os.path.normpath(normpath)
        path = normpath.split(os.sep)
        path.append(template_names)
        global_readme_obj.append(path)


def main():
    """The main function. Generation readme.md file. 
    """
    parse_dir(os.getcwd())

    with open('.github/workflows/template_readme.md', encoding='utf-8') as template_readme:
        out_global_readme = template_readme.read()

    out_global_readme += '## Templates\n'

    global_readme_obj.sort(key=lambda e: json.dumps(e))

    for i in range(0, len(global_readme_obj)):
        for j in range(0, len(global_readme_obj[i]) - 1):
            if i == 0:
                if j == len(global_readme_obj[i]) - 2:
                    out_global_readme += '{}* [{}]({})\n'.format(print_ident(
                        j), global_readme_obj[i][j+1][0]['name'], '/'.join(global_readme_obj[i][:j+1]))
                else:
                    out_global_readme += '{}* [{}]({})\n'.format(print_ident(
                        j), global_readme_obj[i][j], '/'.join(global_readme_obj[i][:j+1]))

            else:
                if j == len(global_readme_obj[i]) - 2:
                    out_global_readme += '{}* [{}]({})\n'.format(print_ident(
                        j), global_readme_obj[i][j+1][0]['name'], '/'.join(global_readme_obj[i][:j+1]))
                else:
                    if not global_readme_obj[i][j] == get_from_list(global_readme_obj[i-1], j):
                        out_global_readme += '{}* [{}]({})\n'.format(print_ident(
                            j), global_readme_obj[i][j], '/'.join(global_readme_obj[i][:j+1]))

    with open('README.md', 'w', encoding='utf-8') as README_global:
        README_global.write(out_global_readme)


main()
