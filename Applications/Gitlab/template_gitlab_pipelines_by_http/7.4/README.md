# GitLab Pipelines by HTTP

## Overview

Template for monitoring GitLab CI/CD pipeline health across all projects.

Auto-discovers all non-archived projects via the GitLab REST API and tracks pipeline success/failure counts and rates across four time windows (hour, day, week, month). Includes a dashboard for at-a-glance triage.

API documentation: https://docs.gitlab.com/api/pipelines/

## Requirements

Zabbix 7.4 and higher

## Tested versions

This template has been tested on GitLab CE 19.x (self-hosted) with Zabbix 7.4.

## Author

nikosch86

Source repository and issue tracker: https://github.com/nikosch86/zabbix-gitlab-pipelines

## Setup

Create a Personal Access Token with `read_api` scope. For monitoring all projects (including those the token owner is not a member of), use an admin-level token.

Set the resulting token and GitLab URL in the host macros. `{$GITLAB.API.TOKEN}` is a secret macro, so its value is not shown after saving and is not included on export.

The template should be assigned to a host (the Zabbix server itself works fine, since no agent is required).

### Macros used

| Name | Description | Default |
| ---- | ----------- | ------- |
| {$GITLAB.URL} | <p>Base URL of the GitLab instance, without a trailing slash (for example, `https://gitlab.example.com`).</p> | |
| {$GITLAB.API.TOKEN} | <p>GitLab Personal Access Token with the `read_api` scope, used to authenticate to the GitLab REST API.</p> | |
| {$GITLAB.DISC.INTERVAL} | <p>How often to discover new projects.</p> | `1h` |
| {$GITLAB.PIPELINE.INTERVAL} | <p>How often to check pipeline status.</p> | `15m` |
| {$GITLAB.HTTP.TIMEOUT} | <p>Timeout for HTTP requests to the GitLab API.</p> | `15s` |
| {$GITLAB.FAIL.RATE.DAY.WARN} | <p>Daily pipeline failure rate (%) above which a trigger fires. Supports per-project context, e.g. `{$GITLAB.FAIL.RATE.DAY.WARN:"my-group/my-project"}`.</p> | `75` |
| {$GITLAB.FAIL.RATE.HOUR.WARN} | <p>Hourly pipeline failure rate (%) above which a trigger fires.</p> | `50` |
| {$GITLAB.FAIL.RATE.WEEK.WARN} | <p>Weekly pipeline failure rate (%) above which a trigger fires. Supports per-project context, e.g. `{$GITLAB.FAIL.RATE.WEEK.WARN:"my-group/my-project"}`.</p> | `50` |

### Items

