#!/usr/bin/python3

import json
import argparse
from http.client import HTTPConnection
import socket
from xmlrpc import client

ZABBIX_DISCOVERY='{#SUPERVISOR_PROCESS_NAME}'

class UnixStreamHTTPConnection(HTTPConnection):
    def connect(self):
        self.sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        self.sock.connect(self.host)

class UnixStreamTransport(client.Transport, object):
    def __init__(self, socket_path):
        self.socket_path = socket_path
        super(UnixStreamTransport, self).__init__()

    def make_connection(self, host):
        return UnixStreamHTTPConnection(self.socket_path)

def get_supervisor_status(socket="/var/run/supervisor.sock"):
    server = client.ServerProxy('http://localhost', transport=UnixStreamTransport(socket))
    return server.supervisor.getAllProcessInfo()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Supervisor monitoring')
    parser.add_argument('cmd',type=str)
    parser.add_argument('socket',type=str)
    args = parser.parse_args()

    if args.cmd=='discovery':
        zabbix_discovery=[]
        for state in get_supervisor_status(args.socket):
            zabbix_discovery.append({ZABBIX_DISCOVERY: state['name']})
        print(json.dumps(zabbix_discovery))
    elif args.cmd=='status':
        json_response= { }
        for process in get_supervisor_status(args.socket):
            keys={}
            for key in process.keys():
                if key!='name':
                    keys[key]=process[key]
            keys['uptime']=process['now']-process['start']
            json_response[process['name']]=keys
        print(json.dumps(json_response))
