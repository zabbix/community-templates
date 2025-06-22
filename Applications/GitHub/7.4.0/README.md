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

| Macro                  | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `{$GITHUB_REPO}`       | GitHub repository in the format `owner/repo` (e.g., `zabbix/zabbix`)        |
| `{$GITHUB_FILE}`       | Relative path to file or folder (e.g., `templates/`, `myfile.yaml`)         |
|                        | Leave empty to monitor the entire repository                                |
| `{$GITHUB_BRANCH}`     | Name of the Git branch to monitor (e.g., `main`, `master`)                  |
| `{$GITHUB_UPDATE_INTERVAL}` | How often the GitHub API should be queried     |

## Item Details

- **Type:** HTTP agent
- **Key:** `github.commit.sha`
- **Preprocessing:** JSONPath  
  - Use `$.body[0].sha` if body is wrapped  
- **Required HTTP Header:**  
  - `User-Agent: ZabbixMonitor`

## Trigger

- Fires if the latest commit SHA changes between checks

## Requirements

- Zabbix 5.4+ recommended (for JSONPath preprocessing)
- Internet access from the Zabbix server to `api.github.com`

## Example Use Cases

- Monitor upstream changes to Zabbix templates
- Get notified when someone updates a script or config in GitHub
- Watch critical files in your own repositories


