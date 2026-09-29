#!/bin/sh
# Docker Swarm services snapshot for Zabbix (key swarm.services.get).
# Prints one JSON document; the template aggregates it per service:
#   manager    - true if this node is a swarm manager
#   containers - swarm task containers on this node
#   stats      - Docker Engine API stats of running task containers
#   services   - services with running/desired replicas (managers only)
#   updates    - service IDs, stacks and update states (managers only)
#   tasks      - stopped swarm tasks with their errors (managers only)
# Requires: docker CLI, curl, access to the Docker socket.

export LC_ALL=C
SOCK=/var/run/docker.sock
LABEL=com.docker.swarm.service.name

join() { paste -sd, -; }

tmp=$(mktemp -d) || exit 1
trap 'rm -rf "$tmp"' EXIT

control=$(docker info --format '{{.Swarm.ControlAvailable}}') || exit 1
[ "$control" = true ] && manager=true || manager=false

# Stats are requested in parallel: each call samples CPU for about a second.
running=$(docker ps -q --no-trunc --filter label=$LABEL)
for id in $running; do
    curl -s --max-time 10 --unix-socket "$SOCK" "http://localhost/containers/$id/stats?stream=false" >"$tmp/$id" &
done

printf '{"manager":%s,"containers":[' "$manager"
all=$(docker ps -aq --no-trunc --filter label=$LABEL)
if [ -n "$all" ]; then
    # shellcheck disable=SC2086
    docker inspect --type container \
        --format '{"id":"{{.Id}}","service":{{json (index .Config.Labels "com.docker.swarm.service.name")}},"stack":{{json (index .Config.Labels "com.docker.stack.namespace")}},"image":{{json .Config.Image}},"state":{{json .State}}}' \
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
        --format '{"id":"{{.ID}}","name":"{{.Spec.Name}}","stack":{{json (index .Spec.Labels "com.docker.stack.namespace")}},"state":"{{if .UpdateStatus}}{{.UpdateStatus.State}}{{end}}"}' | join
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

printf ']}\n'
