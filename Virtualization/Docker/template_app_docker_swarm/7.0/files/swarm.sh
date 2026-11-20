#!/bin/sh
# Docker Swarm services snapshot for Zabbix (key swarm.services.get).
# Prints one JSON document; the template aggregates it per service:
#   manager    - true if this node is a swarm manager
#   containers - swarm task containers on this node with their CPU limits
#   stats      - Docker Engine API stats of running task containers
#   services   - services with running/desired replicas (managers only)
#   updates    - service IDs, stacks and update statuses (managers only)
#   tasks      - stopped swarm tasks with their errors (managers only)
#   limits     - open files of running task containers and their nofile ulimit
# Requires: docker CLI, curl, access to the Docker socket.
# Open files of processes of other users are counted only with CAP_DAC_READ_SEARCH,
# otherwise "fds" is -1, see README.md.

export LC_ALL=C
SOCK=/var/run/docker.sock
LABEL=com.docker.swarm.service.name

join() { paste -sd, -; }

# Host PIDs of all processes of a container, from the cgroup of its main process.
cgroup_procs() {
    path=$(awk -F: '$2 ~ /(^|,)pids(,|$)/ {v1 = "/pids" $3} $1 == "0" && $2 == "" {v2 = $3}
        END {print (v1 != "" ? v1 : v2)}' "/proc/$1/cgroup" 2>/dev/null)
    # The root cgroup holds the whole host, not one container.
    case $path in ''|/|/pids/) return 1 ;; esac
    cat "/sys/fs/cgroup$path/cgroup.procs" 2>/dev/null
}

# Number of open file descriptors of a process.
# Returns 2 if access to /proc/<pid>/fd is denied, 1 if the process is gone or exiting.
fd_count() {
    fds=$(ls -A "/proc/$1/fd" 2>&1) || {
        case $fds in *'Permission denied'*) return 2 ;; esac
        return 1
    }
    [ -n "$fds" ] && printf '%s\n' "$fds" | wc -l | tr -d ' ' || echo 0
}

# Open files of a task container compared with the soft RLIMIT_NOFILE of its processes:
#   fds        - open files of all processes, -1 if they are not readable
#   nofile     - lowest soft limit among the processes, nofile_hard - hard limit of the main process
#   nofile_pct - highest share of its soft limit used by one process, in hundredths of a percent
nofile_json() {
    id=$1 pid=$2
    procs=$(cgroup_procs "$pid")
    [ -n "$procs" ] || procs=$pid
    total=0 soft=0 hard=0 pct=0 denied=0
    # shellcheck disable=SC2046
    limits=$(awk '/^Max open files/ {split(FILENAME, f, "/"); print f[3], $4, $5}' \
        $(for p in $procs; do echo "/proc/$p/limits"; done) 2>/dev/null)
    while read -r p s h; do
        [ -n "$p" ] || continue
        # "unlimited" is kept as 0.
        case $s in ''|*[!0-9]*) s=0 ;; esac
        case $h in ''|*[!0-9]*) h=0 ;; esac
        if [ "$s" -gt 0 ] && { [ "$soft" -eq 0 ] || [ "$s" -lt "$soft" ]; }; then
            soft=$s
        fi
        [ "$p" = "$pid" ] && hard=$h
        n=$(fd_count "$p")
        rc=$?
        if [ "$rc" -ne 0 ]; then
            # A process that exited meanwhile is skipped.
            [ "$rc" -eq 2 ] && denied=1
            continue
        fi
        total=$((total + n))
        if [ "$s" -gt 0 ] && [ $((n * 10000 / s)) -gt "$pct" ]; then
            pct=$((n * 10000 / s))
        fi
    done <<EOF
$limits
EOF
    [ "$denied" -eq 1 ] && total=-1 pct=0
    printf '{"id":"%s","fds":%s,"nofile":%s,"nofile_hard":%s,"nofile_pct":%s}' \
        "$id" "$total" "$soft" "$hard" "$pct"
}

tmp=$(mktemp -d) || exit 1
trap 'rm -rf "$tmp"' EXIT

control=$(docker info --format '{{.Swarm.ControlAvailable}}') || exit 1
[ "$control" = true ] && manager=true || manager=false

# Stats are requested in parallel: each call samples CPU for about a second.
running=$(docker ps -q --no-trunc --filter label=$LABEL)
for id in $running; do
    curl -s --max-time 10 --unix-socket "$SOCK" "http://localhost/containers/$id/stats?stream=false" >"$tmp/$id" &
done

# Open files are counted while the stats are sampled.
if [ -n "$running" ]; then
    sep=
    # shellcheck disable=SC2086
    docker inspect --type container --format '{{.Id}} {{.State.Pid}}' $running 2>/dev/null |
    while read -r cid cpid; do
        [ "$cpid" -gt 0 ] 2>/dev/null || continue
        printf '%s' "$sep"
        nofile_json "$cid" "$cpid"
        sep=,
    done
fi >"$tmp/limits"

printf '{"manager":%s,"containers":[' "$manager"
all=$(docker ps -aq --no-trunc --filter label=$LABEL)
if [ -n "$all" ]; then
    # shellcheck disable=SC2086
    docker inspect --type container \
        --format '{"id":"{{.Id}}","service":{{json (index .Config.Labels "com.docker.swarm.service.name")}},"stack":{{json (index .Config.Labels "com.docker.stack.namespace")}},"image":{{json .Config.Image}},"cpus":{{.HostConfig.NanoCpus}},"state":{{json .State}}}' \
        $all 2>/dev/null | join
fi

wait
printf '],"stats":['
sep=
for id in $running; do
    [ -s "$tmp/$id" ] || continue
    printf '%s' "$sep"
    tr -d '\n' <"$tmp/$id"
    sep=,
done

printf '],"services":['
if [ "$manager" = true ]; then
    docker service ls \
        --format '{"name":"{{.Name}}","mode":"{{.Mode}}","replicas":"{{.Replicas}}","image":"{{.Image}}"}' | join
fi

printf '],"updates":['
svcs=
if [ "$manager" = true ]; then
    svcs=$(docker service ls -q)
fi
if [ -n "$svcs" ]; then
    # shellcheck disable=SC2086
    docker service inspect $svcs \
        --format '{"id":"{{.ID}}","name":"{{.Spec.Name}}","stack":{{json (index .Spec.Labels "com.docker.stack.namespace")}},"update":{{json .UpdateStatus}}}' | join
fi

printf '],"tasks":['
if [ -n "$svcs" ]; then
    # shellcheck disable=SC2086
    tasks=$(docker service ps -q --no-trunc --filter desired-state=shutdown $svcs)
    if [ -n "$tasks" ]; then
        # shellcheck disable=SC2086
        docker inspect --type task \
            --format '{"service":"{{.ServiceID}}","state":"{{.Status.State}}","ts":{{.Status.Timestamp.Unix}},"err":{{json .Status.Err}}}' \
            $tasks 2>/dev/null | join
    fi
fi

printf '],"limits":['
cat "$tmp/limits"
printf ']}\n'
