#!/usr/bin/env bash
# ==============================================================================
# Ookla Speedtest CLI to Zabbix Sender (Linux / zabbix_sender 版)
#
# pip や Python 外部ライブラリが利用できないセキュア・閉域環境向けのシェルスクリプト。
# speedtest CLI の結果を zabbix_sender 経由で Zabbix サーバーへ送信します。
# ==============================================================================

set -euo pipefail

# デフォルト設定 (空の場合は自動解決)
ZABBIX_SERVER="${ZABBIX_SERVER:-}"
ZABBIX_PORT="${ZABBIX_PORT:-10051}"
ZABBIX_HOST="${ZABBIX_HOST:-}"
ITEM_KEY="speedtest.json"
CONFIG_FILE=""
DRY_RUN=0
MAX_RETRIES=3
RETRY_DELAY=5

# ログ関数
log() {
    local level="$1"; shift
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$level] $*"
}

# ヘルプ表示
usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Options:
  -c <config>    Zabbix Agent 設定ファイルのパス (自動検出も可能)
  -z <server>    Zabbix サーバー IP またはホスト名
  -p <port>      Zabbix トラッパーポート (デフォルト: 10051)
  -s <host>      Zabbix 上の登録ホスト名 (未指定時は conf -> デバイス名 -> SpeedtestHost)
  -k <key>       マスターアイテムキー (デフォルト: ${ITEM_KEY})
  -d             DryRun (Zabbix への送信を行わず結果を表示)
  -h             このヘルプを表示

Requirements:
  - speedtest CLI (https://www.speedtest.net/ja/apps/cli)
  - zabbix_sender (sudo apt install zabbix-sender / sudo dnf install zabbix-sender)
EOF
    exit 0
}

# コマンドライン引数のパース
while getopts "c:z:p:s:k:dh" opt; do
    case "$opt" in
        c) CONFIG_FILE="$OPTARG" ;;
        z) ZABBIX_SERVER="$OPTARG" ;;
        p) ZABBIX_PORT="$OPTARG" ;;
        s) ZABBIX_HOST="$OPTARG" ;;
        k) ITEM_KEY="$OPTARG" ;;
        d) DRY_RUN=1 ;;
        h) usage ;;
        *) usage ;;
    esac
done

# Zabbix Agent 設定ファイルからの自動解決
if [ -z "$ZABBIX_SERVER" ] || [ -z "$ZABBIX_HOST" ]; then
    CANDIDATES=("$CONFIG_FILE" "/etc/zabbix/zabbix_agentd.conf" "/etc/zabbix/zabbix_agent2.conf" "/usr/local/etc/zabbix_agentd.conf")
    for conf in "${CANDIDATES[@]}"; do
        if [ -n "$conf" ] && [ -f "$conf" ]; then
            if [ -z "$ZABBIX_SERVER" ]; then
                CONF_SERVER=$(grep -E '^(ServerActive|Server)=' "$conf" | head -n 1 | cut -d= -f2- | cut -d, -f1 | tr -d ' ' || true)
                if [ -n "$CONF_SERVER" ]; then
                    if echo "$CONF_SERVER" | grep -q ":"; then
                        ZABBIX_SERVER=$(echo "$CONF_SERVER" | cut -d: -f1)
                        [ "$ZABBIX_PORT" = "10051" ] && ZABBIX_PORT=$(echo "$CONF_SERVER" | cut -d: -f2)
                    else
                        ZABBIX_SERVER="$CONF_SERVER"
                    fi
                    log "INFO" "Zabbix Agent 設定ファイル ($conf) からサーバー ($ZABBIX_SERVER) を検出しました。"
                fi
            fi
            if [ -z "$ZABBIX_HOST" ]; then
                CONF_HOST=$(grep -E '^Hostname=' "$conf" | head -n 1 | cut -d= -f2- | cut -d, -f1 | tr -d ' ' || true)
                if [ -n "$CONF_HOST" ]; then
                    ZABBIX_HOST="$CONF_HOST"
                    log "INFO" "Zabbix Agent 設定ファイルからホスト名 ($ZABBIX_HOST) を検出しました。"
                fi
            fi
            break
        fi
    done
fi

# ホスト名の決定 (第1優先: 引数 -> 第2優先: conf -> 第3優先: デバイス名 -> 第4優先: SpeedtestHost)
if [ -z "$ZABBIX_HOST" ]; then
    DEVICE_HOST=$(hostname -s 2>/dev/null || hostname 2>/dev/null || uname -n 2>/dev/null || true)
    if [ -n "$DEVICE_HOST" ]; then
        ZABBIX_HOST="$DEVICE_HOST"
        log "INFO" "デバイスのマシン名 ($ZABBIX_HOST) をホスト名として採用しました。"
    else
        ZABBIX_HOST="SpeedtestHost"
        log "INFO" "フォールバックホスト名 ($ZABBIX_HOST) を採用しました。"
    fi
