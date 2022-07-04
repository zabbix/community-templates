#!/bin/bash

# Agent Encryption
PSKID=""
PSKFILE=""

# Zabbix Server hostname or IP address
ZABSRV="x.x.x.x"

# Speedtest Host, the name of the host you've applied the template too as it's named in the Zabbix web UI
SPDHOST="name of the host you've applied the template too"

# Optional Speedtest CLI Params
SPEEDTESTPARAMS=""

# program locations
SPEEDTEST="$(which speedtest)"
TIMEOUT="$(which timeout)"
ZABBIX_SENDER="$(which zabbix_sender)"
DATE="$(which date)"
MKTEMP="$(which mktemp)"
STAT="$(which stat)"
CAT="$(which cat)"
EGREP="$(which egrep)"
RM="$(which rm)"

# timeout to run speedtest
TIMEOUTTIME=300

test -z "$SPEEDTEST" && echo "speedtest binary not found" && exit
test -z "$TIMEOUT" && echo "timeout binary not found" && exit
test -z "$ZABBIX_SENDER" && echo "zabbix_sender binary not found" && exit
test -z "$DATE" && echo "date binary not found" && exit
test -z "$MKTEMP" && echo "mktemp binary not found" && exit
test -z "$STAT" && echo "stat binary not found" && exit
test -z "$CAT" && echo "cat binary not found" && exit
test -z "$EGREP" && echo "egrep binary not found" && exit
test -z "$RM" && echo "rm binary not found" && exit

if [ "$($SPEEDTEST -V | $EGREP -c 'Speedtest by Ookla')" -lt 1 ];then
	echo "The speedtest binary needs to be from Ookla."
	echo "Please visit https://www.speedtest.net/apps/cli"
	exit
fi

# Temporary speedtest output
OUTFILE=$($MKTEMP)

# what time is it?
NOW=$($DATE +%s)

$TIMEOUT $TIMEOUTTIME $SPEEDTEST $SPEEDTESTPARAMS -f json 2>/dev/null > $OUTFILE
if [ $($STAT -c %s $OUTFILE) -le 100 ];then
	echo "ERROR running speedtest - output file too small - $OUTFILE"
	echo "You may want to try running $SPEEDTEST -f json manually"
	echo "and/or checking the contents of $OUTFILE"
	exit
fi

F="$($CAT $OUTFILE)"

# do we have PSKID and PSKFILE?
if [ -f "$PSKFILE" -a -n "$PSKID" ];then
	$ZABBIX_SENDER --tls-connect psk --tls-psk-identity "$PSKID" --tls-psk-file "$PSKFILE" -z "$ZABSRV" -s "$SPDHOST" -k "custom.speedtest[runtime]" -o "$NOW" > /dev/null 2>&1
	$ZABBIX_SENDER --tls-connect psk --tls-psk-identity "$PSKID" --tls-psk-file "$PSKFILE" -z "$ZABSRV" -s "$SPDHOST" -k "custom.speedtest[json]" -o "$F" > /dev/null 2>&1
else
	$ZABBIX_SENDER -z "$ZABSRV" -s "$SPDHOST" -k "custom.speedtest[runtime]" -o "$NOW" > /dev/null 2>&1
	$ZABBIX_SENDER -z "$ZABSRV" -s "$SPDHOST" -k "custom.speedtest[json]" -o "$F" > /dev/null 2>&1
fi
$RM -f $OUTFILE
