# Chrony 時刻精度監視 (Zabbix 7.0 日本語版)

## 概要
Zabbix 7.0 LTS 向け Chrony 高精度時刻同期品質・同期サーバー監視テンプレートです。

### 主な特徴
- **マスターアイテム集約**: `chronyc -c tracking` の 1 回実行で全メトリクスを不可分（アトミック）に取得し、エージェント負荷を大幅削減。
- **Chrony 3.x / 4.x ハイブリッド両対応**: JavaScript 前処理による動的カラム数判別（`parts.length >= 14`）により、レガシーな 3.x（13列）から最新の 4.x（14列）まで完全互換。
- **マイクロ秒・ナノ秒自動換算**: AWS EC2（Amazon Time Sync）等の超高精度同期環境でも単位（`ns`/`us`/`ms`/`s`）を自動正規化。
- **全同期サーバー自動検出 (LLD)**: `chronyc sources` からマスターおよび予備サーバーを自動検出し、到達性（Reachability）・遅延・オフセットを個別監視。
- **Zabbix 7.0 最適化ダッシュボード**: 72列フル幅グリッド、整数 Stratum、SVG トレンドグラフを同梱。

## 要件
- Zabbix 7.0 以降
- Zabbix Agent または Zabbix Agent 2
- エージェント設定でリモートコマンドを許可:
  ```ini
  AllowKey=system.run[*]
  ```

## アップストリームリポジトリ
- [qryuu/time-sync-monitoring-to-zabbix](https://github.com/qryuu/time-sync-monitoring-to-zabbix)\n