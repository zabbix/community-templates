#!/bin/sh
set -e

test -z "$ZABBIX_SERVER" && echo "ZABBIX_SERVER enviornment variable is required." && exit
test -z "$SPEEDTEST_HOST" && echo "SPEEDTEST_HOST enviornment variable is required." && exit

OUTFILE=$(mktemp)
NOW=$(date +%s)

speedtest $SPEEDTESTPARAMS -f json --accept-license > $OUTFILE

F="$(cat $OUTFILE)"

# do we have PSKID and PSKFILE?
if [ -f "$PSKFILE" -a -n "$PSKID" ];then
	zabbix_sender --tls-connect psk --tls-psk-identity "$PSKID" --tls-psk-file "$PSKFILE" -z "$ZABBIX_SERVER" -s "$SPEEDTEST_HOST" -k "custom.speedtest[runtime]" -o "$NOW" > /dev/null 2>&1
	zabbix_sender --tls-connect psk --tls-psk-identity "$PSKID" --tls-psk-file "$PSKFILE" -z "$ZABBIX_SERVER" -s "$SPEEDTEST_HOST" -k "custom.speedtest[json]" -o "$F" > /dev/null 2>&1
else
	zabbix_sender -z "$ZABBIX_SERVER" -s "$SPEEDTEST_HOST" -k "custom.speedtest[runtime]" -o "$NOW"
	zabbix_sender -z "$ZABBIX_SERVER" -s "$SPEEDTEST_HOST" -k "custom.speedtest[json]" -o "$F"
fi
