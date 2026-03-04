#### INSTALACJA ####

1. Kopiujemy do folderu Zabbix Agent folder scripts ze skryptem powershell
2. ## Do pliku zabbix_agent2.conf bądź zabbix_agent.conf ( w zależności której wersji używamy) należy dodać poniższy wpis, należy pamiętać, aby ścieżka do skryptu była poprawna, po dodanie restartujemy usługę Zabbix Agent.
3. Importujemy Template Veeam_M365_Backup_JOBS_Monitoring.yaml do Zabbix, a następnie podpinamy do hosta serwera Veeam Backup for Microsoft 365


UserParameter=vbo365.jobs.discovery,powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Program Files\Zabbix Agent 2\scripts\Veeam_Backup_O365_Monitoring.ps1" "$1"


Skrypt automatycznie, za pomocą PowerShell Veeam for Microsoft 365 wykryje JOB-y oraz Copy JOB-y a także ich ostatni status, w przypadku ostatniego stanu Warning wyświetli warning, w przypadku ostatniego stanu Failed wyświetli problem o poziomie Average.

Wersja kompatybilna z Zabbix 7.0, upewnij się, że skrypt PowerShell po uruchomieniu na serwerze wyświetla poprawne informacje, być może konieczna będzie modyfikacja ustawień PowerShell Veeam for Microsoft 365


#### INSTALLATION

Copy the scripts folder (containing the PowerShell script) into the Zabbix Agent directory.

In the zabbix_agent2.conf or zabbix_agent.conf file (depending on which version you are using), add the following entry.
Make sure the path to the script is correct.
After adding the entry, restart the Zabbix Agent service.

Import the template Template Veeam_M365_Backup_JOBS_Monitoring.yaml into Zabbix, and then link it to the host running Veeam Backup for Microsoft 365.

UserParameter=vbo365.jobs.discovery,powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Program Files\Zabbix Agent 2\scripts\Veeam_Backup_O365_Monitoring.ps1" "$1"

The script automatically uses PowerShell for Veeam Backup for Microsoft 365 to discover backup jobs and copy jobs, as well as their last execution status.

If the last status is Warning, a warning will be displayed.

If the last status is Failed, a problem with severity level Average will be generated.

Compatible with Zabbix 7.0.

Make sure that when you run the PowerShell script manually on the server, it displays correct information.
It may be necessary to adjust the PowerShell settings for Veeam Backup for Microsoft 365.

Autor: Tomasz Więcaszek
