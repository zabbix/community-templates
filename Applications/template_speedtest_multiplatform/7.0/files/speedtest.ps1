<#
.SYNOPSIS
    Ookla Speedtest CLI を実行し、計測結果をパースして Zabbix サーバーへ送信するスクリプト。

.DESCRIPTION
    speedtest.exe の JSON 出力からメトリクスを抽出・計算し、Zabbix サーバーへ一括送信します。
    送信方式として以下の2通りを選択可能です:
      1. PowerShell ネイティブソケット方式 (デフォルト: zabbix_sender.exe 不要)
      2. ZabbixSender 方式 (外部の zabbix_sender.exe バイナリを使用)

.PARAMETER ZabbixServer
    送信先 Zabbix サーバーの IP またはホスト名 (デフォルト: 127.0.0.1 または環境変数 ZABBIX_SERVER)

.PARAMETER ZabbixPort
    Zabbix トラッパーのポート番号 (デフォルト: 10051)

.PARAMETER Hostname
    Zabbix 上に登録されているホスト名 (デフォルト: Speedtest)

.PARAMETER ItemPrefix
    アイテムキーのプレフィックス (デフォルト: speedtest)

.PARAMETER SendMethod
    送信方式: "PowerShell" (ネイティブソケット) または "ZabbixSender" (デフォルト: PowerShell)

.PARAMETER DryRun
    Zabbix への送信を行わず、パースされたメトリクスと送信予定データをコンソールに表示します。

.PARAMETER SendRawJson
    speedtest.json アイテムとして生の JSON 文字列も送信するかどうか (デフォルト: $true)

.EXAMPLE
    .\speedtest.ps1 -DryRun
    Zabbix へ送信せずに計測とパースの動作確認を行います。

.EXAMPLE
    .\speedtest.ps1 -SendMethod PowerShell
    外部バイナリ不要で、PowerShell ネイティブの TCP ソケット通信で Zabbix サーバーへ送信します。

.EXAMPLE
    .\speedtest.ps1 -SendMethod ZabbixSender
    zabbix_sender.exe を使用して Zabbix サーバーへ送信します。
#>

[CmdletBinding()]
param(
    [Parameter()]
    [string]$ZabbixServer = "",

    [Parameter()]
    [int]$ZabbixPort = 10051,

    [Parameter()]
    [string]$Hostname = "",

    [Parameter()]
    [string]$ItemPrefix = "speedtest",

    [Parameter()]
    [ValidateSet("PowerShell", "ZabbixSender")]
    [string]$SendMethod = "PowerShell",

    [Parameter()]
    [switch]$DryRun,

    [Parameter()]
    [string]$ConfigFile = "",

    [Parameter()]
    [string]$SpeedtestPath = "",

    [Parameter()]
    [string]$ZabbixSenderPath = ""
)

# 出力文字コードを UTF-8 に統一
$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

function Write-Log {
    param([string]$Message, [string]$Level = "INFO")
    $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    Write-Host "[$timestamp] [$Level] $Message"
}

# Zabbix Agent 設定ファイル (zabbix_agentd.conf / zabbix_agent2.conf) のパース関数
function Get-ZabbixAgentConfSettings {
    param([string]$ExplicitPath)
    [string[]]$candidatePaths = @(
        $ExplicitPath,
        "$env:ProgramFiles\Zabbix Agent\zabbix_agentd.conf",
        "$env:ProgramFiles\Zabbix Agent 2\zabbix_agent2.conf",
        "${env:ProgramFiles(x86)}\Zabbix Agent\zabbix_agentd.conf",
        "C:\zabbix\zabbix_agentd.conf",
        "C:\zabbix_agentd.conf"
    ) | Where-Object { -not [string]::IsNullOrWhiteSpace($_) -and (Test-Path -Path $_ -PathType Leaf) }

    if ($candidatePaths.Length -eq 0) { return $null }
    $foundPath = $candidatePaths[0]

    $res = @{ Path = $foundPath; Server = $null; Port = $null; Hostname = $null }
    try {
        $lines = Get-Content -Path $foundPath -Encoding Default -ErrorAction Stop
        foreach ($line in $lines) {
            $trimmed = $line.Trim()
            if ($trimmed.StartsWith("#") -or [string]::IsNullOrWhiteSpace($trimmed)) { continue }

            # ServerActive=192.168.1.10:10051 (優先)
            if ($trimmed -match '^ServerActive\s*=\s*(.+)$') {
                $first = ($matches[1].Split(",")[0]).Trim()
                if ($first -match '^([^:]+)(?::(\d+))?$') {
                    $res.Server = $matches[1].Trim()
                    if ($matches[2]) { $res.Port = [int]$matches[2] }
                }
            } elseif (-not $res.Server -and $trimmed -match '^Server\s*=\s*(.+)$') {
                $first = ($matches[1].Split(",")[0]).Trim()
                if ($first -match '^([^:]+)(?::(\d+))?$') {
                    $res.Server = $matches[1].Trim()
                    if ($matches[2]) { $res.Port = [int]$matches[2] }
                }
            }
            if ($trimmed -match '^Hostname\s*=\s*(.+)$') {
                $res.Hostname = ($matches[1].Split(",")[0]).Trim()
            }
        }
    } catch {
        return $null
    }
    return $res
}

