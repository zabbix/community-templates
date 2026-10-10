#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Ookla Speedtest CLI to Zabbix Sender (Python / zabbix_utils 版)
Linux / Windows 両環境で共通利用可能な計測・送信スクリプト。
"""

import os
import sys
import json
import shutil
import subprocess
import argparse
from datetime import datetime

# Windows 環境での出力文字化け防止
if sys.platform == "win32":
    sys.stdout.reconfigure(encoding="utf-8")


def log(message, level="INFO"):
    now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"[{now}] [{level}] {message}")


def check_zabbix_utils():
    try:
        from zabbix_utils import Sender, ItemValue
        return Sender, ItemValue
    except ImportError:
        log("zabbix_utils ライブラリがインストールされていません。", "ERROR")
        log("以下のコマンドでインストールしてください:", "ERROR")
        log("  pip install zabbix-utils", "ERROR")
        sys.exit(1)


def find_speedtest_cmd(custom_path=None):
    if custom_path and shutil.which(custom_path):
        return custom_path
    if shutil.which("speedtest"):
        return "speedtest"
    if shutil.which("speedtest.exe"):
        return "speedtest.exe"
    # スクリプト配置ディレクトリも探索
    import os
    script_dir = os.path.dirname(os.path.abspath(__file__))
    local_exe = os.path.join(script_dir, "speedtest.exe")
    if os.path.exists(local_exe):
        return local_exe
    local_bin = os.path.join(script_dir, "speedtest")
    if os.path.exists(local_bin):
        return local_bin
    return None


def run_speedtest(speedtest_cmd, max_retries=3, retry_delay=5):
    import time
    cmd = [speedtest_cmd, "--format=json", "--accept-license", "--accept-gdpr"]
    
    for attempt in range(1, max_retries + 1):
        log(f"Speedtest CLI を実行中 (試行 {attempt}/{max_retries}): {' '.join(cmd)}")
        try:
            res = subprocess.run(cmd, capture_output=True, text=True, check=True, encoding="utf-8", errors="replace")
            output = res.stdout

            # ライセンス文等のノイズ行をスキップし、有効な結果 JSON を抽出
            for line in output.splitlines():
                line_s = line.strip()
                if line_s.startswith("{") and ('"type":"result"' in line_s or '"type": "result"' in line_s):
                    data = json.loads(line_s)
                    return data, line_s

            log("有効な結果 JSON が見つかりませんでした。再試行します...", "WARN")
        except subprocess.CalledProcessError as e:
            err_msg = e.stderr.strip() if e.stderr else str(e)
            log(f"Speedtest CLI エラー (試行 {attempt}/{max_retries}): {err_msg}", "WARN")
        except Exception as e:
            log(f"予期しないエラー (試行 {attempt}/{max_retries}): {e}", "WARN")

        if attempt < max_retries:
            time.sleep(retry_delay)

    log("最大試行回数を超過しました。計測を中止します。", "ERROR")
    sys.exit(1)


def get_zabbix_agent_conf_settings(custom_path=None):
    candidates = []
    if custom_path:
        candidates.append(custom_path)
    if sys.platform == "win32":
        candidates.extend([
            r"C:\Program Files\Zabbix Agent\zabbix_agentd.conf",
            r"C:\Program Files\Zabbix Agent 2\zabbix_agent2.conf",
            r"C:\zabbix\zabbix_agentd.conf",
            r"C:\zabbix_agentd.conf",
        ])
    else:
        candidates.extend([
            "/etc/zabbix/zabbix_agentd.conf",
            "/etc/zabbix/zabbix_agent2.conf",
            "/usr/local/etc/zabbix_agentd.conf",
        ])

    for p in candidates:
        if os.path.isfile(p):
            server = None
            port = None
            hostname = None
            try:
                with open(p, "r", encoding="utf-8", errors="replace") as f:
                    for line in f:
                        line = line.strip()
                        if line.startswith("#") or not line:
                            continue
                        if line.startswith("ServerActive=") or line.startswith("Server="):
                            is_active = line.startswith("ServerActive=")
                            if not server or is_active:
                                val = line.split("=", 1)[1].strip()
                                first = val.split(",")[0].strip()
                                if ":" in first:
                                    s_ip, s_port = first.split(":", 1)
                                    server = s_ip.strip()
                                    if s_port.strip().isdigit():
                                        port = int(s_port.strip())
                                else:
                                    server = first
                        if line.startswith("Hostname="):
                            val = line.split("=", 1)[1].strip()
                            hostname = val.split(",")[0].strip()
                if server or hostname:
                    return {"path": p, "server": server, "port": port, "hostname": hostname}
            except Exception:
                pass
    return None


def main():
    parser = argparse.ArgumentParser(description="Ookla Speedtest to Zabbix (Python)")
    parser.add_argument("--config", "-c", default=None, help="Zabbix Agent 設定ファイルのパス (自動検出も可能)")
    parser.add_argument("--server", "-z", default=None, help="Zabbix サーバー IP またはホスト名")
    parser.add_argument("--port", "-p", type=int, default=None, help="Zabbix トラッパーポート (デフォルト: 10051)")
    parser.add_argument("--host", "-s", default=None, help="Zabbix 上の登録ホスト名 (未指定時は conf -> デバイス名 -> SpeedtestHost)")
    parser.add_argument("--prefix", "-k", default="speedtest", help="アイテムキープレフィックス (デフォルト: speedtest)")
    parser.add_argument("--speedtest-path", default=None, help="speedtest コマンドのパス")
    parser.add_argument("--dry-run", action="store_true", help="Zabbix への送信を行わず結果を表示")
    args = parser.parse_args()

    # Zabbix Agent 設定ファイルからの自動解決
    conf_settings = get_zabbix_agent_conf_settings(args.config)
    
    server = args.server
    port = args.port or 10051
    host = args.host

    if not server:
        if conf_settings and conf_settings.get("server"):
            server = conf_settings["server"]
            if not args.port and conf_settings.get("port"):
                port = conf_settings["port"]
            log(f"Zabbix Agent 設定ファイル ({conf_settings['path']}) からサーバー ({server}) を検出しました。")
        else:
            server = os.getenv("ZABBIX_SERVER", "127.0.0.1")

    # ホスト名の決定 (第1優先: 引数 -> 第2優先: zabbix_agentd.conf -> 第3優先: デバイス名 -> 第4優先: SpeedtestHost)
    if not host:
        if conf_settings and conf_settings.get("hostname"):
            host = conf_settings["hostname"]
            log(f"Zabbix Agent 設定ファイルからホスト名 ({host}) を検出しました。")
        else:
            try:
                import socket
                device_host = socket.gethostname()
            except Exception:
                device_host = None
            if device_host:
                host = device_host
                log(f"デバイスのマシン名 ({host}) をホスト名として採用しました。")
            else:
                host = "SpeedtestHost"
                log(f"フォールバックホスト名 ({host}) を採用しました。")

    # 1. zabbix_utils の確認 (DryRun 以外)
    Sender = None
    ItemValue = None
    if not args.dry_run:
        Sender, ItemValue = check_zabbix_utils()

    # 2. speedtest コマンドの探索
    cmd = find_speedtest_cmd(args.speedtest_path)
    if not cmd:
        log("speedtest CLI が見つかりません。", "ERROR")
        log("公式ダウンロードサイトからダウンロードして PATH を通すか、同じディレクトリに配置してください:", "ERROR")
        log("  https://www.speedtest.net/ja/apps/cli", "ERROR")
        sys.exit(1)

    # 3. 計測実行
    data, raw_json = run_speedtest(cmd)

    # 4. メトリクス抽出
    download_bps = round(float(data["download"]["bandwidth"]) * 8)
    download_mbps = round(download_bps / 1_000_000, 2)
    upload_bps = round(float(data["upload"]["bandwidth"]) * 8)
    upload_mbps = round(upload_bps / 1_000_000, 2)
    ping_latency = round(float(data["ping"]["latency"]), 3)
    ping_jitter = round(float(data["ping"]["jitter"]), 3)
    packet_loss = round(float(data.get("packetLoss", 0.0) or 0.0), 2)

    server_name = data.get("server", {}).get("name", "")
    server_location = data.get("server", {}).get("location", "")
    server_id = data.get("server", {}).get("id", "")
    result_url = data.get("result", {}).get("url", "")

    log("計測完了:")
    log(f"  Server   : {server_name} ({server_location}) [ID: {server_id}]")
    log(f"  Ping     : {ping_latency} ms (Jitter: {ping_jitter} ms)")
    log(f"  Download : {download_mbps} Mbps ({download_bps} bps)")
    log(f"  Upload   : {upload_mbps} Mbps ({upload_bps} bps)")
    log(f"  Loss     : {packet_loss} %")
    log(f"  URL      : {result_url}")

    # 5. 送信データの生成 (Zabbix テンプレートのマスターアイテム speedtest.json 1件に統一)
    master_key = f"{prefix}.json"

    # 6. 送信 / DryRun
    if args.dry_run:
        log("[DryRun] Zabbix への送信はスキップされました。")
        log(f"[DryRun] 送信対象マスターアイテム: {master_key}")
        print(f"  Host: {host} | Key: {master_key} | Payload: [RAW JSON {len(raw_json)} 文字]")
        log("[DryRun] テンプレート側の DEPENDENT アイテム (JSONPATH) により全メトリクスが Zabbix 上で自動展開・計算されます。")
        return

    # zabbix_utils で送信 (マスターアイテム 1件)
    sender = Sender(server=server, port=port)
    packet = [ItemValue(host, master_key, raw_json)]

    log(f"Zabbix サーバー ({server}:{port}) へ計測結果 ({master_key}) を送信中 (Python / zabbix_utils)...")
    try:
        response = sender.send(packet)
        log(f"Zabbix サーバー応答: processed: {response.processed}; failed: {response.failed}; total: {response.total}; time: {response.time}")
        if response.failed > 0 and response.processed > 0:
            log(f"一部のメトリクスが送信されました (成功: {response.processed} 件, 未登録: {response.failed} 件)。", "INFO")
        elif response.failed > 0 and response.processed == 0:
            log(f"全アイテムの送信に失敗しました (成功: 0 件, 失敗: {response.failed} 件)。ホスト名やキー設定を確認してください。", "WARN")
        else:
            log(f"全メトリクスが正常に送信されました (成功: {response.processed} 件)。", "INFO")
    except Exception as e:
        log(f"Zabbix 送信中にエラーが発生しました: {e}", "ERROR")
        sys.exit(1)


if __name__ == "__main__":
    main()
