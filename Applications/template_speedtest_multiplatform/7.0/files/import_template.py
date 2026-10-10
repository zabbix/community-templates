#!/usr/bin/env python3
"""
Zabbix API を使用して Speedtest.yaml テンプレートをインポート・登録するスクリプト。
標準ライブラリ (urllib, json) のみで動作し、追加パッケージのインストールは不要です。
"""

import sys
sys.stdout.reconfigure(encoding='utf-8')

import argparse
import json
import os
import random
import urllib.request
import urllib.error
from datetime import datetime
from pathlib import Path


def log(msg: str, level: str = "INFO"):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"[{timestamp}] [{level}] {msg}")


def invoke_zabbix_api(api_url: str, token: str, method: str, params: dict):
    payload = {
        "jsonrpc": "2.0",
        "method": method,
        "params": params,
        "auth": token,
        "id": random.randint(1, 99999),
    }
    data = json.dumps(payload).encode("utf-8")
    headers = {
        "Content-Type": "application/json-rpc",
        "Authorization": f"Bearer {token}",
    }
    req = urllib.request.Request(api_url, data=data, headers=headers, method="POST")
    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            res_json = json.loads(resp.read().decode("utf-8"))
            if "error" in res_json:
                err = res_json["error"]
                log(f"API エラー ({method}): {err.get('message')} - {err.get('data')}", "ERROR")
                return None
            return res_json.get("result")
    except urllib.error.HTTPError as e:
        log(f"HTTP エラー ({method}): {e.code} {e.reason}", "ERROR")
        return None
    except Exception as e:
        log(f"通信エラー ({method}): {e}", "ERROR")
        return None


