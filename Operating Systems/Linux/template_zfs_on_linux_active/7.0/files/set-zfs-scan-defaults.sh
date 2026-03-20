#!/usr/bin/bash
#
# Run this script once to set default scrub/resilver statistics parameters
# Will only set a parameter on the pool if it's not already set


# Set a custom ZFS property if the property is not already set
# Parameters:
#   pool:      Name of the pool to set the parameter for
#   parameter: Name of the parameter to set (`zabbix:...`)
function zfs-set-if-empty () {
    pool="${1}"
    parameter="${2}"

    # Unset custom parameters return '-' as the default value
    if [ $(zfs get -Ho value "${parameter}" "${pool}") == '-' ]; then
        zfs set "${parameter}=0" "${pool}"
    fi
}

for pool in $(zpool list -H -o name); do
    zfs-set-if-empty "${pool}" "zabbix:last-scrub-repaired"
    zfs-set-if-empty "${pool}" "zabbix:last-scrub-length"
    zfs-set-if-empty "${pool}" "zabbix:last-scrub-errors"
    zfs-set-if-empty "${pool}" "zabbix:last-scrub-timestamp"

    zfs-set-if-empty "${pool}" "zabbix:last-resilver-repaired"
    zfs-set-if-empty "${pool}" "zabbix:last-resilver-length"
    zfs-set-if-empty "${pool}" "zabbix:last-resilver-errors"
    zfs-set-if-empty "${pool}" "zabbix:last-resilver-timestamp"
done
