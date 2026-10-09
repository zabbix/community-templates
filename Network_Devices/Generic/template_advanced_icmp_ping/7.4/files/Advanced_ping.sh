#!/bin/bash
# Author:      Dusan Priechodsky (https://github.com/DuprTECH)
# Description: Advanced ICMP ping for Zabbix (external check).
#              Sends a batch of ICMP requests with fping and prints the summary line, e.g.
#              10.0.0.1 : xmt/rcv/%loss = 10/10/0%, min/avg/max = 1.88/12.49/45.03
# Usage:       Advanced_ping.sh <host> <count>
# License:     MIT

if [[ -z "$1" || -z "$2" ]]; then
	echo "Usage: $0 <host> <count>"
	exit 1
fi

FPING=$(command -v fping || echo /usr/sbin/fping)

# fping prints the summary to stderr, redirect it to stdout for Zabbix
"$FPING" "$1" -c "$2" -q -p 2000 -t 2000 2>&1
exit 0