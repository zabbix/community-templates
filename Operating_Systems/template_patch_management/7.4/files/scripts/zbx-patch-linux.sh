#!/bin/bash
# ----------------------------------------------------------------------------
# zbx-patch-linux.sh
# Checks pending package updates on Linux and sends the result to Zabbix with
# zabbix_sender, to the OS independent template 'APP Patch management all OS'
# (keys patch.*, the same keys as zbx-patch-windows.ps1 on Windows).
#
# Supports apt (Debian / Ubuntu) and dnf / yum (RHEL / Rocky / Alma / Oracle / Fedora / CentOS).
#
# Values that don't exist on Linux (definition, service packs, update rollups, drivers,
# upgrades) are sent as 0. Values that can't be determined (severity and bugfix /
# enhancement on apt, repository availability when not root) are not sent.
#
# Run it as root from cron (recommended), for example /etc/cron.d/zbx-patch-linux:
#   0 */3 * * * root /usr/local/bin/zbx-patch-linux.sh >/dev/null 2>&1
#
# Settings (environment variables):
#   ZABBIX_SENDER   path to zabbix_sender          (default: zabbix_sender)
#   ZABBIX_CONF     agent config with Hostname / ServerActive
#                   (default: /etc/zabbix/zabbix_agent2.conf or zabbix_agentd.conf)
#   ZABBIX_SERVER   optional Zabbix server / proxy (instead of ServerActive)
#   ZABBIX_HOST     optional host name in Zabbix   (instead of Hostname; default uname -n
#                   when the config has no Hostname, for example HostnameItem=system.hostname)
#   HISTORY_LINES   number of lines in the update history item (default: 50)
#
# Author : Dusan Priechodsky
# Source : https://github.com/DuprTECH/Zabbix-Patch-Management-Windows-Linux
# Contact: info@duprtech.sk
# License: MIT
# ----------------------------------------------------------------------------

ZABBIX_SENDER="${ZABBIX_SENDER:-zabbix_sender}"
HISTORY_LINES="${HISTORY_LINES:-50}"
if [ -z "$ZABBIX_CONF" ]; then
    for c in /etc/zabbix/zabbix_agent2.conf /etc/zabbix/zabbix_agentd.conf; do
        [ -f "$c" ] && ZABBIX_CONF="$c" && break
    done
fi

# Host name: zabbix_sender takes Hostname from the agent config, but it can't resolve
# HostnameItem (for example HostnameItem=system.hostname). Without Hostname in the config
# (or its Include files) send the name of system.hostname, that is uname -n.
if [ -z "$ZABBIX_HOST" ] && [ -n "$ZABBIX_CONF" ]; then
    CONF_FILES="$ZABBIX_CONF"
    for inc in $(sed -n 's/^Include=//p' "$ZABBIX_CONF"); do
        [ -d "$inc" ] && inc="$inc/*"
        CONF_FILES="$CONF_FILES $inc"
    done
    # shellcheck disable=SC2086
    grep -hqs '^Hostname=' $CONF_FILES || ZABBIX_HOST=$(uname -n)
fi

send() {
    local args=()
    [ -n "$ZABBIX_CONF" ]   && args+=(-c "$ZABBIX_CONF")
    [ -n "$ZABBIX_SERVER" ] && args+=(-z "$ZABBIX_SERVER")
    [ -n "$ZABBIX_HOST" ]   && args+=(-s "$ZABBIX_HOST")
    "$ZABBIX_SENDER" "${args[@]}" "$@"
}

# Quoted value for the zabbix_sender input file
q() { printf '"%s"' "$(printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g')"; }

# Patch day of a unix timestamp, for example 2.Tue (2nd Tuesday of the month)
patchday() {
    local d
    d=$(date -d "@$1" +%-d)
    echo "$(( (d - 1) / 7 + 1 )).$(LC_ALL=C date -d "@$1" +%a)"
}

START=$(date +%s)
WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT

IS_ROOT=0
[ "$(id -u)" -eq 0 ] && IS_ROOT=1

OS_NAME=$(uname -s)
[ -r /etc/os-release ] && OS_NAME=$(. /etc/os-release && echo "${PRETTY_NAME:-$NAME $VERSION}")
OS_VERSION=$(uname -r)
LASTBOOT=$(awk '/^btime/ {print $2}' /proc/stat)

# Kernel packages (Debian / Ubuntu linux-image-*, RHEL kernel / kernel-core / kernel-uek ...)
KERNEL_RE='^(linux-(image|headers|modules|generic|signed|virtual|lowlatency|kernel)|kernel)([-_.].*)?$'

