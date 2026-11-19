#!/bin/bash
# patchbix-setup-linux.sh - Zabbix patch management on a Linux server without Ansible: setup, check, updates
#
# Paste the whole file into a root shell (sudo -i), or run it as a file: sudo bash patchbix-setup-linux.sh
# or straight from GitHub (no terminal = menu choice 1, settings kept / defaults):
#   curl -fsSL https://raw.githubusercontent.com/DuprTECH/PatchBix-Zabbix-Patch-Management-Windows-Linux/main/scripts/patchbix-setup-linux.sh | sudo bash
# A menu asks what to do (or MODE=update bash patchbix-setup-linux.sh):
#   1 monitor  = like ansible/check-linux.yml: checker patchbix-linux.sh, zabbix-sender, debsecan (Debian), cron (check every
#                12 h and after a reboot, automatic update every 15 min), patch settings /etc/zabbix/patchbix.conf,
#                UserParameter patch.config (host macros {$PATCH.CONF.*}), first check. Running it again updates an installed server and keeps the settings.
#   2 check    = run the update check now (pending updates -> Zabbix) and show the patch settings
#   3 update   = install updates now in the maintenance window,
#                without EXCLUDE packages, reboot when needed and REBOOT="true", result to Zabbix
#   4 force    = like 3, also outside the maintenance window
#
# AUTO_UPDATE="false" in patchbix.conf (default) = the checker only checks; "true" = it installs the
# updates itself in the maintenance window (once per window, like 3).
#
# The checker patchbix-linux.sh is embedded (no internet needed); a copy in /tmp/patchbix-linux.sh wins.
# Supported: apt (Debian / Ubuntu), dnf / yum (RHEL / Rocky / Alma / Oracle / CentOS).
# Docs: README.md (https://github.com/DuprTECH/PatchBix-Zabbix-Patch-Management-Windows-Linux)
#
# Author : Dusan Priechodsky
# Source : https://github.com/DuprTECH/PatchBix-Zabbix-Patch-Management-Windows-Linux
# Contact: info@duprtech.sk
# License: MIT
(
MODE="${MODE:-}"                  # monitor | check | update | force, empty = menu
INTERVAL_HOURS="${INTERVAL_HOURS:-12}"

CHECK=/usr/local/bin/patchbix-linux.sh
CRON=/etc/cron.d/patchbix
CONF=/etc/zabbix/patchbix.conf

warn() { echo "WARNING: $*" >&2; }

# ask <question> <default> -> REPLY (default without a terminal)
ask() {
    local a=""
    [ -t 0 ] && read -r -p "$1 [$2]: " a
    REPLY="${a:-$2}"
}

# Value from the patch settings JSON (patchbix-linux.sh --show-config)
json_get() { printf '%s' "$CFG" | sed -n "s/.*\"$1\": \(\"[^\"]*\"\|[a-z0-9]*\).*/\1/p" | sed 's/^"//; s/"$//'; }

if [ "$(id -u)" -ne 0 ]; then echo "Run as root (sudo -i)." >&2; exit 1; fi
PM=""
for p in apt-get dnf yum; do command -v $p >/dev/null 2>&1 && { PM=$p; break; }; done
[ -n "$PM" ] || { echo "Unsupported package manager (apt, dnf, yum)." >&2; exit 1; }

# ---------------- Checker ----------------
# The checker is embedded before the menu (no internet needed); a newer copy in
# /tmp/patchbix-linux.sh is used instead
get_check() {
    local tmp="$CHECK.new" src="embedded"
    if [ -f /tmp/patchbix-linux.sh ]; then cp /tmp/patchbix-linux.sh "$tmp"; src=/tmp/patchbix-linux.sh
    else printf '%s' "$CHECK_B64" | base64 -d 2>/dev/null | gunzip > "$tmp" 2>/dev/null; fi
    if ! grep -q -- '--auto-update' "$tmp" 2>/dev/null; then
        rm -f "$tmp"
        echo "ERROR: the checker ($src) is damaged or old - copy patchbix-linux.sh to /tmp/patchbix-linux.sh and run again." >&2
        return 1
    fi
    install -m 755 "$tmp" "$CHECK" && rm -f "$tmp"
    echo "Checker: $CHECK ($src)"
}

checker_ok() { [ -x "$CHECK" ] && grep -q -- '--auto-update' "$CHECK"; }

show_config() {
    CFG=$("$CHECK" --show-config)
    local next
    next=$(json_get maintenance_next)
    echo "Maintenance window: $(json_get maintenance_window | sed 's/^$/- (any time)/')$( [ "$(json_get maintenance_active)" = true ] && echo ' - open now')"
    [ -n "$(json_get maintenance_error)" ] && echo "  ERROR: $(json_get maintenance_error)"
    echo "Next window:        $( [ "$next" != null ] && date -d "@$next" '+%Y-%m-%d %H:%M' || echo -)"
    echo "Auto update:        $(json_get auto_update)"
    echo "Excluded:           $(printf '%s' "$CFG" | sed -n 's/.*"exclude": \[\([^]]*\)\].*/\1/p' | tr -d '"' | sed 's/^$/-/')"
    echo "Reboot allowed:     $(json_get reboot_allowed)"
}

# ---------------- 1. Monitor: checker, cron, patch settings ----------------
monitor() {
    echo "=== Update checker for Zabbix"
    get_check || return 1
    # A run of the checker moves the settings of an older version (zbx-patch.conf) to the PatchBix names
    "$CHECK" --show-config >/dev/null 2>&1
    if ! command -v zabbix_sender >/dev/null 2>&1; then
        if [ "$PM" = apt-get ]; then DEBIAN_FRONTEND=noninteractive apt-get install -y -qq zabbix-sender >/dev/null 2>&1
        else $PM install -y -q zabbix-sender >/dev/null 2>&1; fi
        command -v zabbix_sender >/dev/null 2>&1 || warn "zabbix_sender is not installed - install the package zabbix-sender (Zabbix repository)."
    fi
    # Debian: debsecan for the severity of the security updates (Critical / Important / Low, window type crit)
    if [ "$(. /etc/os-release 2>/dev/null && echo "$ID")" = debian ] && ! command -v debsecan >/dev/null 2>&1; then
        # no daily report mails of its own cron job
        echo "debsecan debsecan/report boolean false" | debconf-set-selections 2>/dev/null
        # fresh package lists, without the recommended packages (exim4 - a mail server)
        apt-get update -qq >/dev/null 2>&1
        DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends debsecan >/dev/null 2>&1 \
            || warn "debsecan is not installed - the severity (critical updates) stays n/a. Install the package debsecan."
    fi
    # Check every INTERVAL_HOURS (shifted by a per-host offset of -30..+30 min) and after a reboot,
    # automatic update every 15 min (installs only with AUTO_UPDATE="true", in the maintenance window)
    local offset minute shift hours h keep win auto excl reboot
    offset=$(( $(uname -n | cksum | cut -d' ' -f1) % 61 - 30 ))
    minute=$(( (offset + 60) % 60 )); shift=0; [ "$offset" -lt 0 ] && shift=-1
    hours=""
    for (( h = 0; h < 24; h += INTERVAL_HOURS )); do
        hours="${hours:+$hours,}$(( (h + shift + 24) % 24 ))"
    done
    rm -f /etc/cron.d/zbx-patch-afterboot /etc/cron.d/zbx-patch-linux   # older versions
    cat > "$CRON" <<EOF
# PatchBix check (template 'PatchBix - Patch management all OS') - installed by patchbix-setup-linux.sh
# check every $INTERVAL_HOURS h, check after a reboot, automatic update (AUTO_UPDATE="true" in $CONF) every 15 min
$minute $hours * * * root $CHECK >/dev/null 2>&1
@reboot root sleep 300; $CHECK >/dev/null 2>&1
*/15 * * * * root $CHECK --auto-update >>/var/log/patchbix-update.log 2>&1
EOF
    chmod 644 "$CRON"
    echo "Cron $CRON: check $minute $hours * * * and after a reboot, auto update every 15 min"
    # Patch settings: only the values that are set are written, the others stay commented out
    # (nothing set = check only: no automatic updates, the defaults apply); the values already in
    # the file are kept, the file is written every time, so new comments / settings are added
    cur() { [ -f "$CONF" ] && grep -qE "^[[:space:]]*$1[[:space:]]*=" "$CONF" || return 1
            sed -n -E "s/^[[:space:]]*$1[[:space:]]*=[[:space:]]*\"?([^\"#]*)\"?.*/\1/p" "$CONF" | tail -n 1 | sed 's/[[:space:]]*$//'; }
    UNSET="(not set)"
    win=$(cur MAINTENANCE_WINDOW)  || win=$UNSET
    [ -z "$win" ] && win=$UNSET
    excl=$(cur EXCLUDE)            || excl=$UNSET
    [ -z "$excl" ] && excl=$UNSET
    reboot=$(cur REBOOT)           || reboot=$UNSET
    auto=$(cur AUTO_UPDATE)        || auto=$UNSET
    keep=n
    if [ -f "$CONF" ]; then
        echo "Patch settings $CONF:"
        printf '  MAINTENANCE_WINDOW: %s\n  AUTO_UPDATE:        %s\n  EXCLUDE:            %s\n  REBOOT:             %s\n' "$win" "$auto" "$excl" "$reboot"
        ask "Keep them? (y/n)" y; keep=$REPLY
    fi
    case "$keep" in
        [Yy]*) ;;
        *)
            echo "Enter = keep the shown value, - = not set (commented out). Automatic updates need a window and AUTO_UPDATE=true."
            echo "Maintenance window = when and which updates are installed automatically: '[<types>] <day> <HH:MM>-<HH:MM>',"
            echo "  several separated by commas. Types: * = all (also without types), crit = critical (dnf / yum only),"
            echo "  sec = security, kernel = kernel packages; several joined with +. Day: 1-7 = Monday-Sunday (or Mon..Sun),"
            echo "  1-5 or Mon-Fri, Tue+Thu = Tuesday and Thursday, * = every day, 2.3 = 2nd Wednesday. Examples: * 3 03:00-05:00 = everything on Wednesday,"
            echo "  crit+sec * 02:00-03:00 = critical and security updates every night, all Tue+Thu 03:00-05:00"
            ask "Maintenance window" "$win"; win=$REPLY
            ask "Automatic updates in the window (true/false, not set = false)" "$auto"; auto=$REPLY
            ask "Excluded packages, comma separated, wildcards allowed" "$excl"; excl=$REPLY
            ask "Reboot after updates when needed (true/false)" "$reboot"; reboot=$REPLY
            ;;
    esac
    # KEY="value" when set, otherwise the commented example
    setting() { case "$2" in "$UNSET"|-|"") echo "#$1=\"$3\"" ;; *) echo "$1=\"$2\"" ;; esac; }
    mkdir -p "$(dirname "$CONF")"
    cat > "$CONF" <<EOF
