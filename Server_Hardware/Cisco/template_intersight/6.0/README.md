# Zabbix Template for Cisco Intersight

## Overview

**A template to monitor Cisco Intersight connected hardware and software**



**So far the template does, automatic discovery of BladeChassis, Blades, Rackservers and Fabric Interconnects**

Items and Triggers on following components:


* HCL Alarms
* Temperature monitoring
* FAN monitoring
* PSU monitoring
* Physical alarms and configuration errors



## How it Works

This template relies on External checks that executes [isctl](https://isctl.netlify.app) - isctl is a CLI tool, to the Cisco Intersight API



## What to do

- Install and configure isctl - [Go to this page to get help on setting up isctl to satisfy Zabbix](https://github.com/mbechc/zabbix-template_cisco-intersight/blob/main/INSTALL_isctl.md)
- Create a dummy host, and link template "Cisco Intersight" to dummy host
- Dummy host interface can be of type "Agent interface" with ipaddress 127.0.0.1 port 0
- To speed up Autodiscover processes, execute the items on dummy host



## The Vision

In the future this template shall support everything Intersight. Depending on the level of Intersight license and add-on products; like Intersight Kubernetes Service (IKS), Intersight Workload Optimizer (IWO), Intersight Cloud Orchestrator (ICO) and much more

Stay tuned

## Author

Morten Bech Christensen - 

Author of isctl - [Chris Gascoigne](https://github.com/cgascoig)

