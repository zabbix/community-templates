#!/bin/bash
# ============================================================================
# kerio_mailstats.sh - Kerio Connect Mailflow-Statistiken für Zabbix
# ============================================================================
# Parst die Kerio Connect mail.log und security.log und gibt
# Mailflow-Statistiken als JSON aus (für Zabbix Dependent Items).
#
# Kerio Connect Log-Format:
#   [DD/Mon/YYYY HH:MM:SS] Recv: Queue-ID: ..., From: <...>, To: <...>, ...
#   [DD/Mon/YYYY HH:MM:SS] Sent: Queue-ID: ..., Result: delivered, ...
#   [DD/Mon/YYYY HH:MM:SS] Sent: Queue-ID: ..., Result: failed, ...
#   [DD/Mon/YYYY HH:MM:SS] Sent: Queue-ID: ..., Result: deferred, ...
#
# Verwendung: kerio_mailstats.sh [STORE_DIR]
#   STORE_DIR  Kerio Store-Verzeichnis (Standard: /opt/kerio/mailserver/store)
#
# Voraussetzung: gawk (GNU awk) muss installiert sein
#   Debian/Ubuntu: apt install gawk
#   RHEL/CentOS:   yum install gawk
#
# Ausgabe: JSON mit allen Mailflow-Kennzahlen
# ============================================================================

# Locale auf C setzen - verhindert lokalisierte Monatsnamen bei date +%b
export LC_ALL=C

STORE_DIR="${1:-/opt/kerio/mailserver/store}"

# Sicherheit: Pfad validieren - nur erlaubte Zeichen, keine Shellmetazeichen
if [[ "${STORE_DIR}" =~ [^a-zA-Z0-9/_.\-] ]]; then
    echo '{"error":"invalid store path","in_5m":0,"out_5m":0,"in_1h":0,"out_1h":0,"in_today":0,"out_today":0,"deferred_1h":0,"bounced_1h":0,"rejected_1h":0,"deferred_today":0,"bounced_today":0,"rejected_today":0,"queue_count":0,"queue_oldest_sec":0}'
    exit 0
fi

# Prüfen ob Verzeichnis existiert
if [ ! -d "${STORE_DIR}" ]; then
    echo '{"error":"store dir not found","in_5m":0,"out_5m":0,"in_1h":0,"out_1h":0,"in_today":0,"out_today":0,"deferred_1h":0,"bounced_1h":0,"rejected_1h":0,"deferred_today":0,"bounced_today":0,"rejected_today":0,"queue_count":0,"queue_oldest_sec":0}'
    exit 0
fi

MAIL_LOG="${STORE_DIR}/logs/mail.log"
SECURITY_LOG="${STORE_DIR}/logs/security.log"
QUEUE_DIR="${STORE_DIR}/queue"

MAIL_LOG_PREV="${MAIL_LOG}.0"
SECURITY_LOG_PREV="${SECURITY_LOG}.0"

NOW=$(date +%s)

# gawk ermitteln (benötigt für mktime und match mit Arrays)
AWK_CMD=""
if command -v gawk &>/dev/null; then
    AWK_CMD="gawk"
elif command -v awk &>/dev/null && awk 'BEGIN{mktime("2020 1 1 0 0 0")}' 2>/dev/null; then
    # awk unterstützt mktime (ist wahrscheinlich gawk als Default)
    AWK_CMD="awk"
else
    echo '{"error":"gawk required","in_5m":0,"out_5m":0,"in_1h":0,"out_1h":0,"in_today":0,"out_today":0,"deferred_1h":0,"bounced_1h":0,"rejected_1h":0,"deferred_today":0,"bounced_today":0,"rejected_today":0,"queue_count":0,"queue_oldest_sec":0}'
    exit 0
fi

# ============================================================================
# Zeitfenster berechnen
# ============================================================================
TS_5M_AGO=$((NOW - 300))
TS_1H_AGO=$((NOW - 3600))
TS_TODAY=$(date -d "$(date +%Y-%m-%d) 00:00:00" +%s)