# Zabbix サーバーとホスト名の自動解決 (引数 -> zabbix_agentd.conf -> 環境変数 -> デフォルト値)
$confSettings = Get-ZabbixAgentConfSettings -ExplicitPath $ConfigFile

if ([string]::IsNullOrWhiteSpace($ZabbixServer)) {
    if ($null -ne $confSettings -and -not [string]::IsNullOrWhiteSpace($confSettings.Server)) {
        $ZabbixServer = $confSettings.Server
        if ($null -ne $confSettings.Port -and $ZabbixPort -eq 10051) {
            $ZabbixPort = $confSettings.Port
        }
        Write-Log "Zabbix Agent 設定ファイル ($($confSettings.Path)) から送信先サーバー ($ZabbixServer) を検出しました。" "INFO"
    } elseif ($env:ZABBIX_SERVER) {
        $ZabbixServer = $env:ZABBIX_SERVER
    } else {
        $ZabbixServer = "127.0.0.1"
    }
}

# ホスト名の決定 (第1優先: 引数 -> 第2優先: zabbix_agentd.conf -> 第3優先: マシン名 -> 第4優先: SpeedtestHost)
if ([string]::IsNullOrWhiteSpace($Hostname)) {
    if ($null -ne $confSettings -and -not [string]::IsNullOrWhiteSpace($confSettings.Hostname)) {
        $Hostname = $confSettings.Hostname
        Write-Log "Zabbix Agent 設定ファイルからホスト名 ($Hostname) を検出しました。" "INFO"
    } elseif (-not [string]::IsNullOrWhiteSpace($env:COMPUTERNAME)) {
        $Hostname = $env:COMPUTERNAME
        Write-Log "デバイスのマシン名 ($Hostname) をホスト名として採用しました。" "INFO"
    } else {
        $Hostname = "SpeedtestHost"
        Write-Log "フォールバックホスト名 ($Hostname) を採用しました。" "INFO"
    }
}

# デフォルトパスの安全な解決 (PowerShell 5.1 互換)
if ([string]::IsNullOrWhiteSpace($SpeedtestPath)) {
    # カレント/スクリプト配置先、または PATH から検索
    if (Test-Path (Join-Path $PSScriptRoot "speedtest.exe")) {
        $SpeedtestPath = Join-Path $PSScriptRoot "speedtest.exe"
    } elseif (Get-Command speedtest.exe -ErrorAction SilentlyContinue) {
        $SpeedtestPath = (Get-Command speedtest.exe).Source
    } else {
        $SpeedtestPath = Join-Path $PSScriptRoot "speedtest.exe"
    }
}
if ([string]::IsNullOrWhiteSpace($ZabbixSenderPath)) {
    if (Test-Path (Join-Path $PSScriptRoot "zabbix_sender.exe")) {
        $ZabbixSenderPath = Join-Path $PSScriptRoot "zabbix_sender.exe"
    } elseif (Get-Command zabbix_sender.exe -ErrorAction SilentlyContinue) {
        $ZabbixSenderPath = (Get-Command zabbix_sender.exe).Source
    } else {
        $ZabbixSenderPath = Join-Path $PSScriptRoot "zabbix_sender.exe"
    }
}

