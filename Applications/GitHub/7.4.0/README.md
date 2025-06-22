# GitHub File or Repository Change Monitor (Zabbix Template)

This Zabbix template monitors changes to a specific file, directory, or entire repository hosted on GitHub.  
It uses the GitHub REST API and Zabbix's native HTTP agent to track the latest commit SHA.  
If a change is detected (new commit), a trigger is fired so the user can be notified via Zabbix actions.

## Features

- No external scripts required (uses HTTP agent only)
- Detects updates in:
  - A specific file
  - A specific folder
  - The entire repository
- Works with any public GitHub repository
- Fully parameterized via macros
- Trigger on new commit (SHA) detection

## Macros

| Name                      | Description                                                                                         | Default   |
|---------------------------|-----------------------------------------------------------------------------------------------------|-----------|
| `{$GITHUB_REPO}`          | GitHub repository in the format `owner/repo` (e.g., `zabbix/zabbix`)                                | `zabbix/community-templates`          |
| `{$GITHUB_FILE}`          | Relative path to file or folder (e.g., `templates/`, `myfile.yaml`). Leave empty for full repo.     | *(empty)* |
| `{$GITHUB_BRANCH}`        | Name of the Git branch to monitor (e.g., `main`, `master`)                                          | `main`    |
| `{$GITHUB_UPDATE_INTERVAL}` | How often (in seconds) the GitHub API should be queried                                            | `1h`    |


## Item Details


| Item Key            | Name                     | Type       | Update Interval (s)         | Preprocessing                                    |
| ------------------- | ------------------------ | ---------- | --------------------------- | ------------------------------------------------ |
| `github.commit.sha` | GitHub latest commit SHA | HTTP Agent | `{$GITHUB_UPDATE_INTERVAL}` | JSONPath: `$.body[0].sha` |

## Trigger

| Name                         | Expression                                   | Severity | Description                                        |
| ---------------------------- | -------------------------------------------- | -------- | -------------------------------------------------- |
| New Commit | change(/GitHub commit by HTTP/github.commit.sha)=1 | Info     | Fires when a new commit is detected on the target. |


## Requirements

- Zabbix 5.4+ recommended (for JSONPath preprocessing)
- Internet access from the Zabbix server to `api.github.com`

## Example Use Cases

- Monitor upstream changes to Zabbix templates
- Get notified when someone updates a script or config in GitHub
- Watch critical files in your own repositories