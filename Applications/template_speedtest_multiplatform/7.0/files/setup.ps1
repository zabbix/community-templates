#
<#
.SYNOPSIS
    Speedtest to Zabbix の Windows 自動セットアップスクリプト。

.DESCRIPTION
    1. speedtest CLI の存在確認
    2. 動作検証 (DryRun)
    3. Windows タスクスケジューラへの定期実行タスク自動登録
    4. (オプション) Zabbix API を経由したテンプレートの自動インポート

.PARAMETER ZabbixServer
    送信先 Zabbix サーバー (省略時は zabbix_agentd.conf または 127.0.0.1)

.PARAMETER Hostname
    Zabbix 登録ホスト名 (デフォルト: Speedtest)

.PARAMETER Schedule
    定期実行間隔: "Hourly" (毎時0分), "Daily" (毎日深夜0時), "None" (スケジューラ登録なし)

.PARAMETER ZabbixUrl
    テンプレート登録を行う場合の Zabbix Web URL (例: http://192.168.1.10/zabbix)

.PARAMETER ApiToken
    テンプレート登録を行う場合の Zabbix API トークン

.EXAMPLE
    .\setup.ps1 -Schedule Hourly
    ローカル環境で毎時0分の定期実行タスクをタスクスケジューラに登録します。

.EXAMPLE
    .\setup.ps1 -ZabbixServer 192.168.1.10 -Hostname MyPC -ZabbixUrl "http://192.168.1.10/zabbix" -ApiToken "xxx"
    サーバーを指定し、テンプレート登録からタスクスケジューラ登録まで一括で完了させます。
#>

[CmdletBinding()]
param(
    [Parameter()]
    [string]$ZabbixServer = "",

    [Parameter()]
    [string]$Hostname = "",

    [Parameter()]
    [ValidateSet("Hourly", "Daily", "None")]
    [string]$Schedule = "Hourly",

    [Parameter()]
    [ValidateSet("Auto", "JA", "EN")]
    [string]$Language = "Auto",

    [Parameter()]
    [string]$ZabbixUrl = "",

    [Parameter()]
    [string]$ApiToken = ""
)

$ErrorActionPreference = "Stop"

function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    Write-Host "[$timestamp] [$Level] $Message"
}

Write-Log "=== Speedtest to Zabbix Setup Wizard ===" "INFO"

# 1. ホスト名の解決 (第1優先: 引数 -> 第2優先: zabbix_agentd.conf -> 第3優先: マシン名 -> 第4優先: SpeedtestHost)
$resolvedHost = $Hostname
if ([string]::IsNullOrWhiteSpace($resolvedHost)) {
    [string[]]$candidatePaths = @(
        "$env:ProgramFiles\Zabbix Agent\zabbix_agentd.conf",
        "$env:ProgramFiles\Zabbix Agent 2\zabbix_agent2.conf",
        "${env:ProgramFiles(x86)}\Zabbix Agent\zabbix_agentd.conf",
        "C:\zabbix\zabbix_agentd.conf"
    ) | Where-Object { Test-Path $_ -PathType Leaf }
    if ($candidatePaths.Length -gt 0) {
        $cLines = Get-Content $candidatePaths[0] -Encoding Default -ErrorAction SilentlyContinue
        foreach ($l in $cLines) {
            if ($l.Trim() -match '^Hostname\s*=\s*(.+)$') {
                $resolvedHost = ($matches[1].Split(",")[0]).Trim()
                Write-Log "Zabbix Agent 設定ファイルからホスト名 ($resolvedHost) を検出しました。" "INFO"
                break
            }
        }
    }
    if ([string]::IsNullOrWhiteSpace($resolvedHost) -and -not [string]::IsNullOrWhiteSpace($env:COMPUTERNAME)) {
        $resolvedHost = $env:COMPUTERNAME
        Write-Log "デバイスのマシン名 ($resolvedHost) をホスト名として採用しました。" "INFO"
    }
    if ([string]::IsNullOrWhiteSpace($resolvedHost)) {
        $resolvedHost = "SpeedtestHost"
        Write-Log "フォールバックホスト名 ($resolvedHost) を採用しました。" "INFO"
    }
} else {
    Write-Log "指定されたホスト名 ($resolvedHost) を使用します。" "INFO"
}

