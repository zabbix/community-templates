#
<#
.SYNOPSIS
    Zabbix API を使用して Speedtest.yaml テンプレートを Zabbix サーバーへインポート・登録するスクリプト。

.DESCRIPTION
    Zabbix API の configuration.import メソッドを呼び出し、YAML 形式のテンプレートをサーバーへ登録します。
    オプションで、指定したホストへテンプレートを自動的にリンク（紐付け）することも可能です。

.PARAMETER ZabbixUrl
    Zabbix Web インターフェースの URL (例: http://192.168.1.10/zabbix または http://zabbix.local)
    ※ /api_jsonrpc.php は自動補完されます。

.PARAMETER ApiToken
    Zabbix API トークン (ユーザー設定 -> APIトークン で生成したもの)

.PARAMETER TemplatePath
    インポートするテンプレート YAML ファイルのパス (デフォルト: .\Speedtest.yaml)

.PARAMETER LinkToHost
    テンプレートを自動リンクする監視対象ホスト名 (例: Speedtest)

.EXAMPLE
    .\import_template.ps1 -ZabbixUrl "http://192.168.1.10/zabbix" -ApiToken "your_api_token"
    テンプレート Speedtest.yaml を Zabbix サーバーにインポートします。

.EXAMPLE
    .\import_template.ps1 -ZabbixUrl "http://192.168.1.10/zabbix" -ApiToken "your_api_token" -LinkToHost "Speedtest"
    テンプレートをインポートし、ホスト "Speedtest" に自動リンクします。
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$ZabbixUrl,

    [Parameter(Mandatory = $true)]
    [string]$ApiToken,

    [Parameter()]
    [string]$TemplatePath = "",

    [Parameter()]
    [ValidateSet("Auto", "JA", "EN")]
    [string]$Language = "Auto",

    [Parameter()]
    [string]$LinkToHost = ""
)

$ErrorActionPreference = "Stop"

function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    Write-Host "[$timestamp] [$Level] $Message"
}

# 1. テンプレートファイルの確認
if ([string]::IsNullOrWhiteSpace($TemplatePath)) {
    $selectedTemplateName = "Speedtest.yaml"
    if ($Language -eq "EN") {
        $selectedTemplateName = "Speedtest_EN.yaml"
    } elseif ($Language -eq "JA") {
        $selectedTemplateName = "Speedtest.yaml"
    } else {
        # Auto: カルチャ判定
        $cultureName = (Get-Culture).Name
        if ($cultureName -like "ja*") {
            $selectedTemplateName = "Speedtest.yaml"
            Write-Log "OS言語 ($cultureName) に基づき、日本語テンプレート ($selectedTemplateName) を選択しました。" "INFO"
        } else {
            $selectedTemplateName = "Speedtest_EN.yaml"
            Write-Log "OS culture ($cultureName): Auto-selected English template ($selectedTemplateName)." "INFO"
        }
    }

    $cand1 = Join-Path $PSScriptRoot $selectedTemplateName
    $cand2 = Join-Path (Split-Path $PSScriptRoot -Parent) "template_speedtest_multiplatform.yaml"
    if (Test-Path $cand1 -PathType Leaf) {
        $TemplatePath = $cand1
    } elseif (Test-Path $cand2 -PathType Leaf) {
        $TemplatePath = $cand2
    } else {
        $TemplatePath = $cand1
    }
}
if (-not (Test-Path $TemplatePath -PathType Leaf)) {
    Write-Log "テンプレートファイルが見つかりません: $TemplatePath" "ERROR"
    exit 1
}

$yamlContent = Get-Content -Path $TemplatePath -Raw -Encoding UTF8
if ([string]::IsNullOrWhiteSpace($yamlContent)) {
    Write-Log "テンプレートファイルが空です: $TemplatePath" "ERROR"
    exit 1
}

# 2. エンドポイント URL の整形
$cleanUrl = $ZabbixUrl.Trim().TrimEnd("/")
if (-not $cleanUrl.EndsWith("api_jsonrpc.php")) {
    $apiUrl = "$cleanUrl/api_jsonrpc.php"
} else {
    $apiUrl = $cleanUrl
}

Write-Log "Zabbix API エンドポイント: $apiUrl" "INFO"

# API 呼び出し汎用関数
function Invoke-ZabbixApi {
    param(
        [string]$Method,
        [hashtable]$Params
    )
    $body = @{
        jsonrpc = "2.0"
        method  = $Method
        params  = $Params
        auth    = $ApiToken
        id      = [int](Get-Random -Minimum 1 -Maximum 99999)
    } | ConvertTo-Json -Depth 10

    $headers = @{
        "Content-Type"  = "application/json-rpc"
        "Authorization" = "Bearer $ApiToken"
    }

    try {
        $response = Invoke-RestMethod -Uri $apiUrl -Method Post -Headers $headers -Body $body
        if ($response.error) {
            Write-Log "API エラー ($Method): $($response.error.message) - $($response.error.data)" "ERROR"
            return $null
        }
        return $response.result
    } catch {
        Write-Log "HTTP 通信エラー ($Method): $_" "ERROR"
        return $null
    }
}

# 3. configuration.import の実行
Write-Log "テンプレート ($TemplatePath) をインポート中..." "INFO"

