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
    $cand1 = Join-Path $PSScriptRoot "Speedtest.yaml"
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
    template_dashboards = @{
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

    # ホストの取得
    $hosts = Invoke-ZabbixApi -Method "host.get" -Params @{
        filter = @{ host = @($LinkToHost) }
        selectParentTemplates = @("templateid", "name")
    }

    if ($null -eq $hosts -or $hosts.Count -eq 0) {
        Write-Log "ホスト '$LinkToHost' が見つかりませんでした。Zabbix Web UI 上でホストを作成後に手動でリンクしてください。" "WARN"
        exit 0
    }

    $targetHost = $hosts[0]
    $hostId = $targetHost.hostid

    # インポートしたテンプレートの templateid を取得
    $templates = Invoke-ZabbixApi -Method "template.get" -Params @{
        filter = @{ host = @("Speedtest（Ookla CLI）") }
    }
    if ($null -eq $templates -or $templates.Count -eq 0) {
        # テンプレート名フォールバック
        $templates = Invoke-ZabbixApi -Method "template.get" -Params @{
            search = @{ name = "Speedtest" }
        }
    }

    if ($null -eq $templates -or $templates.Count -eq 0) {
        Write-Log "インポートされた Speedtest テンプレートの ID を特定できませんでした。" "WARN"
        exit 0
    }

    $speedtestTemplateId = $templates[0].templateid

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
            Write-Log "ホスト '$LinkToHost' に Speedtest テンプレートを正常にリンクしました！" "INFO"
        } else {
            Write-Log "ホストへのテンプレートリンクに失敗しました。" "WARN"
        }
    }
}