fi

# サーバーの最終フォールバック
ZABBIX_SERVER="${ZABBIX_SERVER:-127.0.0.1}"

# 1. 依存コマンドのチェック
if ! command -v speedtest >/dev/null 2>&1; then
    log "ERROR" "speedtest コマンドが見つかりません。"
    log "ERROR" "公式ドキュメントを参照して speedtest CLI をインストールしてください:"
    log "ERROR" "  https://www.speedtest.net/ja/apps/cli"
    exit 1
fi

if [ "$DRY_RUN" -eq 0 ] && ! command -v zabbix_sender >/dev/null 2>&1; then
    log "ERROR" "zabbix_sender コマンドが見つかりません。"
    log "ERROR" "パッケージマネージャーからインストールしてください:"
    log "ERROR" "  Debian/Ubuntu: sudo apt-get install zabbix-sender"
    log "ERROR" "  RHEL/CentOS:   sudo dnf install zabbix-sender"
    exit 1
fi

# 2. Speedtest CLI の実行 (リトライループ)
JSON_OUTPUT=""
for attempt in $(seq 1 "$MAX_RETRIES"); do
    log "INFO" "Speedtest CLI を実行中 (試行 ${attempt}/${MAX_RETRIES})..."
    
    # 実行して出力を取得 (エラーもキャプチャ)
    set +e
    RAW_OUT=$(speedtest --format=json --accept-license --accept-gdpr 2>&1)
    EXIT_CODE=$?
    set -e

    if [ "$EXIT_CODE" -eq 0 ]; then
        # ライセンス警告行をスキップし、"type":"result" を含む JSON 行を抽出
        JSON_LINE=$(echo "$RAW_OUT" | grep -F '"type":"result"' | tail -n 1 || true)
        if [ -n "$JSON_LINE" ]; then
            JSON_OUTPUT="$JSON_LINE"
            break
        fi
        log "WARN" "有効な結果 JSON を検出できませんでした。"
    else
        log "WARN" "Speedtest CLI がエラーを返しました (ExitCode: ${EXIT_CODE}):"
        echo "$RAW_OUT" | sed 's/^/  /' >&2
    fi

    if [ "$attempt" -lt "$MAX_RETRIES" ]; then
        log "INFO" "${RETRY_DELAY} 秒待機して再試行します..."
        sleep "$RETRY_DELAY"
    fi
done

if [ -z "$JSON_OUTPUT" ]; then
    log "ERROR" "最大試行回数 (${MAX_RETRIES} 回) を超過したため中止します。"
    exit 1
fi

# 1行のコンパクトな JSON に整形 (改行・復帰コードの除去)
CLEAN_JSON=$(echo "$JSON_OUTPUT" | tr -d '\r\n')

log "INFO" "計測が完了しました (データサイズ: ${#CLEAN_JSON} bytes)。"

# 3. 送信処理 / DryRun
if [ "$DRY_RUN" -eq 1 ]; then
    log "INFO" "[DryRun] Zabbix サーバーへの送信はスキップされました。"
    log "INFO" "[DryRun] 送信データプレビュー:"
    echo "  Host: ${ZABBIX_HOST} | Key: ${ITEM_KEY} | Value: ${CLEAN_JSON:0:150}..."
    exit 0
fi

# zabbix_sender の一括入力形式 (-i -: 標準入力からタブ区切り <host>\t<key>\t<value>) で送信
log "INFO" "Zabbix サーバー (${ZABBIX_SERVER}:${ZABBIX_PORT}) へ送信中 (送信キー: ${ITEM_KEY})..."

SENDER_OUTPUT=$(printf "%s\t%s\t%s\n" "$ZABBIX_HOST" "$ITEM_KEY" "$CLEAN_JSON" | \
    zabbix_sender -z "$ZABBIX_SERVER" -p "$ZABBIX_PORT" -i - 2>&1)

log "INFO" "Zabbix Sender 出力:"
echo "$SENDER_OUTPUT" | sed 's/^/  /'

# 処理結果の判定 (processed / failed)
if echo "$SENDER_OUTPUT" | grep -q "processed: [1-9]"; then
    log "INFO" "Zabbix サーバーへの送信が正常に完了しました。"
else
    log "WARN" "送信が失敗したか、Zabbix 側でアイテムが未登録の可能性があります。"
    exit 1
fi
