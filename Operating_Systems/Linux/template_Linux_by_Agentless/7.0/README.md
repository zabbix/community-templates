# Template Linux by SSH-Agentless (Zabbix 7.0)

## 📌 Overview
This Zabbix template provides **Agentless monitoring** for Linux servers using SSH, without installing a Zabbix agent.
It is designed for environments where agents are not permitted on Linux hosts.
The template collects key metrics such as CPU usage, memory usage, disk space, OS version, uptime, and more.
Data is gathered through **remote SSH commands** and processed using Zabbix preprocessing rules.

---

## 🔍 Monitored Items

### **System Information**
| Item | Key | Notes |
|------|-----|-------|
| Hostname | `system.hostname` | Extracted from SSH output |
| Host Type | `system.hosttype` | e.g., Virtual or Physical |
| Architecture | `system.arch` | Extracted from uname output |
| Kernel Version | `system.kernel` | OS kernel string |
| OS Version | `system.os.info` | e.g., Ubuntu 22.04 |
| CPU Count | `system.cpucount` | Number of CPUs |
| Uptime | `system.uptime` | Human-readable uptime |

### **CPU**
| Item | Key | Type |
|------|-----|------|
| CPU Idle % | `system.cpu.idle` | Dependent |
| CPU User % | `system.cpu.user` | Dependent |
| CPU System % | `system.cpu.system` | Dependent |
| CPU Nice % | `system.cpu.nice` | Dependent |
| CPU Utilization % | `system.cpu.util` | Calculated from idle |

### **Memory**
| Item | Key | Notes |
|------|-----|-------|
| Total Memory (B) | `system.memory.total` | Converted from KB |
| Used Memory (B) | `system.memory.used` | Converted from KB |
| Free Memory (B) | `system.memory.free` | Converted from KB |
| Available Memory (B) | `system.memory.avail` | Converted from KB |
| Swap Total / Free / Used | `system.swap.total`, `system.swap.free`, `system.memory.swap` | |

### **Load Average**
| Item | Key |
|------|-----|
| Load Avg (1m) | `system.loadavg.1m` |
| Load Avg (5m) | `system.loadavg.5m` |
| Load Avg (15m) | `system.loadavg.15m` |

### **Filesystem – Low Level Discovery (LLD)**
Automatically discovers mounted filesystems and captures:
- Total Size
- Free Size
- Used Size
- Percentage Used

---

## 🚨 Triggers

| Name | Expression | Severity |
|------|------------|----------|
| Host down / SSH failure | `nodata(...,3m)=1` | Disaster |
| High CPU Usage > 70% | `avg(...,5)>{$CPU.UTIL.HIGH}` | Average |
| Critical CPU Usage > 90% | `min(...,10)>{$CPU.UTIL.CRIT}` | High |
| Average Memory Util. > 70% | `avg(...,5)>{$MEM.UTIL.HIGH}` | Average |
| Critical Memory Util. > 85% | `avg(...,5)>{$MEM.UTIL.CRIT}` | High |
| Disk Usage > 80% (per FS) | via LLD | High |
| Disk Usage > 90% (per FS) | via LLD | Disaster |
| High Load per CPU | `avg(loadavg.1m,15m)/cpucount>{$LOAD_AVG_PER_CPU.MAX.WARN}` | Warning |

---

## 📊 Graphs

**Predefined Graphs:**
- CPU Usage (Idle, Nice, System, User)
- Load Average (1m, 5m, 15m)
- Memory Usage (Total, Free, Available)
- Memory Utilization %
- Disk Utilization Graph (per FS - LLD)
- Disk Utilization Pie (per FS - LLD)

---

## 📈 Dashboard

The template includes a **Dashboard** named `Agentless Dashboard` with:
- Host list with CPU, memory, uptime, OS, Kernel data
- CPU and Memory trend graphs
- Per host details like load average, total CPU/memory
- Problems Widget

---

## ⚙ How Data is Collected

- **SSH External Checks**  
  Uses `ssh-get[{HOST.HOST},{$SSHUSER},{$SSHPORT},{$SSHJUMP},"{$SSHCOMMAND}"]`
  
- **Commands Executed via SSH**  
  Default command (`{$SSHCOMMAND}`):  


## 📋 How to Import the Template
---
Pre-Requesite: 
Client Machine Required packages: 
```bash
sudo apt install sysstat
```

### **Step 1: Clone the Repository**
```bash
git clone https://github.com/karthick-dkk/zabbix.git
```

---

### **Step 2: Copy the Script to Zabbix External Scripts Directory**
```bash
cd zabbix/templates/linux
sudo cp ssh-get /usr/lib/zabbix/externalscripts/
sudo chmod +x /usr/lib/zabbix/externalscripts/ssh-get
```

---

### **Step 3: Import Template from Zabbix UI**
1. Login to **Zabbix 7.0 UI**.
2. Go to **Configuration → Templates → Import**.
3. Import the template from:
   - File: `zabbix/templates/linux/Template Linux by Agentless.yaml`
   - Direct link:  
     [Template Linux by Agentless.yaml](https://raw.githubusercontent.com/karthick-dkk/zabbix/refs/heads/main/templates/linux/Template%20Linux%20by%20Agentless.yaml)

---

## 📌 Notes
- Make sure `/usr/lib/zabbix/externalscripts/` exists and is readable by the Zabbix server process.
- Ensure the script has execution permission (`chmod +x`).
- SSH keys or credentials should be configured to allow the Zabbix server to connect to the target hosts.

---
