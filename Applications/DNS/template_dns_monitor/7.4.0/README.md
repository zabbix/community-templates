# Zabbix DNS Monitoring Template

Simple Zabbix template for monitoring DNS server performance and availability.

## What it does

- Monitors multiple DNS servers (CloudFlare, Google, Quad9, or your own)
- Tests DNS resolution for your chosen domains
- Tracks response times and alerts when servers are slow or down

## Quick Start

1. **Download**: Get the `template_dns_monitoring.yaml` file
2. **Import**: In Zabbix go to Configuration → Templates → Import
3. **Apply**: Add the "DNS Monitoring" template to any host
4. **Configure**: Edit the "DNS Target Configuration" item to set your DNS servers and domains

## Configuration

**This is the most important part!** You need to tell the template which DNS servers and domains to monitor.

### How to Find the Configuration

1. Go to **Configuration** → **Templates** in Zabbix
2. Find "DNS Monitoring" template and click on it
3. Click the **Items** tab
4. Look for an item called **"DNS Target Configuration"** and click on it
5. In the item details, find the **"Script"** field - this contains your configuration

### How to Edit the Configuration

In the Script field, you'll see JavaScript code. Look for the `config` array and modify it:

```javascript
var config = [
    {
        "{#SERVER}": "1.1.1.1",
        "{#SERVERNAME}": "CloudFlare", 
        "{#DOMAINS}": ["example.com", "google.com"]
    },
    {
        "{#SERVER}": "8.8.8.8",
        "{#SERVERNAME}": "Google",
        "{#DOMAINS}": ["example.com", "google.com"]
    }
];
```

### What Each Part Means

- **`{#SERVER}`** - The IP address of the DNS server you want to test
- **`{#SERVERNAME}`** - A friendly name for the server (shows up in alerts)
- **`{#DOMAINS}`** - List of websites to test DNS resolution for

### Examples

**Monitor your company's internal DNS:**
```javascript
var config = [
    {
        "{#SERVER}": "192.168.1.10",
        "{#SERVERNAME}": "Company DNS", 
        "{#DOMAINS}": ["intranet.company.com", "mail.company.com"]
    }
];
```

**Monitor multiple public DNS servers:**
```javascript
var config = [
    {
        "{#SERVER}": "1.1.1.1",
        "{#SERVERNAME}": "CloudFlare", 
        "{#DOMAINS}": ["google.com", "github.com"]
    },
    {
        "{#SERVER}": "8.8.8.8",
        "{#SERVERNAME}": "Google", 
        "{#DOMAINS}": ["google.com", "github.com"]
    },
    {
        "{#SERVER}": "9.9.9.9",
        "{#SERVERNAME}": "Quad9", 
        "{#DOMAINS}": ["google.com", "github.com"]
    }
];
```

**Important:** Only change the `config` array - don't modify the JavaScript code below it!

## Requirements

- Zabbix 7.4+

## License

MIT License - use it however you want!