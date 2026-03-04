# AWS VPN by HTTP — Zabbix Template

A custom-built Zabbix template for monitoring AWS Site-to-Site VPN Tunnels using the HTTP Agent.  
This template uses a simple HTTPS endpoint (AWS API) that returns VPN status in JSON format.

Supports Zabbix **6.4 / 7.0 / 8.0**.

---

## 🚀 Features

- Monitors AWS VPN connection state  
- Checks Tunnel 1 and Tunnel 2 states (UP/DOWN)  
- Supports Access Key authentication or IAM Role (STS AssumeRole)
- API-based monitoring — no agents required
- Discover VPNs Automatically
- Trigger-based alerts for:
  - Tunnel 1 DOWN  
  - Tunnel 2 DOWN  
  - Both tunnels DOWN
  - VPN not available
## How Works ?

It same function as the AWS default template called AWS by HTTP. But here we are monitoring AWS Site-to-Site VPN Tunnels.

## Pre-Requesite
### AWS VPN Read Access
- Create a **VPN Read-only** policy for Zabbix, like below.
- Create an IAM user or **Role-based** access and attach the policy.
  
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeVpnConnections",
                "ec2:DescribeVpnGateways",
                "ec2:DescribeCustomerGateways",
                "ec2:DescribeTransitGateways",
                "ec2:DescribeTransitGatewayAttachments",
                "ec2:DescribeTransitGatewayConnects",
                "ec2:DescribeTransitGatewayRouteTables"
            ],
            "Resource": "*"
        }
    ]
}

```
- The below command should show the output.
```
aws ec2 describe-vpn-connections

```

## Installation
### 1. Import Template
```
Zabbix UI → Configuration → Templates → Import
```
Select: AWS VPN by HTTP.yaml
download via wget.
```
wget "https://raw.githubusercontent.com/karthick-dkk/zabbix/main/templates/aws/AWS%20VPN%20by%20HTTP.yaml"

```

### 2. Create a Host

You don’t need any interfaces.
Just create a host with:

Hostname: AWS-VPN-Monitor

Group: Cloud / AWS

### 3. Add the macros shown below.

---
| Macros	| Description |
|-------|-------------|
| **{$AWS.ACCESS.KEY}**	| IAM Access Key ID |
| **{$AWS.SECRET.KEY}** |	IAM Secret Access Key |
| **{$AWS.REGION}**	| AWS Region |
| **{$AWS.ASSUME.ROLE.ARN}** | For Role base acces |
| **{$AWS.AUTH_TYPE}** | Authorization method. Possible values: `access_key`, `assume_role`, `role_base`. |
| **{$AWS.STS.REGION}** | Region used in assume role request |
| **{$AWS.VPN.LLD.FILTER.NAME.MATCHES}** | Filter of discoverable VPNs (default: .*) |
| **{$AWS.VPN.LLD.FILTER.NAME.NOT_MATCHES}** | Filter to exclude discovered VPNs |

---

### 📝 Expected API JSON Format

API must return JSON:

```
[
  {
    "vpnId": "vpn-0963aec172bca9aa3",
    "vpnName": "My-VPN",
    "vpnState": "available",
    "vpnRegion": "ap-south-1",
    "tunnel1": "UP",
    "tunnel2": "DOWN"
  }
]
```

## 📄 Full Blog:

For a full step-by-step explanation of how this template works, check out the detailed Medium article:

👉 **How Can You Build Real-Time AWS VPN Monitoring Using Zabbix (Without CloudWatch)?**  
https://medium.com/devsecops-community/how-can-you-build-real-time-aws-vpn-monitoring-using-zabbix-without-cloudwatch-8c9fba6dc544
