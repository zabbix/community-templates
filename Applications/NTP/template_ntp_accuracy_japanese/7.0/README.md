# NTP 時刻精度監視 (Zabbix 7.0 日本語版)

## 概要
Zabbix 7.0 LTS 向け NTP (ntpd) 時刻同期精度・全ピア自動検出監視テンプレートです。

### 主な特徴
- **マスターアイテム化**: `ntpq -p` を 1 回取得し、依存アイテムと JSONPath 前処理でアトミックに解析。
- **全ピア自動ディスカバリ (LLD)**: 参照中のマスターサーバーだけでなく、予備サーバーや外れ値ピアの到達性・遅延・オフセット・ジッターを個別監視。
- **リモート外部チェック対応**: アプライアンスやネットワークスイッチをエージェント不要で監視可能。
- **72列集約ダッシュボード**: Zabbix 7.0 のフル幅レイアウトに対応。

## 要件
- Zabbix 7.0 以降
- Zabbix Agent または Zabbix Agent 2
- エージェント設定 (`zabbix_agentd.conf` / `zabbix_agent2.conf`):
  ```ini
  # ローカルデーモン監視用
  AllowKey=system.run[ntpq -p]
  AllowKey=system.run[ntpq -c version]

  # リモート監視用 ({$NTP_IP} の実IPアドレスを指定)
  AllowKey=system.run[ntpq -p <実IP>]
  ```

## アップストリームリポジトリ
- [qryuu/time-sync-monitoring-to-zabbix](https://github.com/qryuu/time-sync-monitoring-to-zabbix)\n