$importRules = @{
    templates = @{
        createMissing  = $true
        updateExisting = $true
    }
    items = @{
        createMissing  = $true
        updateExisting = $true
    }
    triggers = @{
        createMissing  = $true
        updateExisting = $true
    }
    graphs = @{
        createMissing  = $true
        updateExisting = $true
    }
    template_groups = @{
        createMissing  = $true
        updateExisting = $true
    }
    templateDashboards = @{
        createMissing  = $true
        updateExisting = $true
    }
}

$importResult = Invoke-ZabbixApi -Method "configuration.import" -Params @{
    format = "yaml"
    source = $yamlContent
    rules  = $importRules
}

if ($null -eq $importResult -or $importResult -ne $true) {
    Write-Log "テンプレートのインポートに失敗しました。" "ERROR"
    exit 1
}

Write-Log "テンプレートのインポートが正常に完了しました！" "INFO"

# 4. ホストへのリンク (指定された場合)
if (-not [string]::IsNullOrWhiteSpace($LinkToHost)) {
    Write-Log "ホスト '$LinkToHost' へのテンプレートリンクを確認中..." "INFO"

    # インポートしたテンプレートの templateid を取得
    $templates = Invoke-ZabbixApi -Method "template.get" -Params @{
        filter = @{ host = @("template_speedtest_multiplatform") }
    }
    if ($null -eq $templates -or $templates.Count -eq 0) {
        $templates = Invoke-ZabbixApi -Method "template.get" -Params @{
            filter = @{ host = @("Speedtest（Ookla CLI）") }
        }
    }
    if ($null -eq $templates -or $templates.Count -eq 0) {
        $templates = Invoke-ZabbixApi -Method "template.get" -Params @{
            search = @{ name = "Speedtest" }
        }
    }

    if ($null -eq $templates -or $templates.Count -eq 0) {
        Write-Log "インポートされた Speedtest テンプレートの ID を特定できませんでした。" "WARN"
        exit 0
    }

    $speedtestTemplateId = $templates[0].templateid

    # ホストの取得
    $hosts = Invoke-ZabbixApi -Method "host.get" -Params @{
        filter = @{ host = @($LinkToHost) }
        selectParentTemplates = @("templateid", "name")
    }

    if ($null -eq $hosts -or $hosts.Count -eq 0) {
        Write-Log "ホスト '$LinkToHost' が存在しないため、host.create で自動新規作成します..." "INFO"
        
        # 既存ホストグループの検索
        $hostGroups = Invoke-ZabbixApi -Method "hostgroup.get" -Params @{
            output = @("groupid", "name")
        }

        $targetGroupId = $null
        if ($null -ne $hostGroups -and $hostGroups.Count -gt 0) {
            # 優先グループ名
            foreach ($g in $hostGroups) {
                if ($g.name -in @("Discovered hosts", "Linux servers", "Zabbix servers", "General")) {
                    $targetGroupId = $g.groupid
                    break
                }
            }
            if (-not $targetGroupId) {
                $targetGroupId = $hostGroups[0].groupid
            }
        } else {
            # グループが無ければ新規作成
            $createGroup = Invoke-ZabbixApi -Method "hostgroup.create" -Params @{
                name = "Discovered hosts"
            }
            if ($null -ne $createGroup -and $createGroup.groupids) {
                $targetGroupId = $createGroup.groupids[0]
            }
        }

        if (-not $targetGroupId) {
            Write-Log "ホストグループの取得に失敗したため、ホストを自動作成できませんでした。Web UI 上で手動作成してください。" "WARN"
            exit 0
        }

        # host.create の実行
        $createHostParams = @{
            host = $LinkToHost
            interfaces = @(
                @{
                    type = 1
                    main = 1
                    useip = 1
                    ip = "127.0.0.1"
                    dns = ""
                    port = "10050"
                }
            )
            groups = @(
                @{ groupid = $targetGroupId }
            )
            templates = @(
                @{ templateid = $speedtestTemplateId }
            )
        }

        $createdHost = Invoke-ZabbixApi -Method "host.create" -Params $createHostParams
        if ($null -ne $createdHost -and $createdHost.hostids) {
            Write-Log "ホスト '$LinkToHost' を自動新規作成し、Speedtest テンプレートを正常にリンクしました！" "INFO"
        } else {
            Write-Log "ホスト '$LinkToHost' の自動作成に失敗しました。" "WARN"
        }
    } else {
        $targetHost = $hosts[0]
        $hostId = $targetHost.hostid

        # 既にリンクされているかチェック
        $alreadyLinked = $false
        $currentTemplates = @()
        if ($targetHost.parentTemplates) {
            foreach ($t in $targetHost.parentTemplates) {
                $currentTemplates += @{ templateid = $t.templateid }
                if ($t.templateid -eq $speedtestTemplateId) {
                    $alreadyLinked = $true
                }
            }
        }

        if ($alreadyLinked) {
            Write-Log "ホスト '$LinkToHost' には既に Speedtest テンプレートがリンクされています。" "INFO"
        } else {
            $currentTemplates += @{ templateid = $speedtestTemplateId }
            $updateResult = Invoke-ZabbixApi -Method "host.update" -Params @{
                hostid    = $hostId
                templates = $currentTemplates
            }
            if ($null -ne $updateResult) {
                Write-Log "既存ホスト '$LinkToHost' に Speedtest テンプレートを正常にリンクしました！" "INFO"
            } else {
                Write-Log "ホストへのテンプレートリンクに失敗しました。" "WARN"
            }
        }
    }
}