# patchbix.conf - patch management settings of this host
# Read by the checker patchbix-linux.sh (sent to Zabbix, template 'PatchBix - Patch management all OS')
# and by patchbix-setup-linux.sh (update). Written by patchbix-setup-linux.sh -
# you can edit it, the values are kept when the setup runs again.
# A setting that is commented out is not set: the default applies (nothing set = check only).
# The Zabbix host macros {\$PATCH.CONF.*} win over this file (patchbix-from-zbx-host-macro.cache).
#
# Maintenance window - when and which updates the checker installs itself (with AUTO_UPDATE="true").
#   "[<types>] <day> <HH:MM>-<HH:MM>", several separated by commas, local time of the host
#   types: * = all updates (also without types), crit = critical (dnf / yum severity Critical; Debian: CVEs
#          of high urgency by debsecan; Ubuntu: nothing), sec = security, kernel = kernel packages; several joined with +, for example crit+sec
#   day: 1-7 = Monday-Sunday (or Mon..Sun), a range 1-5 or Mon-Fri, * = every day, 2.3 = 2nd Wednesday of the month,
#        several days joined with + (Tue+Thu = Tuesday and Thursday)
#   an end lower than the start = the window ends the next day (6 22:00-04:00)
#   MAINTENANCE_WINDOW="* 3 03:00-05:00"                         = all updates every Wednesday 03:00-05:00
#   MAINTENANCE_WINDOW="crit+sec * 02:00-03:00, * 6 03:00-06:00"  = critical + security every night, all on Saturday
#   MAINTENANCE_WINDOW="all Tue+Thu 03:00-05:00"                 = all updates on Tuesday and Thursday 03:00-05:00
$(setting MAINTENANCE_WINDOW "$win" "* 3 03:00-05:00")

