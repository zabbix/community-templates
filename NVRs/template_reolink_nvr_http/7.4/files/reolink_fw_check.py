#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
reolink_fw_check.py

Zabbix External Script for Reolink firmware check.

Modo único:
    reolink_fw_check.py "<ZABBIX_HOSTNAME>"

O script:
  1. Lê /etc/zabbix/reolink_fw_check.conf
  2. Consulta a API do Zabbix usando Authorization: Bearer TOKEN
  3. Busca o Inventory do host
  4. Usa inventory.model, inventory.hardware e inventory.software
  5. Faz scraping da página de suporte/download da Reolink
  6. Retorna JSON para itens dependentes no Zabbix

Arquivo de configuração:
    /etc/zabbix/reolink_fw_check.conf

Conteúdo mínimo:
    ZABBIX_URL=https://zbx.exemplo.com/zabbix/api_jsonrpc.php
    ZABBIX_TOKEN=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

Opcional:
    REOLINK_DEFAULT_URL=https://support.reolink.com/c/rln8-410-rln16-410/
"""

import time
import signal
from html.parser import HTMLParser
import json
import re
import sys
import html
import urllib.request
from pathlib import Path
from urllib.error import HTTPError, URLError

CONFIG_FILE = "/etc/zabbix/reolink_fw_check.conf"
DEFAULT_REOLINK_URL = "https://support.reolink.com/c/rln8-410-rln16-410/"


def out(payload, exit_code=0):
    payload.setdefault("status", payload.get("error", "Firmware check incomplete"))
    print(json.dumps(payload, ensure_ascii=False, separators=(",", ":")))
    sys.exit(exit_code)


def base_result(host=None):
    return {
        "host": host,
        "resolved_host": None,
        "hostid": None,
        "model": None,
        "hardware": None,
        "current": None,
        "latest": None,
        "latest_hw_match": None,
        "latest_updated": None,
        "update_available": 0,
        "scrape_ok": 0,
        "match_found": 0,
        "inventory_ok": 0,
        "zabbix_api_ok": 0,
        "source": None,
    }


def load_config(path=CONFIG_FILE):
    cfg = {}
    p = Path(path)
    if not p.exists():
        raise RuntimeError(f"config file not found: {path}")

    for raw in p.read_text(encoding="utf-8", errors="ignore").splitlines():
        line = raw.strip()
        if not line or line.startswith("#"):
            continue
        if "=" not in line:
            continue
        k, v = line.split("=", 1)
        cfg[k.strip()] = v.strip().strip('"').strip("'")

    if not cfg.get("ZABBIX_URL"):
        raise RuntimeError("missing ZABBIX_URL in config")
    if not cfg.get("ZABBIX_TOKEN"):
        raise RuntimeError("missing ZABBIX_TOKEN in config")

    cfg.setdefault("REOLINK_DEFAULT_URL", DEFAULT_REOLINK_URL)
    return cfg


def zabbix_api_call(url, token, method, params):
    payload = {
        "jsonrpc": "2.0",
        "method": method,
        "params": params,
        "id": 1,
    }

    headers = {
        "Content-Type": "application/json-rpc",
        "Authorization": f"Bearer {token}",
    }

    req = urllib.request.Request(
        url=url,
        data=json.dumps(payload).encode("utf-8"),
        headers=headers,
        method="POST",
    )

    try:
        with urllib.request.urlopen(req, timeout=6) as resp:
            body = resp.read().decode("utf-8", errors="ignore")
    except HTTPError as e:
        err_body = e.read().decode("utf-8", errors="ignore")
        raise RuntimeError(f"HTTP {e.code}: {err_body[:500]}") from e
    except URLError as e:
        raise RuntimeError(f"URL error: {e}") from e

    try:
        data = json.loads(body)
    except json.JSONDecodeError as e:
        raise RuntimeError(f"invalid JSON from Zabbix API: {body[:500]}") from e

    if "error" in data:
        raise RuntimeError(f"zabbix api error: {data['error']}")

    return data.get("result")


def normalize(value):
    if value is None:
        return None
    value = str(value).strip()
    return value if value else None


def get_host_inventory(cfg, host_name):
    params = {
        "output": ["hostid", "host", "name", "status"],
        "filter": {
            "host": [host_name]
        },
        "selectInventory": ["model", "hardware", "software", "serialno_a"],
        "limit": 1,
    }

    result = zabbix_api_call(
        cfg["ZABBIX_URL"],
        cfg["ZABBIX_TOKEN"],
        "host.get",
        params,
    )

    if not result:
        raise RuntimeError(f"host not found or token has no permission: {host_name}")

    host = result[0]
    inv = host.get("inventory") or {}

    return {
        "hostid": host.get("hostid"),
        "host": host.get("host"),
        "name": host.get("name"),
        "model": normalize(inv.get("model")),
        "hardware": normalize(inv.get("hardware")),
        "software": normalize(inv.get("software")),
        "serialno_a": normalize(inv.get("serialno_a")),
    }


def firmware_tuple(fw):
    match = re.fullmatch(r"v(\d+)\.(\d+)\.(\d+)\.(\d+)((?:_\d+)+)", fw or "", re.I)
    if not match:
        raise RuntimeError("Unrecognized firmware version: " + str(fw))
    # Firmware build number determines order; suffix formats vary across generations.
    return tuple(int(x) for x in match.groups()[:4])


def hw_matches(page_hw, wanted_hw):
    if not page_hw or not wanted_hw:
        return False

    p = page_hw.strip().lower()
    w = wanted_hw.strip().lower()

    if p == w:
        return True

    parts = re.split(r"\s+or\s+|,|/|\||;", p)
    parts = [x.strip() for x in parts if x.strip()]
    return w in parts


def clean_html(raw):
    raw = re.sub(r"<script.*?</script>", " ", raw, flags=re.I | re.S)
    raw = re.sub(r"<style.*?</style>", " ", raw, flags=re.I | re.S)
    raw = re.sub(r"<[^>]+>", "\n", raw)
    raw = html.unescape(raw)
    lines = [x.strip() for x in raw.splitlines()]
    return [x for x in lines if x]


def build_candidate_urls(model, default_url):
    # Only parse explicit firmware records; never infer associations from nearby text.
    return list(dict.fromkeys([default_url] if default_url else [DEFAULT_REOLINK_URL]))


def fetch_url(url):
    req = urllib.request.Request(
        url,
        headers={
            "User-Agent": "Mozilla/5.0 zabbix-reolink-fw-check/2.0"
        }
    )
    with urllib.request.urlopen(req, timeout=6) as resp:
        return resp.read().decode("utf-8", errors="ignore")


def extract_date(text):
    if not text:
        return None

    patterns = [
        r"(Jan\.?|Feb\.?|Mar\.?|Apr\.?|May|Jun\.?|Jul\.?|Aug\.?|Sep\.?|Oct\.?|Nov\.?|Dec\.?)\s+\d{1,2},\s+\d{4}",
        r"\d{4}-\d{2}-\d{2}",
        r"\d{1,2}/\d{1,2}/\d{4}",
    ]

    for pat in patterns:
        m = re.search(pat, text, flags=re.I)
        if m:
            return m.group(0)
    return None


class FirmwareParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.depth = 0
        self.row = None
        self.field = None
        self.field_depth = None
        self.records = []

    def handle_starttag(self, tag, attrs):
        if tag != "div":
            return
        classes = dict(attrs).get("class", "").split()
        if self.row is None and "single-firmware" in classes:
            self.row = {"product": "", "hardware": "", "firmware": ""}
            self.depth = 1
            return
        if self.row is not None:
            self.depth += 1
            for field in ("product", "hardware", "firmware"):
                if field in classes:
                    self.field, self.field_depth = field, self.depth

    def handle_endtag(self, tag):
        if tag != "div" or self.row is None:
            return
        if self.depth == self.field_depth:
            self.field = self.field_depth = None
        self.depth -= 1
        if self.depth == 0:
            self.records.append({k: v.strip() for k, v in self.row.items()})
            self.row = None

    def handle_data(self, data):
        if self.row is not None and self.field:
            self.row[self.field] += data


def find_latest_firmware(model, hardware, urls):
    records = []
    for url in urls:
        parser = FirmwareParser()
        parser.feed(fetch_url(url))
        records.extend(dict(row, source=url) for row in parser.records)
    if not records:
        raise RuntimeError("Firmware catalog could not be parsed; website format may have changed")
    def model_match(row):
        return re.search(r"(?<![A-Za-z0-9-])" + re.escape(model) + r"(?![A-Za-z0-9-])", row["product"], re.I)
    models = [r for r in records if model_match(r)]
    if not models:
        return None, "Model not found: " + model
    hardware_rows = [r for r in models if hw_matches(r["hardware"], hardware)]
    if not hardware_rows:
        return None, "Hardware type not found: " + hardware + " (model " + model + ")"
    candidates = []
    for row in hardware_rows:
        try:
            firmware_tuple(row["firmware"])
            candidates.append(row)
        except RuntimeError:
            pass
    if not candidates:
        return None, "Firmware not found for model " + model + " / hardware " + hardware
    latest = max(candidates, key=lambda row: firmware_tuple(row["firmware"]))
    return dict(latest, updated=None), None


def deadline(signum, frame):
    raise RuntimeError("Firmware check exceeded its 25-second execution limit")


def main():
    if len(sys.argv) != 2:
        out({
            "error": 'usage: reolink_fw_check.py "<ZABBIX_HOSTNAME>"',
            "scrape_ok": 0,
            "match_found": 0,
            "inventory_ok": 0,
            "zabbix_api_ok": 0,
            "update_available": 0,
        })

    signal.signal(signal.SIGALRM, deadline)
    signal.alarm(25)
    requested_host = sys.argv[1].strip()
    result = base_result(requested_host)

    try:
        cfg = load_config()
    except Exception as e:
        result["error"] = str(e)
        out(result)

    try:
        inv = get_host_inventory(cfg, requested_host)
        result["zabbix_api_ok"] = 1
        result["hostid"] = inv["hostid"]
        result["resolved_host"] = inv["host"]
        result["model"] = inv["model"]
        result["hardware"] = inv["hardware"]
        result["current"] = inv["software"]
    except Exception as e:
        result["error"] = str(e)
        out(result)

    if result["model"] and result["hardware"] and result["current"]:
        result["inventory_ok"] = 1
    else:
        missing = []
        if not result["model"]:
            missing.append("inventory.model")
        if not result["hardware"]:
            missing.append("inventory.hardware")
        if not result["current"]:
            missing.append("inventory.software")
        result["error"] = "missing inventory fields: " + ", ".join(missing)
        out(result)

    urls = build_candidate_urls(result["model"], cfg.get("REOLINK_DEFAULT_URL"))
    result["source"] = urls[0] if urls else None

    try:
        latest, message = find_latest_firmware(result["model"], result["hardware"], urls)
        result["scrape_ok"] = 1
    except Exception as e:
        result["error"] = str(e)
        out(result)

    if not latest:
        result["status"] = message
        out(result)

    result["latest"] = latest.get("firmware")
    result["latest_hw_match"] = latest.get("hardware")
    result["latest_updated"] = latest.get("updated")
    result["source"] = latest.get("source")
    result["match_found"] = 1
    try:
        result["update_available"] = int(firmware_tuple(result["latest"]) > firmware_tuple(result["current"]))
    except RuntimeError as e:
        result["error"] = str(e)
        out(result)
    result["status"] = "Firmware update available: " + result["latest"] if result["update_available"] else "Firmware is up to date"


    out(result)


if __name__ == "__main__":
    main()