def main():
    parser = argparse.ArgumentParser(description="Zabbix API Template Importer")
    parser.add_argument("--url", "-u", required=True, help="Zabbix Web URL (例: http://192.168.1.10/zabbix)")
    parser.add_argument("--token", "-t", required=True, help="Zabbix API Token")
    parser.add_argument("--template", "-f", default="", help="Speedtest.yaml のパス")
    parser.add_argument("--link-host", "-s", default="", help="テンプレートをリンクする監視ホスト名")

    args = parser.parse_args()

    # 1. テンプレートファイル
    template_path = args.template
    if not template_path:
        cand1 = Path(__file__).parent / "Speedtest.yaml"
        cand2 = Path(__file__).parent.parent / "template_speedtest_multiplatform.yaml"
        if cand1.is_file():
            template_path = str(cand1)
        elif cand2.is_file():
            template_path = str(cand2)
        else:
            template_path = str(cand1)

    if not os.path.isfile(template_path):
        log(f"テンプレートファイルが見つかりません: {template_path}", "ERROR")
        sys.exit(1)

    try:
        with open(template_path, "r", encoding="utf-8") as f:
            yaml_content = f.read()
    except Exception as e:
        log(f"テンプレート読み込みエラー: {e}", "ERROR")
        sys.exit(1)

    # 2. URL の整形
    url = args.url.strip().rstrip("/")
    if not url.endswith("api_jsonrpc.php"):
        api_url = f"{url}/api_jsonrpc.php"
    else:
        api_url = url

    log(f"Zabbix API エンドポイント: {api_url}", "INFO")

    # 3. configuration.import
    log(f"テンプレート ({template_path}) をインポート中...", "INFO")
    import_rules = {
        "templates": {"createMissing": True, "updateExisting": True},
        "items": {"createMissing": True, "updateExisting": True},
        "triggers": {"createMissing": True, "updateExisting": True},
        "graphs": {"createMissing": True, "updateExisting": True},
        "template_groups": {"createMissing": True, "updateExisting": True},
        "templateDashboards": {"createMissing": True, "updateExisting": True},
    }

    result = invoke_zabbix_api(api_url, args.token, "configuration.import", {
        "format": "yaml",
        "source": yaml_content,
        "rules": import_rules,
    })

    if not result:
        log("テンプレートのインポートに失敗しました。", "ERROR")
        sys.exit(1)

    log("テンプレートのインポートが正常に完了しました！", "INFO")

    # 4. ホストへのリンク
    if args.link_host:
        log(f"ホスト '{args.link_host}' へのテンプレートリンクを確認中...", "INFO")

        # テンプレート ID の取得
        templates = invoke_zabbix_api(api_url, args.token, "template.get", {
            "filter": {"host": ["template_speedtest_multiplatform"]},
        })
        if not templates:
            templates = invoke_zabbix_api(api_url, args.token, "template.get", {
                "filter": {"host": ["Speedtest（Ookla CLI）"]},
            })
        if not templates:
            templates = invoke_zabbix_api(api_url, args.token, "template.get", {
                "search": {"name": "Speedtest"},
            })

        if not templates:
            log("インポートされた Speedtest テンプレート ID を特定できませんでした。", "WARN")
            return

        speedtest_template_id = templates[0]["templateid"]

        hosts = invoke_zabbix_api(api_url, args.token, "host.get", {
            "filter": {"host": [args.link_host]},
            "selectParentTemplates": ["templateid", "name"],
        })

        if not hosts:
            log(f"ホスト '{args.link_host}' が存在しないため、host.create で自動新規作成します...", "INFO")
            
            # ホストグループの取得
            host_groups = invoke_zabbix_api(api_url, args.token, "hostgroup.get", {
                "output": ["groupid", "name"],
            })

            target_group_id = None
            if host_groups:
                for g in host_groups:
                    if g.get("name") in ["Discovered hosts", "Linux servers", "Zabbix servers", "General"]:
                        target_group_id = g["groupid"]
                        break
                if not target_group_id:
                    target_group_id = host_groups[0]["groupid"]
            else:
                create_grp = invoke_zabbix_api(api_url, args.token, "hostgroup.create", {
                    "name": "Discovered hosts",
                })
                if create_grp and create_grp.get("groupids"):
                    target_group_id = create_grp["groupids"][0]

            if not target_group_id:
                log("ホストグループの取得に失敗したため、ホストを自動作成できませんでした。Web UI 上で手動作成してください。", "WARN")
                return

            # host.create の実行
            create_host_params = {
                "host": args.link_host,
                "interfaces": [
                    {
                        "type": 1,
                        "main": 1,
                        "useip": 1,
                        "ip": "127.0.0.1",
                        "dns": "",
                        "port": "10050",
                    }
                ],
                "groups": [
                    {"groupid": target_group_id}
                ],
                "templates": [
                    {"templateid": speedtest_template_id}
                ],
            }

            created_host = invoke_zabbix_api(api_url, args.token, "host.create", create_host_params)
            if created_host and created_host.get("hostids"):
                log(f"ホスト '{args.link_host}' を自動新規作成し、Speedtest テンプレートを正常にリンクしました！", "INFO")
            else:
                log(f"ホスト '{args.link_host}' の自動作成に失敗しました。", "WARN")
        else:
            target_host = hosts[0]
            host_id = target_host["hostid"]

            already_linked = False
            current_templates = []
            for t in target_host.get("parentTemplates", []):
                current_templates.append({"templateid": t["templateid"]})
                if t["templateid"] == speedtest_template_id:
                    already_linked = True

            if already_linked:
                log(f"ホスト '{args.link_host}' には既に Speedtest テンプレートがリンクされています。", "INFO")
            else:
                current_templates.append({"templateid": speedtest_template_id})
                up_res = invoke_zabbix_api(api_url, args.token, "host.update", {
                    "hostid": host_id,
                    "templates": current_templates,
                })
                if up_res:
                    log(f"既存ホスト '{args.link_host}' に Speedtest テンプレートを正常にリンクしました！", "INFO")
                else:
                    log("ホストへのテンプレートリンクに失敗しました。", "WARN")


if __name__ == "__main__":
    main()