# Automatic updates: true = the checker installs the update types of the window itself in it (cron every
# 15 min, once per window, log /var/log/patchbix-update.log); false = check only (default) - the windows
# can be set first and the automatic updates turned on later
$(setting AUTO_UPDATE "$auto" true)
# Updates that are not installed, separated by commas: package names, wildcards allowed (default: none)
$(setting EXCLUDE "$excl" "kernel*, docker-ce")

# Reboot after updates when needed: true / false (false = the reboot is only reported to Zabbix; default: true)
$(setting REBOOT "$reboot" false)
EOF
    chmod 644 "$CONF"
    echo "Saved $CONF"
    # Settings from Zabbix: UserParameter patch.config (host macros {$PATCH.CONF.*} -> patchbix-from-zbx-host-macro.cache),
    # the agent is restarted only when its config changed (undone when it doesn't start)
    echo "=== Zabbix agent: UserParameter patch.config (settings from the host macros)"
    "$CHECK" --install-agent-config || warn "UserParameter not installed - the host macros {\$PATCH.CONF.*} don't apply on this host"
    run_check
}

# ---------------- 2. Check now ----------------
run_check() {
    checker_ok || { echo "The checker is not installed (or old) - choose 1 (monitor) first." >&2; return 1; }
    echo "=== Patch settings"
    show_config
    echo "=== Update check (sends to Zabbix)"
    "$CHECK"
}