# Frühester relevanter Zeitpunkt: der ältere Wert von ts_today und ts_1h
# (Zwischen 00:00 und 01:00 liegt ts_1h VOR Mitternacht)
if [ "${TS_1H_AGO}" -lt "${TS_TODAY}" ]; then
    TS_EARLIEST="${TS_1H_AGO}"
else
    TS_EARLIEST="${TS_TODAY}"
fi

# ============================================================================
# Temporäre Datei mit kombinierten Logs
# ============================================================================
TMPLOG=$(mktemp /tmp/kerio_mf_XXXXXX)
trap "rm -f ${TMPLOG}" EXIT

TODAY_STR=$(date +"%d/%b/%Y")
YESTERDAY_STR=$(date -d "yesterday" +"%d/%b/%Y" 2>/dev/null || date +"%d/%b/%Y")

# Mail-Log zusammenbauen (vorheriges Log nur für heute/gestern, aktuelles komplett)
{
    if [ -f "${MAIL_LOG_PREV}" ]; then
        grep -E "^\[${TODAY_STR}|^\[${YESTERDAY_STR}" "${MAIL_LOG_PREV}" 2>/dev/null
    fi
    if [ -f "${MAIL_LOG}" ]; then
        cat "${MAIL_LOG}" 2>/dev/null
    fi
} > "${TMPLOG}"

# ============================================================================
# Zählung mit gawk (einmaliger Durchlauf für Performance)
# ============================================================================
read IN_5M OUT_5M IN_1H OUT_1H IN_TODAY OUT_TODAY \
     DEFERRED_1H BOUNCED_1H DEFERRED_TODAY BOUNCED_TODAY <<< $(
${AWK_CMD} -v ts_5m="${TS_5M_AGO}" \
    -v ts_1h="${TS_1H_AGO}" \
    -v ts_today="${TS_TODAY}" \
    -v ts_earliest="${TS_EARLIEST}" \
'
BEGIN {
    split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec", m)
    for (i=1; i<=12; i++) mon[m[i]] = sprintf("%02d", i)

    in5=0; out5=0; in1h=0; out1h=0; intoday=0; outtoday=0
    def1h=0; bnc1h=0; deftoday=0; bnctoday=0
}

/^\[/ {
    match($0, /^\[([0-9]+)\/([A-Za-z]+)\/([0-9]+) ([0-9:]+)\]/, ts_parts)
    if (RSTART == 0) next

    month = mon[ts_parts[2]]
    if (month == "") next

    split(ts_parts[4], tp, ":")
    epoch = mktime(ts_parts[3] " " month+0 " " ts_parts[1]+0 " " tp[1]+0 " " tp[2]+0 " " tp[3]+0)
    if (epoch < ts_earliest) next

    is_recv    = ($0 ~ /\] Recv:/)
    is_sent    = ($0 ~ /\] Sent:/)

    if (is_recv) {
        if (epoch >= ts_today) intoday++
        if (epoch >= ts_1h) in1h++
        if (epoch >= ts_5m) in5++
    }

    if (is_sent) {
        if ($0 ~ /Result: delivered/ && $0 !~ /Remote-Host: 127\.0\.0\.1/) {
            if (epoch >= ts_today) outtoday++
            if (epoch >= ts_1h) out1h++
            if (epoch >= ts_5m) out5++
        }
        else if ($0 ~ /Result: relayed/) {
            if (epoch >= ts_today) outtoday++
            if (epoch >= ts_1h) out1h++
            if (epoch >= ts_5m) out5++
        }
        else if ($0 ~ /Result: deferred/) {
            if (epoch >= ts_today) deftoday++
            if (epoch >= ts_1h) def1h++
        }
        else if ($0 ~ /Result: failed/) {
            if (epoch >= ts_today) bnctoday++
            if (epoch >= ts_1h) bnc1h++
        }
    }
}

END {
    printf "%d %d %d %d %d %d %d %d %d %d",
        in5, out5, in1h, out1h, intoday, outtoday,
        def1h, bnc1h, deftoday, bnctoday
}
' "${TMPLOG}" 2>/dev/null
)

