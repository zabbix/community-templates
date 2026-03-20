#!/bin/bash
# OpenVPN Discovery Script

# Extract unique usernames from all status files
USERS=$(grep "^CLIENT_LIST" /var/log/openvpn/status*.log 2>/dev/null | cut -d, -f2 | sed 's/[^a-zA-Z0-9._-]//g' | sort -u)

# Build JSON
JSON="{"
FIRST=true
for user in $USERS; do
    [ -n "$user" ] || continue
    if [ "$FIRST" = true ]; then
        JSON="$JSON\"data\":["
        FIRST=false
    else
        JSON="$JSON,"
    fi
    JSON="$JSON{\"{#VPN.USER}\":\"$user\"}"
done

if [ "$FIRST" = true ]; then
    echo "{\"data\":[]}"
else
    echo "$JSON]}"
fi