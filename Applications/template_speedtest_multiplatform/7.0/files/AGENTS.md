# AI Agent Setup Guide (Speedtest to Zabbix)

This document defines the automated setup protocol for AI coding assistants (Antigravity, Cursor, Claude Code, GitHub Copilot, Devin, etc.).

When the user asks to **"set up"**, **"configure"**, **"install"**, or **"セットアップして"**, do NOT guess or make random changes. Strictly follow this step-by-step interview protocol.

---

## Language Policy

- **Adapt to the User's Language Automatically**:
  - If the user interacts in **Japanese** (e.g., 「セットアップして」「設定して」), conduct the interview, questions, and guides in **Japanese**.
  - If the user interacts in **English** (e.g., "Set up this repo", "Configure Zabbix"), conduct the interview in **English**.
  - For any other language, respond in the user's preferred language.

---

## Interactive Setup Protocol

### Step 1: Silent Pre-Inspection (Run quietly before asking the user)
Inspect the host environment without disturbing the user:
1. **OS Detection**: Identify whether the system is Windows or Linux.
2. **Zabbix Agent Configuration**:
   - Check standard paths for `zabbix_agentd.conf` or `zabbix_agent2.conf`:
     - **Windows**: `%ProgramFiles%\Zabbix Agent\zabbix_agentd.conf`, `%ProgramFiles%\Zabbix Agent 2\zabbix_agent2.conf`, `C:\zabbix\zabbix_agentd.conf`
     - **Linux**: `/etc/zabbix/zabbix_agentd.conf`, `/etc/zabbix/zabbix_agent2.conf`, `/usr/local/etc/zabbix_agentd.conf`
   - If found, extract `ServerActive` (preferred) or `Server`, and `Hostname`.
   - *Note: If a server address is found in the agent config, do NOT ask the user for the server address.*
3. **Ookla Speedtest CLI Presence**:
   - Check if `speedtest.exe` (Windows) or `speedtest` (Linux) exists in the repository folder or on the system `PATH`.

---

### Step 2: Minimal User Interview (Ask only missing info)
Ask concise, numbered questions based on Step 1 findings:

1. **Target Zabbix Server Address**:
   - *(Ask ONLY if no Zabbix Agent config was found in Step 1)*
   - **EN**: "Please provide your target Zabbix Server IP or hostname (Default: `127.0.0.1`):"
   - **JA**: 「送信先 Zabbix サーバーの IP またはホスト名を教えてください（デフォルト: `127.0.0.1`）:」
2. **Monitored Hostname**:
   - Explain the 4-tier resolution priority:
     1. User-specified argument
     2. `zabbix_agentd.conf` `Hostname`
     3. Device hostname (Windows computer name / Linux hostname)
     4. Fallback: `SpeedtestHost`
   - **EN**: "Would you like to specify a custom host name for Zabbix, or use the auto-detected device name?"
   - **JA**: 「Zabbix に登録するホスト名を個別に指定しますか？（未指定の場合は、マシンのホスト名が自動採用されます）」
3. **Recurring Schedule**:
   - **EN**: "How often should Speedtest run? (Recommended: Hourly / Daily at midnight / None):"
   - **JA**: 「回線測定の実行頻度はどれにしますか？（推奨: 1時間ごと / 毎日深夜0時 / スケジューラ登録なし）:」
4. **Automated Template Import via Zabbix API**:
   - **EN**: "Would you like me to automatically import the Zabbix template (`Speedtest.yaml`) and link it to this host via Zabbix API? If yes, please provide your Zabbix Web URL (e.g., `http://192.168.1.10/zabbix`) and API Token."
   - **JA**: 「Zabbix サーバーへのテンプレート（`Speedtest.yaml`）のインポートとホスト紐付けも AI が自動で行いますか？ 自動で行う場合は、Zabbix Web の URL（例: `http://192.168.1.10/zabbix`）と API トークンをお知らせください。」

---

### Step 2-B: Zabbix API Token Guidance (When requested or needed)
If the user asks how to generate an API token, provide these step-by-step instructions:

#### [English Guide]
> **How to create a Zabbix API Token (Zabbix 6.0 / 7.0)**:
> 1. Log in to your Zabbix Web UI.
> 2. Click the **User Settings** (User icon) in the top-right corner (or go to *Administration* -> *API tokens* if you have admin rights).
> 3. Open the **API tokens** tab.
> 4. Click the **Create API token** button in the upper right.
> 5. Fill in the details:
>    - **Name**: e.g., `Speedtest Setup`
>    - **Expires at**: Uncheck for no expiration (or set a temporary date).
> 6. Click **Add**.
> 7. Copy the generated **Auth token** string and provide it here.  
>    *(Note: This token will never be displayed again after closing the window).*