# .NET ソケットを使用した Zabbix トラッパー直接送信関数 (外部バイナリ不要)
function Send-ZabbixSocketNative {
    param(
        [string]$Server,
        [int]$Port,
        [array]$DataList
    )
    $payloadObj = @{
        request = "sender data"
        data    = $DataList
    }
    $json = $payloadObj | ConvertTo-Json -Compress -Depth 5
    $jsonBytes = [System.Text.Encoding]::UTF8.GetBytes($json)
    $dataLen = [uint64]$jsonBytes.Length

    # Zabbix プロトコルヘッダー: 'ZBXD\x01' (5 bytes) + データ長 (8 bytes Little Endian)
    $headerBytes = [byte[]]@(0x5A, 0x42, 0x58, 0x44, 0x01)
    $lenBytes = [BitConverter]::GetBytes($dataLen)

    $tcpClient = [System.Net.Sockets.TcpClient]::new()
    $tcpClient.SendTimeout = 10000
    $tcpClient.ReceiveTimeout = 10000

    try {
        $tcpClient.Connect($Server, $Port)
        $stream = $tcpClient.GetStream()
        $stream.Write($headerBytes, 0, $headerBytes.Length)
        $stream.Write($lenBytes, 0, $lenBytes.Length)
        $stream.Write($jsonBytes, 0, $jsonBytes.Length)
        $stream.Flush()

        # レスポンスヘッダー受信 (13 bytes)
        $respHeader = New-Object byte[] 13
        $bytesRead = 0
        while ($bytesRead -lt 13) {
            $chunk = $stream.Read($respHeader, $bytesRead, 13 - $bytesRead)
            if ($chunk -le 0) { break }
            $bytesRead += $chunk
        }

        if ($bytesRead -ge 13) {
            $respLen = [BitConverter]::ToUInt64($respHeader, 5)
            $respBytes = New-Object byte[] $respLen
            $readTotal = 0
            while ($readTotal -lt $respLen) {
                $chunk = $stream.Read($respBytes, $readTotal, [int]($respLen - $readTotal))
                if ($chunk -le 0) { break }
                $readTotal += $chunk
            }
            return [System.Text.Encoding]::UTF8.GetString($respBytes, 0, $readTotal)
        }
        return $null
    } finally {
        if ($null -ne $tcpClient) {
            $tcpClient.Close()
        }
    }
}

# 1. 実行ファイルの存在確認
if (-not (Test-Path $SpeedtestPath) -and -not (Get-Command $SpeedtestPath -ErrorAction SilentlyContinue)) {
    Write-Log "speedtest CLI が見つかりません: $SpeedtestPath" "ERROR"
    Write-Log "公式ダウンロードサイトから speedtest.exe をダウンロードして配置してください: https://www.speedtest.net/ja/apps/cli" "ERROR"
    exit 1
}

if (-not $DryRun -and $SendMethod -eq "ZabbixSender") {
    if (-not (Test-Path $ZabbixSenderPath) -and -not (Get-Command $ZabbixSenderPath -ErrorAction SilentlyContinue)) {
        Write-Log "zabbix_sender.exe が見つかりません: $ZabbixSenderPath" "ERROR"
        Write-Log "公式配布元からダウンロードするか、PowerShell ネイティブ方式 (-SendMethod PowerShell) をご利用ください。" "ERROR"
        exit 1
    }
}

# 2. Speedtest CLI の実行
Write-Log "Speedtest CLI を実行中 ($SpeedtestPath)..."
try {
    $rawOutput = & $SpeedtestPath --format=json --accept-license --accept-gdpr 2>&1
} catch {
    Write-Log "Speedtest CLI の実行中にエラーが発生しました: $_" "ERROR"
    exit 1
}

# 3. JSON 行の抽出とパース
$jsonLine = $rawOutput | Where-Object { $_ -match '^\s*\{.*"type"\s*:\s*"result"' } | Select-Object -Last 1

if (-not $jsonLine) {
    Write-Log "Speedtest CLI の出力から有効な結果 JSON を検出できませんでした。" "ERROR"
    Write-Log "--- 出力ログ ---" "ERROR"
    $rawOutput | ForEach-Object { Write-Log $_ "ERROR" }
    exit 1
}

try {
    $data = $jsonLine | ConvertFrom-Json
} catch {
    Write-Log "JSON のパースに失敗しました: $_" "ERROR"
    exit 1
}

# 4. メトリクスの計算・抽出
$downloadBps = [math]::Round([double]$data.download.bandwidth * 8, 0)
$downloadMbps = [math]::Round(($downloadBps / 1000000), 2)

$uploadBps = [math]::Round([double]$data.upload.bandwidth * 8, 0)
$uploadMbps = [math]::Round(($uploadBps / 1000000), 2)

$pingLatency = [math]::Round([double]$data.ping.latency, 3)
$pingJitter = [math]::Round([double]$data.ping.jitter, 3)

$packetLoss = 0.0
if ($null -ne $data.packetLoss) {
    $packetLoss = [math]::Round([double]$data.packetLoss, 2)
}

