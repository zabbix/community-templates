# Zabbix docker image update monitoring
Monitoring of docker image updates with Zabbix.  

## Description
Based on “dockcheck” (CLI query to check updates): [Github - dockcheck](https://github.com/mag37/dockcheck/tree/main)  

This template is split into to versions, which you can choose from.

#### zabbix-dockcheck-simple
Shows count of available docker image updates on a host. Example:  
![zabbix-dockcheck-simple](https://github.com/user-attachments/assets/be2d897b-7fc6-40dc-ac12-19c833a6f0ef)

#### zabbix-dockcheck-lld
Shows the name of the container, which needs an image update. Example:  
![zabbix-dockcheck-lld](https://github.com/user-attachments/assets/e9a09a32-fc64-4a62-8153-cf954496a221)

Important: The Docker image version must be specified with :latest (e.g. in a docker-compose file), a fixed version number such as mariadb:10.6 does not work.  

Tested with:  
* Zabbix Server 7.0.5 and 7.2
* zabbix-agent2 (on Debian 12 server)

## Getting Started

### Dependencies
* [dockcheck.sh](https://github.com/mag37/dockcheck/blob/main/dockcheck.sh)
* [regclient/regctl](https://github.com/regclient/regclient) (Licensed under Apache-2.0 License)
* Zabbix-Server with timeouts set up to 30 seconds! (Timeout=30)
* Host with zabbix-agent2 and docker installed

### Installing

The installation guide can be found in each version of the template. Choose the one you prefer from the repository.  
Quicklinks:  
- [zabbix-dockcheck-simple](https://github.com/thetorminal/zabbix-docker-image-updates/tree/main/zabbix-dockcheck-simple)
- [zabbix-dockcheck-lld](https://github.com/thetorminal/zabbix-docker-image-updates/tree/main/zabbix-dockcheck-lld)


## Version History
* 1.1
    * fixed timeout problems in the zabbix-dockcheck-lld with caching on the host (/tmp/dockcheck_cache.txt)
* 1.0
    * split template in two versions, added version which shows the name of the container, which needs an image update (using low level discovery)
* 0.2
    * fixed [#2](https://github.com/thetorminal/zabbix-docker-image-updates/pull/2) (dockcheck changed message from "no updates installed" to "no updates available") 
    * fixed [#2](https://github.com/thetorminal/zabbix-docker-image-updates/pull/2) and [#3](https://github.com/thetorminal/zabbix-docker-image-updates/issues/3) (no updates equaled in an error message in zabbix) 
* 0.1
    * Initial Release

## Acknowledgments
* [Github - dockcheck](https://github.com/mag37/dockcheck/tree/main)
* Disclaimer: This project partitially used LLMs to understand the Zabbix low level discovery and helped building the script
