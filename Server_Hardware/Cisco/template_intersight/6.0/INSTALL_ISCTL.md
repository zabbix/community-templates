# Installing isctl

Follow the [Getting Started guide](https://isctl.netlify.app/) on isctl homepage and run the test, **don't continue** if you don't get a sensible output!

isctl downloads are available from GitHub page - https://github.com/cgascoig/isctl

I fetched the file for Linux on the releases page - https://github.com/cgascoig/isctl/releases/latest

**On my Zabbix Server I did (Subject to change with new versions):** 

wget https://github.com/cgascoig/isctl/releases/download/v0.1.15/isctl_0.1.15_Linux_x86_64.tar.gz


## Continue here - after you completed the Getting Started Guide !!!

<u>It is Zabbix that executes isctl when communicating with Intersight API so extra steps are required;</u>

* **Copy isctl binary to Zabbix ExternalScripts library (Validate location in /etc/zabbix/zabbix_server.conf):** cp /usr/local/bin/isctl /usr/lib/zabbix/externalscripts/isctl
* **Make isctl world executable:** chmod 755 /usr/lib/zabbix/externalscripts/isctl
* When you ran "isctl configure" as part of the getting started guide, it produced a hidden settingsfiles in your HomeDir
* **Create a HomeDir for Zabbix user, find the HomeDir with command:** cat /etc/passwd | grep zabbix
* In my case (Debian) the HomeDir is /var/lib/zabbix - but it didn't exist
* **Create Zabbix user HomeDir if folder doesn't exist:** mkdir /var/lib/zabbix
* **Copy the .isctl.yaml file to Zabbix user HomeDir:** - cp ~/.isctl.yaml /var/lib/zabbix
* **Copy the Intersight Secret key (The file you placed on the Desktop) to Zabbix HomeDir**
* **Change Ownership to Zabbix User on HomeDir and isctl:** chown --recursive zabbix:zabbix /var/lib/zabbix
* Modify the isctl so that it always outputs JSON



## Replay of my fresh isctl install and configure on Zabbix server:
```
wget https://github.com/cgascoig/isctl/releases/download/v0.1.15/isctl_0.1.15_Linux_x86_64.tar.gz

tar zxvf isctl_0.1.15_Linux_x86_64.tar.gz

cp isctl /usr/lib/zabbix/externalscripts/isctl

chmod 755 /usr/lib/zabbix/externalscripts/isctl

mkdir /var/lib/zabbix

isctl configure

vi .isctl.yaml (modified output from default to json)

cp .isctl.yaml /var/lib/zabbix

chown --recursive zabbix:zabbix /var/lib/zabbix
```


## My copy of .isctl.yaml looks like this:
```
root@zabbix:~# cat /var/lib/zabbix/.isctl.yaml
keyfile: ~/secret.key
keyid: 5992d7bc3e9520000163a857/5f31221b7564612d33337ea7/62b57e0d7564612d33867bd5
output: json
server: intersight.com
```


## Content of my Zabbix User HomeDir:  
```
root@zabbix:~# ls -la /var/lib/zabbix/
drwxr-xr-x  2 root root 4096 Jun 27 14:43 .
drwxr-xr-x 30 root root 4096 Jun 27 14:30 ..
-rw-r--r--  1 root root  144 Jun 27 14:43 .isctl.yaml
-rw-r--r--  1 root root 1679 Jun 27 14:43 secret.key
```


## Now cd to /var/lib/zabbix, run a test command and if it outputs JSON - Zabbix template will work  

root@zabbix:/var/lib/zabbix# **isctl get compute blade**```
[
  {
    "AccountMoid": "5992d7bc3e9520000103a857",
    "Adapters": [
      {
        "ClassId": "mo.MoRef",
        "Moid": "59a9d24f103b8800017f971c",
        "ObjectType": "adapter.Unit",
        "link": "https://www.intersight.com/api/v1/adapter/Units/59a9d24f103b8800017f971c"
      }
    ],
    "AdminPowerState": "policy",
    "AlarmSummary": {
      "ClassId": "compute.AlarmSummary",
      "Critical": 1,
      "ObjectType": "compute.AlarmSummary",
      "Warning": 0
    },
    "Alerts": [],
    "Ancestors": [
      {
        "ClassId": "mo.MoRef",
        "Moid": "5a2bb41d29378e0001a20e43",
        "ObjectType": "equipment.Chassis",
        "link": "https://www.intersight.com/api/v1/equipment/Chasses/5a2bb41d29378e0001a20e43"
      }
    ],
    "AssetTag": "",
    "AvailableMemory": 131072,
    "BiosBootmode": null,
    "BiosPostComplete": false,
    "BiosTokenSettings": null,
    "BiosUnits": [
      {
        "ClassId": "mo.MoRef",
        "Moid": "5a6013c57439363364eadff5",
        "ObjectType": "bios.Unit",
        "link": "https://www.intersight.com/api/v1/bios/Units/5a6013c57439363364eadff5"
      }
    ],``` ..............   this is longer than Star Wars intro


