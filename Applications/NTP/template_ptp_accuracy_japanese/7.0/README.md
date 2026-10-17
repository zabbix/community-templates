# PTP (IEEE 1588 / linuxptp) 高精度時刻同期監視 (Zabbix 7.0 日本語版)

## 概要
Zabbix 7.0 LTS 向け PTP (IEEE 1588-2008 / PTPv2) `linuxptp` (`ptp4l`, `phc2sys`, `pmc`) ナノ秒高精度時刻同期監視テンプレートです。

### 主な特徴
- **ナノ秒単位の高精度監視**: グランドマスターとのオフセット (ns) および平均経路遅延 (ns) をハードウェアタイムスタンプ精度で追跡。
- **PMC 一括照会アーキテクチャ**: `pmc` コマンドで `TIME_STATUS_NP`, `CURRENT_DATA_SET`, `PORT_DATA_SET` を一括取得し JSON 変換。
- **デーモン死活監視完備**: `ptp4l` (PTP通信本体) および `phc2sys` (NICクロック $\rightarrow$ システムクロック転写) の双方のプロセス数を監視。
- **状態異常の即時アラート**: グランドマスター喪失 (`gmPresent=false`) やポート状態異常 (`SLAVE`/`MASTER` 以外) を即時検知。

## 要件
- Zabbix 7.0 以降
- `linuxptp` パッケージ (`ptp4l`, `phc2sys`, `pmc`)
- Zabbix Agent でのリモートコマンド許可 (`zabbix_agentd.conf` / `zabbix_agent2.conf`):
  ```ini
  AllowKey=system.run[pmc -u -b 0 'GET TIME_STATUS_NP' 'GET CURRENT_DATA_SET' 'GET PORT_DATA_SET']
  ```
  ※ `UserParameter` で運用する場合は、テンプレート側のアイテムキーを `ptp.pmc.raw[]` に置換してください。

## アップストリームリポジトリ
- [qryuu/time-sync-monitoring-to-zabbix](https://github.com/qryuu/time-sync-monitoring-to-zabbix)\n