ALL=0; SECURITY=0; KERNEL=0; HELD=0
CRITICAL=""; BUGFIX=""; ENHANCEMENT=""          # empty = can't be determined, not sent
SEV_CRITICAL=""; SEV_IMPORTANT=""; SEV_MODERATE=""; SEV_LOW=""
LIST=""; HISTORY=""; REBOOT=0; REBOOT_REASON=""
REPO=""; PKGMGR="unknown"; AUTOUPDATE=0; LASTUPDATE=""; RESULT="OK"

if command -v apt-get >/dev/null 2>&1; then
    # ======================= Debian / Ubuntu =======================
    PKGMGR="apt"
    if [ "$IS_ROOT" -eq 1 ]; then
        if apt-get update -qq >/dev/null 2>&1; then REPO=1; else REPO=0; fi
    fi
    # "Inst <package> [<old version>] (<new version> <suite> [<arch>])"
    LANG=C apt-get -s -o Debug::NoLocking=1 dist-upgrade 2>/dev/null | grep '^Inst ' > "$WORK/inst"
    if [ -s "$WORK/inst" ]; then
        LIST=$(awk '{
            pkg = $2; old = ""
            if ($3 ~ /^\[/) { old = $3; gsub(/[][]/, "", old) }
            rest = $0; sub(/^[^(]*\(/, "", rest); split(rest, f, " ")
            cat = (rest ~ /[Ss]ecurity/) ? "security" : "update"
            print "[" cat "] " pkg " " (old != "" ? old " -> " : "") f[1]
        }' "$WORK/inst")
        ALL=$(wc -l < "$WORK/inst")
        SECURITY=$(printf '%s\n' "$LIST" | grep -c '^\[security\]')
        KERNEL=$(awk '{print $2}' "$WORK/inst" | grep -cE "$KERNEL_RE")
    fi
    HELD=$(apt-mark showhold 2>/dev/null | grep -c .)

    if [ -f /var/run/reboot-required ]; then
        REBOOT=1
        REBOOT_REASON="reboot-required"
        [ -f /var/run/reboot-required.pkgs ] && \
            REBOOT_REASON="Packages: $(sort -u /var/run/reboot-required.pkgs | tr '\n' ' ')"
    fi

    if dpkg-query -W -f='${Status}' unattended-upgrades 2>/dev/null | grep -q 'install ok installed' \
       && apt-config dump 2>/dev/null | grep -qE '^APT::Periodic::Unattended-Upgrade "(1|always)"'; then
        AUTOUPDATE=1
    fi

    # History from /var/log/apt/history.log (+ the last rotated logs), oldest first
    LOGS=$(ls -1tr /var/log/apt/history.log* 2>/dev/null | tail -n 3)
    if [ -n "$LOGS" ]; then
        # shellcheck disable=SC2086
        zcat -f $LOGS 2>/dev/null | awk '
            /^Start-Date:/ { d = $2 " " substr($3, 1, 5) }
            /^(Install|Upgrade|Downgrade|Remove|Purge|Reinstall):/ {
                act = $1; sub(/:$/, "", act)
                s = $0; sub(/^[A-Za-z]+: /, "", s)
                n = split(s, parts, /\), /)
                for (i = 1; i <= n; i++) {
                    p = parts[i]; sub(/\)$/, "", p)
                    name = p; sub(/ \(.*/, "", name)
                    v = p; sub(/^[^(]*\(/, "", v); sub(/, automatic$/, "", v)
                    if (act == "Upgrade" || act == "Downgrade") sub(/, /, " -> ", v)
                    print d "  " act "  " name " " v
                }
            }' > "$WORK/hist"
        if [ -s "$WORK/hist" ]; then
            HISTORY=$(tail -n "$HISTORY_LINES" "$WORK/hist" | tac)
            LASTUPDATE=$(date -d "$(tail -n 1 "$WORK/hist" | cut -c1-16)" +%s 2>/dev/null)
        fi
    fi
    if [ -z "$LASTUPDATE" ]; then
        LASTUPDATE=$(find /var/lib/dpkg/info -name '*.list' -printf '%T@\n' 2>/dev/null | sort -n | tail -n 1 | cut -d. -f1)
    fi

elif command -v dnf >/dev/null 2>&1 || command -v yum >/dev/null 2>&1; then
    # ======================= RHEL family =======================
    if command -v dnf >/dev/null 2>&1; then PKGMGR="dnf"; else PKGMGR="yum"; fi
    LANG=C "$PKGMGR" -q check-update > "$WORK/upd" 2>/dev/null
    RC=$?   # 100 = updates available, 0 = none, 1 = error
    if [ "$RC" -eq 1 ]; then
        REPO=0
        RESULT="ERROR: $PKGMGR check-update failed"
    else
        REPO=1
    fi
    # "<name>.<arch> <version> <repo>", the section "Obsoleting Packages" is skipped
    awk '/^Obsoleting/ {exit} NF == 3 && $1 !~ /^(Security:|Last)/ {
            n = $1; sub(/\.[^.]*$/, "", n); print n " " $2 }' "$WORK/upd" > "$WORK/pending"

    # Advisories of the available updates
    #   dnf4 / yum: <advisory> <type or severity/Sec.> <nevra>
    #   dnf5:       <advisory> <type> <severity> <nevra> <issued>
    if [ "$PKGMGR" = "dnf" ]; then UIARGS=(updateinfo list --available); else UIARGS=(updateinfo list); fi
    LANG=C "$PKGMGR" -q "${UIARGS[@]}" 2>/dev/null | awk '
        NF >= 3 && $1 != "Name" {
            if ($2 ~ /\/Sec\.?$/) { type = "security"; sev = $2; sub(/\/Sec\.?$/, "", sev); pkg = $3 }
            else if ($2 ~ /^(security|bugfix|enhancement|newpackage|unspecified)$/) {
                type = $2
                if (NF >= 5) { sev = $3; pkg = $4 } else { sev = ""; pkg = $3 }
            } else next
            sub(/-[^-]+-[^-]+$/, "", pkg)      # nevra -> name
            print pkg "\t" type "\t" sev
        }' > "$WORK/advisories"

    # Severity rank of a package = highest severity of its security advisories
    awk -F'\t' '
        function rank(s) { return s == "Critical" ? 4 : s == "Important" ? 3 : s == "Moderate" ? 2 : s == "Low" ? 1 : 0 }
        FILENAME == ARGV[1] {
            if ($2 == "security") { sec[$1] = 1; if (rank($3) > r[$1]) { r[$1] = rank($3); sv[$1] = $3 } }
            else if ($2 == "bugfix") bug[$1] = 1
            else if ($2 == "enhancement") enh[$1] = 1
            next
        }
        {
            split($0, f, " "); n = f[1]
            if (n in sec)      tag = "[security]" (sv[n] != "" ? " [" sv[n] "]" : "")
            else if (n in bug) tag = "[bugfix]"
            else if (n in enh) tag = "[enhancement]"
            else               tag = "[update]"
            print tag " " $0
        }' "$WORK/advisories" "$WORK/pending" > "$WORK/list"

    if [ -s "$WORK/list" ]; then
        LIST=$(cat "$WORK/list")
        ALL=$(wc -l < "$WORK/list")
        KERNEL=$(awk '{print $1}' "$WORK/pending" | grep -cE "$KERNEL_RE")
    fi
    SECURITY=$(grep -c '^\[security\]' "$WORK/list")
    CRITICAL=$(grep -c '^\[security\] \[Critical\]' "$WORK/list")
    SEV_CRITICAL=$CRITICAL
    SEV_IMPORTANT=$(grep -c '^\[security\] \[Important\]' "$WORK/list")
    SEV_MODERATE=$(grep -c '^\[security\] \[Moderate\]' "$WORK/list")
    SEV_LOW=$(grep -c '^\[security\] \[Low\]' "$WORK/list")
    BUGFIX=$(grep -c '^\[bugfix\]' "$WORK/list")
    ENHANCEMENT=$(grep -c '^\[enhancement\]' "$WORK/list")

    # Version lock (dnf4 / yum / dnf5)
    for f in /etc/dnf/plugins/versionlock.list /etc/yum/pluginconf.d/versionlock.list; do
        [ -f "$f" ] && HELD=$(( HELD + $(grep -cvE '^[[:space:]]*(#|$)' "$f") ))
    done
    [ -f /etc/dnf/versionlock.toml ] && HELD=$(( HELD + $(grep -c '^\[\[packages\]\]' /etc/dnf/versionlock.toml) ))

    # needs-restarting -r: exit 1 = reboot required (dnf-utils / yum-utils)
    NR=""
    if command -v needs-restarting >/dev/null 2>&1; then
        NR=$(LANG=C needs-restarting -r 2>/dev/null); [ $? -eq 1 ] && REBOOT=1
    elif [ "$PKGMGR" = "dnf" ]; then
        NR=$(LANG=C dnf -q needs-restarting -r 2>/dev/null); [ $? -eq 1 ] && REBOOT=1
    fi
    if [ "$REBOOT" -eq 1 ]; then
        REBOOT_REASON=$(printf '%s\n' "$NR" | sed -n 's/^ *\* *//p' | tr '\n' ' ')
        REBOOT_REASON="Updated: ${REBOOT_REASON:-see needs-restarting -r}"
    fi

    for t in dnf-automatic-install.timer; do
        systemctl is-enabled -q "$t" 2>/dev/null && AUTOUPDATE=1
    done
    for t in dnf-automatic.timer dnf5-automatic.timer; do
        systemctl is-enabled -q "$t" 2>/dev/null \
            && grep -qE '^[[:space:]]*apply_updates[[:space:]]*=[[:space:]]*(yes|true|1)' /etc/dnf/automatic.conf 2>/dev/null \
            && AUTOUPDATE=1
    done
    systemctl is-enabled -q yum-cron 2>/dev/null \
        && grep -qE '^[[:space:]]*apply_updates[[:space:]]*=[[:space:]]*yes' /etc/yum/yum-cron.conf 2>/dev/null \
        && AUTOUPDATE=1

    # History from the rpm database (install time of the packages), newest first
    rpm -qa --qf '%{INSTALLTIME} %{NAME} %{VERSION}-%{RELEASE}.%{ARCH}\n' 2>/dev/null \
        | sort -rn | head -n "$HISTORY_LINES" > "$WORK/hist"
    if [ -s "$WORK/hist" ]; then
        LASTUPDATE=$(head -n 1 "$WORK/hist" | cut -d' ' -f1)
        HISTORY=$(while read -r ts name ver; do
            printf '%s  Installed  %s %s\n' "$(date -d "@$ts" '+%Y-%m-%d %H:%M')" "$name" "$ver"
        done < "$WORK/hist")
    fi
else
    RESULT="ERROR: no supported package manager found (apt, dnf, yum)"
fi

# Reboot fallback for both families: the newest installed kernel is not the running one
if [ "$REBOOT" -eq 0 ]; then
    NEWEST=$(ls -1 /boot/vmlinuz-* 2>/dev/null | sed 's|^/boot/vmlinuz-||' | grep -v rescue | sort -V | tail -n 1)
    if [ -n "$NEWEST" ] && [ "$NEWEST" != "$OS_VERSION" ]; then
        REBOOT=1
        REBOOT_REASON="Running kernel $OS_VERSION, newest installed kernel $NEWEST"
    fi
fi

[ -z "$LIST" ] && LIST="No pending updates"
[ -z "$HISTORY" ] && HISTORY="No update history found"
[ -z "$REBOOT_REASON" ] && REBOOT_REASON="-"
CHECK_OK=1
case "$RESULT" in ERROR*) CHECK_OK=0 ;; esac

{
    echo "- patch.os Linux"
    echo "- patch.os.name $(q "$OS_NAME")"
    echo "- patch.os.version $(q "$OS_VERSION")"
    echo "- patch.source $PKGMGR"
    [ -n "$REPO" ] && echo "- patch.source.available $REPO"
    echo "- patch.check.timestamp $(date +%s)"
    echo "- patch.check.duration $(( $(date +%s) - START ))"
    echo "- patch.check.result $(q "$RESULT")"
    echo "- patch.reboot.required $REBOOT"
    [ -n "$LASTBOOT" ] && echo "- patch.lastboot $LASTBOOT"
    echo "- patch.autoupdate $AUTOUPDATE"
    if [ -n "$LASTUPDATE" ]; then
        echo "- patch.lastupdate.timestamp $LASTUPDATE"
        echo "- patch.lastupdate.patchday $(patchday "$LASTUPDATE")"
    fi
    if [ "$CHECK_OK" -eq 1 ]; then
        echo "- patch.updates.all $ALL"
        echo "- patch.updates.security $SECURITY"
        echo "- patch.updates.kernel $KERNEL"
        echo "- patch.updates.held $HELD"
        [ -n "$CRITICAL" ]      && echo "- patch.updates.critical $CRITICAL"
        [ -n "$BUGFIX" ]        && echo "- patch.updates.bugfix $BUGFIX"
        [ -n "$ENHANCEMENT" ]   && echo "- patch.updates.enhancement $ENHANCEMENT"
        [ -n "$SEV_CRITICAL" ]  && echo "- patch.updates.severity.critical $SEV_CRITICAL"
        [ -n "$SEV_IMPORTANT" ] && echo "- patch.updates.severity.important $SEV_IMPORTANT"
        [ -n "$SEV_MODERATE" ]  && echo "- patch.updates.severity.moderate $SEV_MODERATE"
        [ -n "$SEV_LOW" ]       && echo "- patch.updates.severity.low $SEV_LOW"
        # Windows only categories
        for k in definition servicepacks updaterollups drivers upgrades; do
            echo "- patch.updates.$k 0"
        done
    fi
} > "$WORK/values"
send -i "$WORK/values"

# Multi-line text values are sent separately
send -k patch.reboot.reason -o "$REBOOT_REASON"
send -k patch.history -o "$HISTORY"
[ "$CHECK_OK" -eq 1 ] && send -k patch.updates.list -o "$LIST"

echo "$OS_NAME: pending $ALL (security $SECURITY, critical ${CRITICAL:-n/a}, kernel $KERNEL), reboot required: $REBOOT, result: $RESULT"
exit 0