# 2. speedtest.exe の確認
$speedtestExe = Join-Path $PSScriptRoot "speedtest.exe"
if (-not (Test-Path $speedtestExe) -and -not (Get-Command speedtest.exe -ErrorAction SilentlyContinue)) {
    Write-Log "speedtest CLI が未配置のため、公式パッケージから自動ダウンロードを試みます..." "INFO"
    try {
        $zipPath = Join-Path $PSScriptRoot "ookla-speedtest.zip"
        Invoke-WebRequest -Uri "https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-win64.zip" -OutFile $zipPath -UseBasicParsing
        Expand-Archive -Path $zipPath -DestinationPath $PSScriptRoot -Force
        Remove-Item $zipPath -Force -ErrorAction SilentlyContinue
        Write-Log "speedtest CLI の自動ダウンロードと配置に成功しました！" "INFO"
    } catch {
        Write-Log "自動ダウンロードに失敗しました: $_" "WARN"
        Write-Log "以下の公式サイトから speedtest.exe をダウンロードして、本フォルダ ($PSScriptRoot) に配置してください:" "WARN"
        Write-Log "  https://www.speedtest.net/ja/apps/cli" "WARN"
        exit 1
    }
}
Write-Log "speedtest CLI を検出しました。" "INFO"

# 3. 動作検証 (DryRun)
Write-Log "動作確認 (DryRun) を実行中..." "INFO"
$testArgs = @("-DryRun", "-Hostname", $resolvedHost)
if (-not [string]::IsNullOrWhiteSpace($ZabbixServer)) {
    $testArgs += @("-ZabbixServer", $ZabbixServer)
}

& (Join-Path $PSScriptRoot "speedtest.ps1") @testArgs
if ($LASTEXITCODE -ne 0) {
    Write-Log "DryRun 検証でエラーが発生しました。設定やネットワークを確認してください。" "ERROR"
    exit 1
}
Write-Log "DryRun 検証が正常に完了しました。" "INFO"

# 4. テンプレートのインポート (URL と API トークンが提供された場合)
if (-not [string]::IsNullOrWhiteSpace($ZabbixUrl) -and -not [string]::IsNullOrWhiteSpace($ApiToken)) {
    Write-Log "Zabbix サーバーへテンプレートをインポート中..." "INFO"
    $importArgs = @(
        "-ZabbixUrl", $ZabbixUrl,
        "-ApiToken", $ApiToken,
        "-LinkToHost", $resolvedHost,
        "-Language", $Language
    )
    & (Join-Path $PSScriptRoot "import_template.ps1") @importArgs
}

# 5. タスクスケジューラへの自動登録
if ($Schedule -ne "None") {
    $taskName = "Speedtest-to-Zabbix"
    # タスクスケジューラ実行時 (0x80070002) の起動失敗を防ぐため、実行バイナリの絶対パスを確実に解決
    $defaultPowershell = "$env:SystemRoot\System32\WindowsPowerShell\v1.0\powershell.exe"
    $psExePath = $defaultPowershell

    # 正規インストールされた PowerShell 7 のフルパスが存在するか確認 (Store版 WindowsApps のエイリアスはバックグラウンド起動で失敗するため除外)
    $pwshCmd = Get-Command pwsh.exe -ErrorAction SilentlyContinue
    if ($pwshCmd -and $pwshCmd.Source -and $pwshCmd.Source -notmatch 'WindowsApps' -and (Test-Path $pwshCmd.Source)) {
        $psExePath = $pwshCmd.Source
    } elseif (Test-Path "$env:ProgramFiles\PowerShell\7\pwsh.exe") {
        $psExePath = "$env:ProgramFiles\PowerShell\7\pwsh.exe"
    }

    Write-Log "タスク実行バイナリとして '$psExePath' を使用します。" "INFO"

    $scriptPath = Join-Path $PSScriptRoot "speedtest.ps1"
    $actionArgs = "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$scriptPath`" -Hostname `"$resolvedHost`""
    if (-not [string]::IsNullOrWhiteSpace($ZabbixServer)) {
        $actionArgs += " -ZabbixServer `"$ZabbixServer`""
    }

    $taskRunCommand = "$psExePath $actionArgs"
    $schArgs = @("/create", "/tn", $taskName, "/tr", $taskRunCommand, "/f")
    if ($Schedule -eq "Hourly") {
        $schArgs += @("/sc", "hourly")
    } elseif ($Schedule -eq "Daily") {
        $schArgs += @("/sc", "daily", "/st", "00:00")
    }

    $schResult = & schtasks.exe @schArgs
    if ($LASTEXITCODE -eq 0) {
        Write-Log "タスク '$taskName' を正常に登録しました！" "INFO"
    } else {
        Write-Log "タスクの登録に失敗しました。管理者権限の PowerShell で再試行してください。" "WARN"
    }
}

Write-Log "=== セットアップが完了しました ===" "INFO"