# Fallback bei leerer Ausgabe
IN_5M=${IN_5M:-0}; OUT_5M=${OUT_5M:-0}
IN_1H=${IN_1H:-0}; OUT_1H=${OUT_1H:-0}
IN_TODAY=${IN_TODAY:-0}; OUT_TODAY=${OUT_TODAY:-0}
DEFERRED_1H=${DEFERRED_1H:-0}; BOUNCED_1H=${BOUNCED_1H:-0}
DEFERRED_TODAY=${DEFERRED_TODAY:-0}; BOUNCED_TODAY=${BOUNCED_TODAY:-0}

# ============================================================================
# Rejected Mails aus Security-Log
# ============================================================================
REJECTED_1H=0
REJECTED_TODAY=0

if [ -f "${SECURITY_LOG}" ] || [ -f "${SECURITY_LOG_PREV}" ]; then
    read REJECTED_1H REJECTED_TODAY <<< $(
    {
        if [ -f "${SECURITY_LOG_PREV}" ]; then
            grep -E "^\[${TODAY_STR}" "${SECURITY_LOG_PREV}" 2>/dev/null
        fi
        if [ -f "${SECURITY_LOG}" ]; then
            cat "${SECURITY_LOG}" 2>/dev/null
        fi
    } | ${AWK_CMD} -v ts_1h="${TS_1H_AGO}" -v ts_today="${TS_TODAY}" -v ts_earliest="${TS_EARLIEST}" '
    BEGIN {
        split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec", m)
        for (i=1; i<=12; i++) mon[m[i]] = sprintf("%02d", i)
        rej1h=0; rejtoday=0
    }
    /^\[/ && /(rejected|denied|spam score exceeded|blacklisted|blocked)/ {
        match($0, /^\[([0-9]+)\/([A-Za-z]+)\/([0-9]+) ([0-9:]+)\]/, tp)
        if (RSTART > 0) {
            month = mon[tp[2]]
            if (month == "") next
            split(tp[4], tt, ":")
            epoch = mktime(tp[3] " " month+0 " " tp[1]+0 " " tt[1]+0 " " tt[2]+0 " " tt[3]+0)
            if (epoch >= ts_today) rejtoday++
            if (epoch >= ts_1h) rej1h++
        }
    }
    END { printf "%d %d", rej1h, rejtoday }
    ' 2>/dev/null
    )
fi

REJECTED_1H=${REJECTED_1H:-0}
REJECTED_TODAY=${REJECTED_TODAY:-0}

# ============================================================================
# Mailqueue
# ============================================================================
QUEUE_COUNT=0
QUEUE_OLDEST=0

if [ -d "${QUEUE_DIR}" ]; then
    QUEUE_COUNT=$(find "${QUEUE_DIR}" -name '*.eml' 2>/dev/null | wc -l)

    OLDEST_FILE=$(find "${QUEUE_DIR}" -name '*.eml' -printf '%T@ %p\n' 2>/dev/null | sort -n | head -1 | awk '{print $1}')
    if [ -n "${OLDEST_FILE}" ]; then
        OLDEST_EPOCH=${OLDEST_FILE%%.*}
        QUEUE_OLDEST=$((NOW - OLDEST_EPOCH))
        [ "${QUEUE_OLDEST}" -lt 0 ] && QUEUE_OLDEST=0
    fi
fi

# ============================================================================
# JSON-Ausgabe
# ============================================================================
cat <<EOF
{"in_5m":${IN_5M},"out_5m":${OUT_5M},"in_1h":${IN_1H},"out_1h":${OUT_1H},"in_today":${IN_TODAY},"out_today":${OUT_TODAY},"deferred_1h":${DEFERRED_1H},"bounced_1h":${BOUNCED_1H},"rejected_1h":${REJECTED_1H},"deferred_today":${DEFERRED_TODAY},"bounced_today":${BOUNCED_TODAY},"rejected_today":${REJECTED_TODAY},"queue_count":${QUEUE_COUNT},"queue_oldest_sec":${QUEUE_OLDEST}}
EOF

exit 0
