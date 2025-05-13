# Rootless Podman Monitoring

## Overview

This template serves as a partial replacement for the docker work-around currently used by some people. This template remains highly scalable, with the template assigned per host you intend to monitor. It uses the Podman CLI to execute the necessary commands. Podman by default runs in a rootless nature making it a challenge to correctly list the running containers on a given host. You cannot natively in the Podman CLI list another users pods, unless you are that user. THis template leverage customer "User Parameters" and sudo permissions to check running pods belonging to other users.

## Author

Michael Redbourne, Bulletproof Solutions

## Macros used

|Name|Description|Default|Type|
|----|-----------|-------|----|
|{#CONTAINER_NAME}|Friendly Container Name|N/A|Text macro|
|{#CONTAINER_ID}|Container GUID/ID|N/A|Text macro|

## Template links

There are no template links in this template.

## Discovery rules

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Discover Containers|Leverages the item "podman.ps" to capture discovery information using LLDs.|`Dependent Item`|podman.ps.containers|


## Items collected

|Name|Description|Type|Key|Dependency|Information|Preprocessing|
|----|-----------|----|---|----------|-----------|-------------|
|Podman Export (JSON)|Captures the raw JSON from the command: "podman ps -a --format json"|Zabbix Agent (Active)|podman.ps|N/A|Text|Yes (JS)|

## Item Prototypes
|Name|Description|Type|Key|Dependency|Information|Preprocessing|
|----|-----------|----|---|----------|-----------|-------------|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.AutoRemove[{#CONTAINER_NAME}]|podman.ps|Character|Yes (JSON Path)|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.Created[{#CONTAINER_NAME}]|podman.ps|Integer|Yes (JSON Path)|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.CreatedAt[{#CONTAINER_NAME}]|podman.ps|Character|Yes (JSON Path)|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.ExitCode[{#CONTAINER_NAME}]|podman.ps|Character|Yes (JSON Path)|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.Exited[{#CONTAINER_NAME}]|podman.ps|Character|Yes (JSON Path)|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.ImageID[{#CONTAINER_NAME}]|podman.ps|Character|Yes (JSON Path)|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.Mounts[{#CONTAINER_NAME}]|podman.ps|Character|Yes (JSON Path)|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.Names[{#CONTAINER_NAME}]|podman.ps|Character|Yes (JSON Path)|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.Networks[{#CONTAINER_NAME}]|podman.ps|Character|Yes (JSON Path)|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.PID[{#CONTAINER_NAME}]|podman.ps|Integer|Yes (JSON Path)|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.Pod[{#CONTAINER_NAME}]|podman.ps|Character|Yes (JSON Path)|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.PodName[{#CONTAINER_NAME}]|podman.ps|Character|Yes (JSON Path)|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.Restarts[{#CONTAINER_NAME}]|podman.ps|Integer|Yes (JSON Path)|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.StartedAt[{#CONTAINER_NAME}]|podman.ps|Integer|Yes (JSON Path)|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.State[{#CONTAINER_NAME}]|podman.ps|Character|Yes (JSON Path)|
|{#CONTAINER_NAME}: |N/A|Dependent Item|podman.ps.containers.Status[{#CONTAINER_NAME}]|podman.ps|Character|Yes (JSON Path)|

## Trigger Prototypes
|Name|Description|Expression|Priority|
|----|-----------|----------|--------|

## Special Notes
Two host-level changes must be made. One will modify the Zabbix Agent configuration to include an additional user parameter. The other is a sudo change to allow zabbix to "change users" to the target user(s). Change the $USER variable to the user running your pods.

## Zabbix Agent Config Change
UserParameter=podman.ps,sudo -u $USER podman ps -a --format json

## Sudo Change (visudo /etc/sudoers.d/zabbix)
zabbix  ALL=($USER) NOPASSWD: /usr/bin/podman ps -a --format json