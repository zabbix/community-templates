#!/bin/bash
# OpenVPN User Discovery Script - Zabbix 7.0 Compatible
# Version: 1.0.0
# Description: Discovers connected OpenVPN users for Zabbix monitoring

set -euo pipefail

# Configuration
readonly LOG_DIR="/var/log/openvpn"
readonly STATUS_PATTERN="status*.log"
readonly SCRIPT_NAME="$(basename "$0")"

# Logging function
log_error() {
    echo "$SCRIPT_NAME: ERROR: $1" >&2
}

log_debug() {
    if [[ "${DEBUG:-0}" == "1" ]]; then
        echo "$SCRIPT_NAME: DEBUG: $1" >&2
    fi
}

# Main discovery function
discover_vpn_users() {
    local users_json=""
    local user_count=0
    
    # Check if log directory exists
    if [[ ! -d "$LOG_DIR" ]]; then
        log_error "Log directory $LOG_DIR does not exist"
        echo '{"data":[]}'
        return 0
    fi
    
    # Find all OpenVPN status files
    local status_files
    if ! status_files=$(find "$LOG_DIR" -name "$STATUS_PATTERN" -type f -readable 2>/dev/null); then
        log_error "Failed to find status files in $LOG_DIR"
        echo '{"data":[]}'
        return 0
    fi
    
    # Process each status file
    while IFS= read -r status_file; do
        [[ -z "$status_file" ]] && continue
        
        log_debug "Processing status file: $status_file"
        
        # Extract connected clients more reliably
        # OpenVPN status file format:
        # CLIENT_LIST,username,real_address,virtual_address,bytes_received,bytes_sent,connected_since,connected_since_time
        local clients
        if clients=$(awk -F',' '/^CLIENT_LIST/ && NF >= 2 && $2 != "" { print $2 }' "$status_file" 2>/dev/null); then
            while IFS= read -r client; do
                [[ -z "$client" ]] && continue
                
                # Sanitize client name - remove special characters that could break JSON
                client=$(echo "$client" | sed 's/[^a-zA-Z0-9._-]//g')
                [[ -z "$client" ]] && continue
                
                # Add to JSON array
                if [[ -n "$users_json" ]]; then
                    users_json="${users_json},"
                fi
                users_json="${users_json}{\"{\#VPN.USER}\":\"${client}\"}"
                ((user_count++))
                
                log_debug "Found user: $client"
            done <<< "$clients"
        else
            log_debug "No clients found in $status_file or file read error"
        fi
    done <<< "$status_files"
    
    log_debug "Total users discovered: $user_count"
    
    # Return properly formatted JSON for Zabbix LLD
    echo "{\"data\":[${users_json}]}"
}

# Main execution
main() {
    discover_vpn_users
}

# Execute main function
main "$@"