Write-Log "計測完了:"
Write-Log "  Server   : $($data.server.name) ($($data.server.location), $($data.server.country))"
Write-Log "  Ping     : $pingLatency ms (Jitter: $pingJitter ms)"
Write-Log "  Download : $downloadMbps Mbps ($downloadBps bps)"
Write-Log "  Upload   : $uploadMbps Mbps ($uploadBps bps)"
Write-Log "  Loss     : $packetLoss %"
Write-Log "  URL      : $($data.result.url)"

# 5. 送信データの生成 (Zabbix テンプレートのマスターアイテム speedtest.json 1件に統一)
$compactJson = ($jsonLine -replace "[\r\n]+", "").Trim()
$masterKey = "$ItemPrefix.json"

$itemsList = [System.Collections.Generic.List[hashtable]]::new()
$tsvRecords = [System.Collections.Generic.List[string]]::new()

$itemsList.Add(@{ host = $Hostname; key = $masterKey; value = $compactJson })
$tsvRecords.Add("$Hostname`t$masterKey`t$compactJson")

# 6. 送信処理 / DryRun 処理
if ($DryRun) {
    Write-Log "[DryRun] Zabbix サーバーへの送信はスキップされました。"
    Write-Log "[DryRun] 送信方式: $SendMethod | 送信対象マスターアイテム: $masterKey"
    Write-Host "  Host: $Hostname | Key: $masterKey | Payload: [RAW JSON $($compactJson.Length) 文字]"
    Write-Log "[DryRun] テンプレート側の DEPENDENT アイテム (JSONPATH) により全メトリクスが Zabbix 上で自動展開・計算されます。"
    exit 0
}

Write-Log "Zabbix サーバー ($($ZabbixServer):$($ZabbixPort)) へ計測結果 ($masterKey) を送信中 (送信方式: $SendMethod)..."

if ($SendMethod -eq "PowerShell") {
    # --- 方式1: PowerShell ネイティブソケット送信 ---
    try {
        $respJson = Send-ZabbixSocketNative -Server $ZabbixServer -Port $ZabbixPort -DataList $itemsList
        if ($null -ne $respJson) {
            Write-Log "Zabbix サーバー応答: $respJson"
            if ($respJson -match "processed:\s*(\d+);\s*failed:\s*(\d+)") {
                $processed = [int]$matches[1]
                $failed = [int]$matches[2]
                if ($failed -gt 0 -and $processed -gt 0) {
                    Write-Log "一部のメトリクスが送信されました (成功: $processed 件, 未登録: $failed 件)。" "INFO"
                } elseif ($failed -gt 0 -and $processed -eq 0) {
                    Write-Log "全アイテムの送信に失敗しました (成功: 0 件, 失敗: $failed 件)。Zabbix 側のホスト名やアイテムキーを確認してください。" "WARN"
                } else {
                    Write-Log "全メトリクスが正常に送信されました (成功: $processed 件)。" "INFO"
                }
            }
        } else {
            Write-Log "Zabbix サーバーからの応答を受信できませんでした。" "WARN"
        }
    } catch {
        Write-Log "PowerShell ソケット送信中にエラーが発生しました: $_" "ERROR"
        exit 1
    }
} else {
    # --- 方式2: ZabbixSender 外部バイナリ送信 ---
    $tempFile = [System.IO.Path]::GetTempFileName()
    try {
        [System.IO.File]::WriteAllLines($tempFile, $tsvRecords, (New-Object System.Text.UTF8Encoding($false)))
        $senderOutput = & $ZabbixSenderPath -z $ZabbixServer -p $ZabbixPort -i $tempFile 2>&1
        Write-Log "Zabbix Sender 出力:"
        $senderOutput | ForEach-Object { Write-Log "  $_" }

        $statusLine = ($senderOutput | Out-String)
        if ($statusLine -match "processed:\s*(\d+);\s*failed:\s*(\d+)") {
            $processed = [int]$matches[1]
            $failed = [int]$matches[2]
            if ($failed -gt 0 -and $processed -gt 0) {
                Write-Log "一部のメトリクスが送信されました (成功: $processed 件, 未登録: $failed 件)。" "INFO"
            } elseif ($failed -gt 0 -and $processed -eq 0) {
                Write-Log "全アイテムの送信に失敗しました (成功: 0 件, 失敗: $failed 件)。Zabbix 側のホスト名やアイテムキーを確認してください。" "WARN"
            } else {
                Write-Log "全メトリクスが正常に送信されました (成功: $processed 件)。" "INFO"
            }
        }
    } catch {
        Write-Log "Zabbix Sender の実行中にエラーが発生しました: $_" "ERROR"
        exit 1
    } finally {
        if (Test-Path $tempFile) {
            Remove-Item -Path $tempFile -Force -ErrorAction SilentlyContinue
        }
    }
}