#### [日本語ガイド]
> **Zabbix API トークンの取得手順 (Zabbix 6.0 / 7.0 共通)**:
> 1. Zabbix Web UI にログインします。
> 2. 画面右上の **ユーザー設定アイコン** をクリックします（管理者権限がある場合は左メニューの「管理」→「APIトークン」でも可）。
> 3. タブの中から **「APIトークン (API tokens)」** を選択します。
> 4. 右上の **「APIトークン作成 (Create API token)」** ボタンをクリックします。
> 5. 設定項目を入力します：
>    - **名前**: 任意の名前（例: `Speedtest Setup`）
>    - **有効期限**: チェックを外すと無期限（一時的なセットアップなら任意の日時）
> 6. **「追加 (Add)」** ボタンをクリックします。
> 7. 画面に一度だけ表示される **「認証トークン (Auth token)」** の長い英数字文字列をコピーして教えてください。  
>    *(※この画面を閉じると二度と再表示されないため、コピーを忘れないように注意してください)*

---

### Step 3: Tool Verification & DryRun Test

1. **If Ookla Speedtest CLI is missing (AI Autonomous Action Allowed)**:
   - **AI autonomous installation is strongly encouraged** to achieve a zero-touch experience:
     - **Windows (Automatic Download & Extract)**:
       ```powershell
       # AI can directly download and unpack official binary into repository root:
       Invoke-WebRequest -Uri "https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-win64.zip" -OutFile "ookla-speedtest.zip"
       Expand-Archive -Path "ookla-speedtest.zip" -DestinationPath . -Force
       Remove-Item "ookla-speedtest.zip"
       ```
       *(Alternatively, run `winget install Ookla.Speedtest.CLI --accept-source-agreements --accept-package-agreements`)*
     - **Linux (Package Manager or Tarball)**:
       ```bash
       curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
       sudo apt-get install -y speedtest
       ```
   - If autonomous download fails or is prohibited by policy, guide the user to download `speedtest.exe` manually from [https://www.speedtest.net/apps/cli](https://www.speedtest.net/apps/cli).

2. **Execute DryRun**:
   - Verify that JSON parsing works without sending metrics to Zabbix:
     - **Windows**: `.\speedtest.ps1 -DryRun`
     - **Linux**: `./speedtest_zabbix.sh -d`

---

### Step 4: Execute Setup Command & Host Creation Protocol

> [!IMPORTANT]
> **Host Linking & Creation Protocol (CRITICAL)**:  
> - `import_template.ps1` and `import_template.py` automatically detect whether the target host (`-LinkToHost`) exists on Zabbix.
> - **If the host DOES NOT exist on Zabbix**: The scripts will automatically invoke `host.create` to create a new host with the specified hostname and link the Speedtest template to it.
> - **AI Action Rule**: **NEVER search for or reuse existing unrelated Zabbix hosts** (such as past test hosts or templates). Always use the exact hostname determined in Step 1 / Step 2.

Run the bundled setup wizard based on the user's responses:

#### On Windows:
```powershell
# Basic setup (Hourly recurring task)
.\setup.ps1 -Schedule Hourly

# Full setup with custom parameters & API template import (auto-creates host if missing)
.\setup.ps1 -ZabbixServer "<IP>" -Hostname "<Host>" -Schedule Hourly -ZabbixUrl "<URL>" -ApiToken "<TOKEN>"
```

#### On Linux:
```bash
# Basic setup (Hourly cron job)
./setup.sh -c hourly

# Full setup with custom parameters & API template import (auto-creates host if missing)
./setup.sh -z "<IP>" -s "<Host>" -c hourly -u "<URL>" -t "<TOKEN>"
```

---

### Step 5: Final Completion Report (in user's language)

Confirm and report the results to the user:
1. **Verification**: Confirm that Speedtest execution and JSON metrics parsing succeeded.
2. **Scheduler**: Confirm that the recurring task was successfully registered in Windows Task Scheduler or Linux cron.
3. **Template Status**:
   - If imported via API: Confirm that `Speedtest.yaml` was registered and linked to the host.
   - If manual: Remind the user to import `Speedtest.yaml` via Zabbix Web UI (*Data collection* -> *Templates* -> *Import*).
