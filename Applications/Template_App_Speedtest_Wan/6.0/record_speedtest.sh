#!/bin/bash

# Agent Encryption
PSKID=""
PSKFILE=""

# Zabbix Server
ZABSRV=x.x.x.x

# Speedtest Host
SPDHOST=x.x.x.x

# program locations
SPEEDTEST="$(which speedtest)"
TIMEOUT="$(which timeout)"
ZABBIX_SENDER="$(which zabbix_sender)"

# timeout to run speedtest
TIMEOUTTIME=300

test -z "$SPEEDTEST" && echo "speedtest binary not found" && exit
test -z "$TIMEOUT" && echo "timeout binary not found" && exit
test -z "$ZABBIX_SENDER" && echo "zabbix_sender binary not found" && exit

if [ "$(speedtest -V | egrep -c 'Speedtest by Ookla')" -lt 1 ];then
	echo "The speedtest binary needs to be from Ookla."
	echo "Please visit https://www.speedtest.net/apps/cli"
	exit
fi

# Temporary speedtest output
OUTFILE=$(mktemp)

# what time is it?
NOW=$(date +%s)

$TIMEOUT $TIMEOUTTIME $SPEEDTEST -f json 2>/dev/null > $OUTFILE
if [ $(stat -c %s $OUTFILE) -le 100 ];then
	echo "ERROR running speedtest - output file too small - $OUTFILE"
	echo "You may want to try running $SPEEDTEST -f json manually"
	echo "and/or checking the contents of $OUTFILE"
	exit
fi

F="$(cat $OUTFILE)"

# do we have PSKID and PSKFILE?
if [ -f "$PSKFILE" -a -n "$PSKID" ];then
	$ZABBIX_SENDER --tls-connect psk --tls-psk-identity "$PSKID" --tls-psk-file "$PSKFILE" -z "$ZABSRV" -s "$SPDHOST" -k "custom.speedtest[runtime]" -o "$NOW" > /dev/null 2>&1
	$ZABBIX_SENDER --tls-connect psk --tls-psk-identity "$PSKID" --tls-psk-file "$PSKFILE" -z "$ZABSRV" -s "$SPDHOST" -k "custom.speedtest[json]" -o "$F" > /dev/null 2>&1
else
	$ZABBIX_SENDER -z "$ZABSRV" -s "$SPDHOST" -k "custom.speedtest[runtime]" -o "$NOW" > /dev/null 2>&1
	$ZABBIX_SENDER -z "$ZABSRV" -s "$SPDHOST" -k "custom.speedtest[json]" -o "$F" > /dev/null 2>&1
fi
rm -f $OUTFILE
