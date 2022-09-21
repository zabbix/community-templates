#!/usr/bin/env python3

import sys
import socket
import json


username, password = "", ""

argc = len(sys.argv)

if argc in (3, 5):
    host, port = sys.argv[1], int(sys.argv[2])
    if argc == 5:
        username, password = sys.argv[3], sys.argv[4]
else:
    print(f"Usage: {sys.argv[0]} <host> <port> [<user> <pass>]")
    sys.exit(1)

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect((host, port))
sock.settimeout(5)


def conv(s):
    try:
        s = int(s)
    except BaseException:
        try:
            s = float(s)
        except BaseException:
            return s

    return s


def read_reply(cmd):
    sock.sendall(str.encode(cmd + "\n"))
    r = []

    while True:
        s = sock.recv(8192).decode('ascii')

        for l in s.split("\n"):
            if l == "" or l.startswith("BEGIN"):
                continue
            elif l.startswith("END"):
                return r

            r.append(l)


def send_cmd(cmd, expect):
    sock.sendall(str.encode(cmd))
    r = sock.recv(1024).decode('ascii')
    if r != expect:
        raise Exception(f"{r} != {expect}\n")


def list_ups():
    ups = []
    for l in read_reply("LIST UPS"):
        t = l.split(" ", 2)
        ups.append(t[1])
    return ups


def read_vars(ups):
    vars = {}
    for l in read_reply(f"LIST VAR {ups}"):
        t = l.split(" ", 3)
        vars[t[2]] = conv(t[3][1:len(t[3]) - 1])
    return vars


if username != "":
    send_cmd(f"USERNAME {username}\n", "OK\n")
    send_cmd(f"PASSWORD {password}\n", "OK\n")

r = {'vars': {}}
ups_list = list_ups()
r['list'] = [{'name': x} for x in ups_list]

for u in ups_list:
    r['vars'][u] = read_vars(u)

sock.sendall(b'LOGOUT\n')
sock.close()

json.dump(r, sys.stdout, indent=1)
