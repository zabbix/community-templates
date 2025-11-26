#!/usr/bin/bash
#
# Collect statistics from recently completed scrub on a ZFS pool and record them
# as custom properties
#
# To install, copy this script to `/usr/lib/zfs-linux/zed.d/` and create links:
# - /etc/zfs/zed.d/scrub_finish-zabbix.sh
# - /etc/zfs/zed.d/resilver_finish-zabbix.sh
# Then restart zed so it picks up the new scripts.

status=$(${ZPOOL} status ${ZEVENT_POOL} | egrep 'scrub repaired|resilvered')
# The $status string value has two extra words if the duration is longer than 24 hours.
# Example without days:
# scan: scrub repaired 0B in 00:07:05 with 0 errors on Sun Jun 8 00:31:06 2025
# Example with days:
# scan: scrub repaired 0B in 5 days 01:55:40 with 0 errors on Fri Oct 17 02:19:41 2025
[[ $status == *"days"* ]] && { days_offset=2; days=$(awk '{print $6}' <<<${status}); } || { days_offset=0; days=0; }

if echo "${status}" | grep 'scrub' >/dev/null; then
    # Most recent scan was a scrub
    type='scrub'
    repaired=$(awk "{print \$4}" <<<${status})
    length=$(awk "{print \$$((6 + days_offset))}" <<<${status})
    errors=$(awk "{print \$$((8 + days_offset))}" <<<${status})
    timestamp=$(awk "{print substr(\$0, index(\$0, \$$((11 + days_offset))))}" <<<${status})
elif echo "${status}" | grep 'resilver' >/dev/null; then
    type='resilver'
    # Example without days:
    # scan: resilvered 4.01M in 00:00:00 with 0 errors on Tue Jun 10 22:55:22 2025
    # Example with days:
    # scan: resilvered 900.34M in 5 days 01:55:40 with 0 errors on Fri Oct 17 05:44:41 2025
    repaired=$(awk "{print \$3}" <<<${status})
    length=$(awk "{print \$$((5 + days_offset))}" <<<${status})
    errors=$(awk "{print \$$((7 + days_offset))}" <<<${status})
    timestamp=$(awk "{print substr(\$0, index(\$0, \$$((10 + days_offset))))}" <<<${status})
   else
    # Unknown most recent scan type, or no recent scan
    exit 1
fi

# Data repaired by most recent scan in bytes
repaired=$(numfmt --from=auto <<<${repaired%B})
${ZFS} set "zabbix:last-${type}-repaired=${repaired}"   "${ZEVENT_POOL}"

# Length of most recent scan in seconds
IFS=: read h m s <<<"${length}"
length=$(( 10#${s} + (10#${m} * 60) + (10#${h} * 3600) + ($days * 3600 * 24) ))
${ZFS} set "zabbix:last-${type}-length=${length}"       "${ZEVENT_POOL}"

# Errors detected by most recent scan
${ZFS} set "zabbix:last-${type}-errors=${errors}"       "${ZEVENT_POOL}"

# Unix timestamp of most recent scan
timestamp=$(date -d "${timestamp}" +'%s')
${ZFS} set "zabbix:last-${type}-timestamp=${timestamp}" "${ZEVENT_POOL}"