| Name | Description | Type | Key and additional info |
| ---- | ----------- | ---- | ----------------------- |
| GitLab: API version | <p>GitLab version string from `/api/v4/version`. Serves as the template availability signal: if the GitLab API is unreachable or the token is invalid, this item receives no data.</p> | HTTP agent | gitlab.api.version<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.version`</p></li></ul> |

### LLD rule Project discovery

| Name | Description | Type | Key and additional info |
| ---- | ----------- | ---- | ----------------------- |
| GitLab: Discover Projects | <p>Discovers all non-archived projects. Handles pagination for instances with more than 100 projects.</p> | Script | gitlab.project.discovery |

### Item prototypes for Project discovery

| Name | Description | Type | Key and additional info |
| ---- | ----------- | ---- | ----------------------- |
| GitLab: {#PROJECT_PATH} Pipelines | <p>Fetches up to 100 recent pipelines for the project. JavaScript preprocessing computes aggregated stats across four time windows.</p> | HTTP agent | gitlab.pipeline.data[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JavaScript: Computes total, failed, success counts and failure rates per hour/day/week/month</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Failed (hour) | <p>Number of failed pipelines in the last hour.</p> | Dependent item | gitlab.pipeline.failed.hour[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.failed_hour`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Failed (day) | <p>Number of failed pipelines in the last day.</p> | Dependent item | gitlab.pipeline.failed.day[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.failed_day`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Failed (week) | <p>Number of failed pipelines in the last week.</p> | Dependent item | gitlab.pipeline.failed.week[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.failed_week`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Failed (month) | <p>Number of failed pipelines in the last month.</p> | Dependent item | gitlab.pipeline.failed.month[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.failed_month`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Successful (hour) | <p>Number of successful pipelines in the last hour.</p> | Dependent item | gitlab.pipeline.success.hour[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.success_hour`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Successful (day) | <p>Number of successful pipelines in the last day.</p> | Dependent item | gitlab.pipeline.success.day[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.success_day`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Successful (week) | <p>Number of successful pipelines in the last week.</p> | Dependent item | gitlab.pipeline.success.week[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.success_week`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Successful (month) | <p>Number of successful pipelines in the last month.</p> | Dependent item | gitlab.pipeline.success.month[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.success_month`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Total (hour) | <p>Total number of pipelines in the last hour.</p> | Dependent item | gitlab.pipeline.total.hour[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.total_hour`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Total (day) | <p>Total number of pipelines in the last day.</p> | Dependent item | gitlab.pipeline.total.day[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.total_day`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Total (week) | <p>Total number of pipelines in the last week.</p> | Dependent item | gitlab.pipeline.total.week[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.total_week`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Total (month) | <p>Total number of pipelines in the last month.</p> | Dependent item | gitlab.pipeline.total.month[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.total_month`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Failure rate (hour) | <p>Percentage of pipelines that failed in the last hour.</p> | Dependent item | gitlab.pipeline.failrate.hour[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.failure_rate_hour`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Failure rate (day) | <p>Percentage of pipelines that failed in the last day.</p> | Dependent item | gitlab.pipeline.failrate.day[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.failure_rate_day`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Failure rate (week) | <p>Percentage of pipelines that failed in the last week.</p> | Dependent item | gitlab.pipeline.failrate.week[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.failure_rate_week`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Failure rate (month) | <p>Percentage of pipelines that failed in the last month.</p> | Dependent item | gitlab.pipeline.failrate.month[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.failure_rate_month`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Latest pipeline status | <p>Status of the most recent pipeline.</p> | Dependent item | gitlab.pipeline.latest.status[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.latest_status`</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Latest pipeline ref | <p>Git ref (branch or tag) of the most recent pipeline.</p> | Dependent item | gitlab.pipeline.latest.ref[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.latest_ref`</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul> |
| GitLab: {#PROJECT_PATH} Pipelines: Latest pipeline URL | <p>Web URL of the most recent pipeline.</p> | Dependent item | gitlab.pipeline.latest.url[{#PROJECT_ID}]<p>**Preprocessing**</p><ul><li><p>JSONPath: `$.latest_url`</p></li><li><p>Discard unchanged with heartbeat: `1h`</p></li></ul> |

### Calculated items (aggregates across all projects)

| Name | Description | Type | Key and additional info |
| ---- | ----------- | ---- | ----------------------- |
| GitLab: All projects: Total pipelines (hour) | <p>Sum of total pipelines across all projects (last hour).</p> | Calculated | gitlab.pipeline.total.hour.all |
| GitLab: All projects: Total pipelines (day) | <p>Sum of total pipelines across all projects (last day).</p> | Calculated | gitlab.pipeline.total.day.all |
| GitLab: All projects: Total pipelines (week) | <p>Sum of total pipelines across all projects (last week).</p> | Calculated | gitlab.pipeline.total.week.all |
| GitLab: All projects: Failed pipelines (hour) | <p>Sum of failed pipelines across all projects (last hour).</p> | Calculated | gitlab.pipeline.failed.hour.all |
| GitLab: All projects: Failed pipelines (day) | <p>Sum of failed pipelines across all projects (last day).</p> | Calculated | gitlab.pipeline.failed.day.all |
| GitLab: All projects: Failed pipelines (week) | <p>Sum of failed pipelines across all projects (last week).</p> | Calculated | gitlab.pipeline.failed.week.all |
| GitLab: All projects: Successful pipelines (hour) | <p>Sum of successful pipelines across all projects (last hour).</p> | Calculated | gitlab.pipeline.success.hour.all |
| GitLab: All projects: Successful pipelines (day) | <p>Sum of successful pipelines across all projects (last day).</p> | Calculated | gitlab.pipeline.success.day.all |
| GitLab: All projects: Successful pipelines (week) | <p>Sum of successful pipelines across all projects (last week).</p> | Calculated | gitlab.pipeline.success.week.all |
| GitLab: All projects: Failure rate (hour) | <p>Overall failure rate across all projects (last hour).</p> | Calculated | gitlab.pipeline.failrate.hour.all |
| GitLab: All projects: Failure rate (day) | <p>Overall failure rate across all projects (last day).</p> | Calculated | gitlab.pipeline.failrate.day.all |

### Trigger prototypes for Project discovery

| Name | Description | Expression | Severity | Dependencies and additional info |
| ---- | ----------- | ---------- | -------- | -------------------------------- |
| GitLab: High daily failure rate on {#PROJECT_PATH} | <p>The daily pipeline failure rate for {#PROJECT_PATH} exceeds {$GITLAB.FAIL.RATE.DAY.WARN}%. Override per project with the context macro {$GITLAB.FAIL.RATE.DAY.WARN:"{#PROJECT_PATH}"}.</p> | `last(/GitLab Pipelines by HTTP/gitlab.pipeline.failrate.day[{#PROJECT_ID}])>{$GITLAB.FAIL.RATE.DAY.WARN:"{#PROJECT_PATH}"}` | Average | <p>Operational data: Failure rate: {ITEM.LASTVALUE}</p><p>Manual close: Yes</p><p>Depends on:</p><ul><li>GitLab: API is unreachable</li></ul> |
| GitLab: High weekly failure rate on {#PROJECT_PATH} | <p>The weekly pipeline failure rate for {#PROJECT_PATH} exceeds {$GITLAB.FAIL.RATE.WEEK.WARN}%. Override per project with the context macro {$GITLAB.FAIL.RATE.WEEK.WARN:"{#PROJECT_PATH}"}.</p> | `last(/GitLab Pipelines by HTTP/gitlab.pipeline.failrate.week[{#PROJECT_ID}])>{$GITLAB.FAIL.RATE.WEEK.WARN:"{#PROJECT_PATH}"}` | Average | <p>Operational data: Failure rate: {ITEM.LASTVALUE}</p><p>Manual close: Yes</p><p>Depends on:</p><ul><li>GitLab: API is unreachable</li></ul> |

### Triggers (global)

| Name | Description | Expression | Severity | Dependencies and additional info |
| ---- | ----------- | ---------- | -------- | -------------------------------- |
| GitLab: High daily failure rate | <p>The daily failure rate of all pipelines is high</p> | `last(/GitLab Pipelines by HTTP/gitlab.pipeline.failrate.day.all)>{$GITLAB.FAIL.RATE.DAY.WARN:"TOTAL"}` | High | <p>Operational data: Failure rate: {ITEM.LASTVALUE}</p><p>Depends on:</p><ul><li>GitLab: API is unreachable</li></ul> |
| GitLab: High hourly failure rate | <p>The hourly failure rate of all pipelines is high</p> | `last(/GitLab Pipelines by HTTP/gitlab.pipeline.failrate.hour.all)>{$GITLAB.FAIL.RATE.HOUR.WARN:"TOTAL"}` | High | <p>Operational data: Failure rate: {ITEM.LASTVALUE}</p><p>Depends on:</p><ul><li>GitLab: API is unreachable</li></ul> |
| GitLab: API is unreachable | <p>No data from the GitLab API for 30 minutes. The instance may be down, {$GITLAB.URL} may be wrong, or {$GITLAB.API.TOKEN} may be invalid or lack the read_api scope.</p> | `nodata(/GitLab Pipelines by HTTP/gitlab.api.version,30m)=1` | High | |

### Graphs

| Name | Description |
| ---- | ----------- |
| GitLab: All projects pipeline overview (daily) | <p>Graph showing successful (green), failed (red), and total (blue line) pipelines per day across all projects.</p> |
| GitLab: All projects pipeline overview (weekly) | <p>Graph showing successful (green), failed (red), and total (blue line) pipelines per week across all projects.</p> |

### Graph prototypes

| Name | Description |
| ---- | ----------- |
| GitLab: {#PROJECT_PATH} Pipeline overview (daily) | <p>Per-project graph showing successful (green), failed (red), and total (blue line) pipelines per day.</p> |

### Dashboard

The template includes a built-in dashboard "GitLab Pipeline Health" with:

- **Active Problems** — Current pipeline failure alerts, filtered by severity
- **Overall Health** — Pie chart showing success vs failure split
- **Project Health Map** — Honeycomb widget showing all projects color-coded by daily failure rate (green → red)
- **Pipeline Trend** — Stacked graph of total/successful/failed pipelines over time
- **Failure Rate Trend** — Line graph of overall daily failure rate

## Per-project threshold overrides

Use context macros at the host level to set different thresholds per project:

```
{$GITLAB.FAIL.RATE.DAY.WARN:"my-group/my-project"} = 100
```

This effectively silences the trigger for that project (failure rate can never exceed 100%).

## Notes

- The GitLab API returns a maximum of 100 pipelines per request. For high-activity projects (>100 pipelines/week), weekly and monthly counts may be incomplete.
- The discovery rule uses Zabbix Script type with pagination to handle instances with more than 100 projects.
- No external scripts or Zabbix agent required — all data is collected via HTTP agent and Script items running on the Zabbix server.