# ---------------- 3. / 4. Install updates now (the checker does it: --update [--force]) ----------------
update() {
    if ! checker_ok; then
        echo "The update checker is not installed (or old) - installing it first."
        monitor || return 1
    fi
    echo "=== Patch settings"
    show_config
    if [ "$1" = 1 ]; then "$CHECK" --update --force; else "$CHECK" --update; fi
}

# Embedded check script: patchbix-linux.sh from DuprTECH/PatchBix-Zabbix-Patch-Management-Windows-Linux 5b6082b (embed-check.sh)
CHECK_B64='
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
+T+8EV62hREBAA==
'
#
# ---------------- Menu ----------------
if [ -z "$MODE" ]; then
    echo "Zabbix patch management - $(uname -n)"
    echo "  1) monitor - install / update the checker for Zabbix (cron, patchbix.conf incl. AUTO_UPDATE)"
    echo "  2) check   - run the update check now"
    echo "  3) update  - install updates (only in the maintenance window)"
    echo "  4) force   - install updates now (also outside the maintenance window)"
    ask "Choose" 1
    MODE=$REPLY
fi
case "$MODE" in
    1|monitor) monitor ;;
    2|check)   run_check ;;
    3|update)  update 0 ;;
    4|force)   update 1 ;;
    *) echo "Unknown choice: $MODE" >&2; exit 1 ;;
esac
)
