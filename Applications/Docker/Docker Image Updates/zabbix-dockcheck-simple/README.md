## Installing
This is the installation readme for zabbix-dockcheck-simple, which shows the updates in Zabbix like this: "2 Docker Image updates on host-xyz".

### On all hosts you want to monitor:    
* Install and configure package zabbix-agent2 (if not installed):  
     ```sh
     apt-get install zabbix-agent2
     ```
* add the user "zabbix" to the "docker" group, so zabbix has access to docker:
     ```sh
     usermod -aG docker zabbix
     ```
* download "dockcheck.sh" from dockcheck repository to new directory `/etc/zabbix/scripts/` and change permission:  
     ```sh
     mkdir /etc/zabbix/scripts
     curl -L https://raw.githubusercontent.com/mag37/dockcheck/main/dockcheck.sh -o /etc/zabbix/scripts/dockcheck.sh
     chown zabbix:zabbix /etc/zabbix/scripts/dockcheck.sh && chmod 0755 /etc/zabbix/scripts/dockcheck.sh
     ```
* run "dockcheck.sh" to install regctl:  
     ```sh
     bash /etc/zabbix/scripts/dockcheck.sh -n
     # Confirm with "y":   
     Required dependency 'regctl' missing, do you want it downloaded? y/[n] y  
     chown zabbix:zabbix dockcheck.sh && chmod 0755 /etc/zabbix/scripts/regctl
     ```
* add "dockcheck.conf" to /etc/zabbix/zabbix_agent2.d/:  
     ```sh
     curl -L https://raw.githubusercontent.com/thetorminal/zabbix-docker-image-updates/refs/heads/main/zabbix-dockcheck-simple/dockcheck.conf -o /etc/zabbix/zabbix_agent2.d/dockcheck.conf
     ```
* restart zabbix-agent2
     ```sh
     systemctl restart zabbix-agent2
     ```

#### If you want to install it with ansible:  
* run the playbook `ansible-zabbix-dockcheck.yml` on host(s) you want to monitor docker on.  

### On Zabbix frontend server:  
- Download and import the template `docker-image-update.yaml`  
- Assign the `Template Docker Image Updates'` to the docker host(s) you want to monitor  



