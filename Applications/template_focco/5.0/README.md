# Focco

## Overview

Template de gerenciamento para Oracle Linux e sistema Focco ERP



## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Tamanho Total log_buffer|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/COMPONENTES_SGA_f3ipro.txt | grep log_buffer | awk -F ';' {'print $2'}]<p>Update: 30s</p>|
|Servico Oracle - Base de Teste|<p>-</p>|`Zabbix agent`|proc.num[ora_pmon_f3ites,]<p>Update: 30s</p>|
|IO - F3I_LOG - Blocos Escritos|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/VOLUME_IO_f3ipro.txt | grep -w f3ilog.dbf| awk -F ';' {'print $3'}]<p>Update: 30s</p>|
|Tamanho Total Diretorio Backup|<p>-</p>|`Zabbix agent`|system.run[du -sb /oracle/disco1/backup/compactados/ | awk {'print $1'}]<p>Update: 30s</p>|
|Porta TCP 8080 Produção|<p>-</p>|`Zabbix agent`|net.tcp.listen[8080]<p>Update: 30s</p>|
|Tamanho Total Diretorio Log Listener|<p>-</p>|`Zabbix agent`|system.run[du -sb /oracle/disco1/produtos/diag/tnslsnr/oracle/listener/ | awk {'print $1'}]<p>Update: 30s</p>|
|Sessao Bloqueadora|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/SESSAO_BLOQUEADORA_f3ipro.txt]<p>Update: 30s</p>|
|Servico Listener|<p>-</p>|`Zabbix agent`|proc.num[tnslsnr,]<p>Update: 30s</p>|
|Tamanho Usado - SYSAUX|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep SYSAUX | awk -F ';' {'print $3'}]<p>Update: 30s</p>|
|Tamanho Arquivo RMAN - Storage|<p>-</p>|`Zabbix agent`|system.run[test -e /mnt/bkpstorage/`/bin/date +"%Y%m%d"`/backup-rman_`date "+%Y%m%d"`.tgz && du -sb /mnt/bkpstorage/`date "+%Y%m%d"`/backup-rman_`date "+%Y%m%d"`.tgz | awk {'print $1'} || echo 0]<p>Update: 30s</p>|
|Verificacao Montagem Remoto Storage|<p>-</p>|`Zabbix agent`|system.run[ls /mnt/bkpstorage/zabbix 2>/dev/null | wc -l]<p>Update: 30s</p>|
|p5p1 - IN|<p>-</p>|`Zabbix agent`|net.if.in[p5p1,bytes]<p>Update: 30s</p>|
|p5p1 - Total|<p>-</p>|`Zabbix agent`|net.if.total[p5p1,bytes]<p>Update: 30s</p>|
|Comunicacao com o License Server|<p>-</p>|`Zabbix agent`|system.run[cat /etc/AplicativosFocco/logs/application.log | grep comunica | wc -l]<p>Update: 30s</p>|
|Tamanho Livre Datafiles - F3I_LOG 1|<p>-</p>|`Zabbix agent`|system.run[test `cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt 2> /dev/null | grep F3I_LOG | sed '1!d' | wc -l` -eq 1 && cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep F3I_LOG | sed '1!d' | awk -F ';' {'print $4'} || echo 0]<p>Update: 30s</p>|
|IO - F3I_DATA - Blocos Lidos|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/VOLUME_IO_f3ipro.txt | grep -w f3ilog.dbf| awk -F ';' {'print $2'}]<p>Update: 30s</p>|
|IO - F3I_INDEX - Blocos Lidos|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/VOLUME_IO_f3ipro.txt | grep -w f3iidx.dbf| awk -F ';' {'print $2'}]<p>Update: 30s</p>|
|Tamanho Usado Shared|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/COMPONENTES_SGA_f3ipro.txt | grep shared | awk -F ';' {'print $3'}]<p>Update: 30s</p>|
|Tamanho Usado db_cache_size|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/COMPONENTES_SGA_f3ipro.txt | grep db_cache_size | awk -F ';' {'print $3'}]<p>Update: 30s</p>|
|Verificacao Arquivo de Log do Listener|<p>-</p>|`Zabbix agent`|system.run[ ls /oracle/disco1/produtos/diag/tnslsnr/oracle/listener/trace/listener.log 2> /dev/null | wc -l ]<p>Update: 30s</p>|
|Hora LinuxTime|<p>-</p>|`Zabbix agent`|system.run[date +%s]<p>Update: 30s</p>|
|Total UNDO Cliente - QUANT.|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/UNDO_f3ipro.txt 2> /dev/null | wc -l]<p>Update: 30s</p>|
|Servico Mysql - (Porta 3306 TCP) - Oracle Linux - (Verifica se a porta está escutando)|<p>-</p>|`Zabbix agent`|net.tcp.listen[3306]<p>Update: 30s</p>|
|Processos Máximo Rodando|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/LIMITESBD_f3ipro.txt | grep processes | awk -F ';' {'print $3'}]<p>Update: 30s</p>|
|Log Backup Linux|<p>-</p>|`Zabbix agent`|system.run[test `cat /oracle/disco1/backup/logs/backup-linux-nfs_$(date +%Y%m%d)* 2> /dev/null | wc -l` -gt 1 && cat /oracle/disco1/backup/logs/backup-linux-nfs_$(date +%Y%m%d)* || echo Arquivo nao Gerado]<p>Update: 30s</p>|
|Tamanho Usado TEMP 1|<p>-</p>|`Zabbix agent`|system.run[test `cat /etc/zabbix/oracle/TEMP_f3ipro.txt | sed '1!d' | awk -F ';' {'print $4'} | wc -w` -eq 1 && cat /etc/zabbix/oracle/TEMP_f3ipro.txt | awk -F ';' {'print $4'} | sed '1!d' || echo 0]<p>Update: 30s</p>|
|Tamanho Livre DATAFILE - F3I_INDEX 1|<p>-</p>|`Zabbix agent`|system.run[test `cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep F3I_INDEX | awk -F ';' {'print $4'} | sed '1!d' | wc -l` -eq 1 && cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep F3I_INDEX | awk -F ';' {'print $4'} | sed '1!d' || echo 0]<p>Update: 30s</p>|
|Tamanho Usado - F3I_LOG 1|<p>-</p>|`Zabbix agent`|system.run[test `cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt 2> /dev/null | grep F3I_LOG | sed '1!d' | wc -l` -eq 1 && cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep F3I_LOG | sed '1!d' | awk -F ';' {'print $3'} || echo 0 ]<p>Update: 30s</p>|
|Checksum SAMBA /etc/samba/smb.conf - OL|<p>-</p>|`Zabbix agent`|vfs.file.cksum[/etc/samba/smb.conf]<p>Update: 30s</p>|
|Linux - Startup Mysqld Level5|<p>-</p>|`Zabbix agent`|system.run[chkconfig --list mysqld | grep 5:on | wc -l]<p>Update: 30s</p>|
|Servico Samba|<p>-</p>|`Zabbix agent`|focco.servico.samba<p>Update: 30s</p>|
|Percentual Ocupado - Processos|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/LIMITESBD_f3ipro.txt | grep processes | awk -F ';' {'print $5'}]<p>Update: 30s</p>|
|Verificacao Backup Arquivo Backup RMAN - Storage|<p>-</p>|`Zabbix agent`|system.run[ls /mnt/bkpstorage/`date "+%Y%m%d"`/backup-rman_`date "+%Y%m%d"`.tgz 2>/dev/null | wc -l]<p>Update: 30s</p>|
|Verificacao Backup Arquivo backup_programas - Storage|<p>-</p>|`Zabbix agent`|system.run[ls /mnt/bkpstorage/`date "+%Y%m%d"`/backup-programas_`date "+%Y%m%d"`.tgz 2>/dev/null | wc -l]<p>Update: 30s</p>|
|Tamanho Usado log_buffer|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/COMPONENTES_SGA_f3ipro.txt | grep log_buffer | awk -F ';' {'print $3'}]<p>Update: 30s</p>|
|Verificacao Backup Arquivo backup_export - Storage|<p>-</p>|`Zabbix agent`|system.run[ls /mnt/bkpstorage/`date "+%Y%m%d"`/backup-export-full_pro_`date "+%Y%m%d"`.tgz 2>/dev/null | wc -l]<p>Update: 30s</p>|
|Quantidade F3I_DATA Cliente|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep F3I_DATA | wc -l]<p>Update: 30s</p>|
|Checksum DATAFILES.txt|<p>-</p>|`Zabbix agent`|vfs.file.cksum[/etc/zabbix/oracle/DATAFILES_f3ipro.txt]<p>Update: 30s</p>|
|bond0 - IN|<p>-</p>|`Zabbix agent`|net.if.in[bond0,bytes]<p>Update: 5m</p>|
|bond0 - Total|<p>-</p>|`Zabbix agent`|net.if.total[bond0,bytes]<p>Update: 30s</p>|
|Tamanho Total - SYSAUX|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep SYSAUX | awk -F ';' {'print $2'}]<p>Update: 30s</p>|
|Quantidade F3I_INDEX Cliente|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep F3I_INDEX | wc -l]<p>Update: 30s</p>|
|Verificacao Backup Arquivo Backup RMAN|<p>-</p>|`Zabbix agent`|system.run[ ls /oracle/disco1/backup/compactados/backup-rman_`date "+%Y%m%d"`.tgz 2> /dev/null | wc -l ]<p>Update: 30s</p>|
|Tamanho Total Diretorio Backup do Dia - Storage|<p>-</p>|`Zabbix agent`|system.run[du -sb /mnt/bkpstorage/`date "+%Y%m%d"`/ | awk {'print $1'}]<p>Update: 30s</p>|
|Sessões Total|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/LIMITESBD_f3ipro.txt | grep sessions | awk -F ';' {'print $4'}]<p>Update: 30s</p>|
|IOSTAT - SDA|<p>-</p>|`Zabbix agent`|system.run[iostat -xd /dev/sda 1 2 | sed '7!d' | awk {'print $12'}]<p>Update: 30s</p>|
|Tamanho Arquivo RMAN|<p>-</p>|`Zabbix agent`|system.run[ test -e /oracle/disco1/backup/compactados/backup-rman_`date "+%Y%m%d"`.tgz && du -sb /oracle/disco1/backup/compactados/backup-rman_`date "+%Y%m%d"`.tgz | awk {'print $1'} || echo 0 ]<p>Update: 30s</p>|
|Tempo do Backup do RMAN|<p>-</p>|`Zabbix agent`|system.run[ test -e /oracle/disco1/backup/logs/backup-rman_`date "+%Y%m%d"`.log && cat /oracle/disco1/backup/logs/backup-rman_`date "+%Y%m%d"`.log | sed -n '1p;$p' || echo "Arquivo nao gerado" ]<p>Update: 30s</p>|
|Percentual Ocupado|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/LIMITESBD_f3ipro.txt | grep sessions | awk -F ';' {'print $5'}]<p>Update: 30s</p>|
|Tamanho Total - SYSTEM|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep SYSTEM | awk -F ';' {'print $2'}]<p>Update: 30s</p>|
|IO - F3I_LOG - Blocos Lidos|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/VOLUME_IO_f3ipro.txt | grepsystem.run[cat /etc/zabbix/oracle/VOLUME_IO_f3ipro.txt | grep -w f3ilog.dbf| awk -F ';' {'print $2'}]<p>Update: 30s</p>|
|IO - F3I_INDEX - Blocos Escritos|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/VOLUME_IO_f3ipro.txt | grep -w f3iidx.dbf| awk -F ';' {'print $3'}]<p>Update: 30s</p>|
|IO - F3I_DATA - Blocos Escritos|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/VOLUME_IO_f3ipro.txt | grep -w f3idat.dbf| awk -F ';' {'print $3'}]<p>Update: 30s</p>|
|Tempo do Backup do Export|<p>-</p>|`Zabbix agent`|system.run[ test -e /oracle/disco1/backup/logs/backup-export_`date "+%Y%m%d"`.log && cat /oracle/disco1/backup/logs/backup-export_`date "+%Y%m%d"`.log | sed -n '1p;$p' || echo "Arquivo nao gerado" ]<p>Update: 30s</p>|
|p5p2 - OUT|<p>-</p>|`Zabbix agent`|net.if.out[p5p2,bytes]<p>Update: 30s</p>|
|Servico Enterprise Manager|<p>-</p>|`Zabbix agent`|proc.num[emagent,]<p>Update: 30s</p>|
|Tamanho Arquivo Programas|<p>-</p>|`Zabbix agent`|system.run[ test -e /oracle/disco1/backup/compactados/backup-programas_`date "+%Y%m%d"`.tgz && du -sb /oracle/disco1/backup/compactados/backup-programas_`date "+%Y%m%d"`.tgz | awk {'print $1'} || echo 0 ]<p>Update: 30s</p>|
|Consumo de Archives|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/ARCHIVES_f3ipro.txt | awk {'print $1/1'}]<p>Update: 30s</p>|
|Servico Mysql - (Porta 3306 TCP) - Oracle Linux - (Possibilidade de fazer conexão nesta porta)|<p>-</p>|`Zabbix agent`|net.tcp.port[,3306]<p>Update: 30s</p>|
|Percentual Ocupado DATAFILES - F3I_LOG 1|<p>-</p>|`Zabbix agent`|system.run[test `cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt 2> /dev/null | grep F3I_LOG | sed '1!d' | wc -l` -eq 1 && cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep F3I_LOG | sed '1!d' | awk -F ';' {'print $5'} || echo 0]<p>Update: 30s</p>|
|Tamanho Livre SYSAUX|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep SYSAUX | awk -F ';' {'print $4'}]<p>Update: 30s</p>|
|Percentual Ocupado F3I_DATA|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep -w F3I_DATA | awk -F ';' {'print $5'}]<p>Update: 30s</p>|
|Tamanho Livre SYSTEM|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep SYSTEM | awk -F ';' {'print $4'}]<p>Update: 30s</p>|
|Servico Oracle Produção|<p>-</p>|`Zabbix agent`|proc.num[ora_pmon_f3ipro,]<p>Update: 30s</p>|
|Tamanho Total DATAFILES - F3I_LOG 1|<p>-</p>|`Zabbix agent`|system.run[test `cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt 2> /dev/null | grep F3I_LOG | sed '1!d' | wc -l` -eq 1 && cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep F3I_LOG | sed '1!d' | awk -F ';' {'print $2'} || echo 0 ]<p>Update: 30s</p>|
|Verificação Backup Arquivo Backup Export|<p>-</p>|`Zabbix agent`|system.run[ls /oracle/disco1/backup/compactados/backup-export-full_pro_`date "+%Y%m%d"`.tgz 2> /dev/null | wc -l ]<p>Update: 30s</p>|
|Total TEMPS Cliente|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/TEMP_f3ipro.txt 2>/dev/null | wc -l]<p>Update: 30s</p>|
|Blocos UNDO - EXPIRED|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/UNDO_DETAILS_f3ipro.txt | grep "UNDOTBS1;EXPIRED" | awk -F ';' {'print $3'}]<p>Update: 30s</p>|
|Tamanho Total F3I_DATA|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep -w F3I_DATA | awk -F ';' {'print $2'}]<p>Update: 30s</p>|
|Percentual Ocupado UNDO 1|<p>-</p>|`Zabbix agent`|system.run[ test `cat /etc/zabbix/oracle/UNDO_f3ipro.txt 2> /dev/null | sed '1!d' | wc -l` -eq 1 || echo 0 && cat /etc/zabbix/oracle/UNDO_f3ipro.txt | sed '1!d' | awk -F ';' {'print $4'} ]<p>Update: 30s</p>|
|Blocos UNDO - ACTIVE|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/UNDO_DETAILS_f3ipro.txt | grep "UNDOTBS1;ACTIVE" | awk -F ';' {'print $3'}]<p>Update: 30s</p>|
|Sessões Utilizadas|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/LIMITESBD_f3ipro.txt | grep sessions | awk -F ';' {'print $2'}]<p>Update: 30s</p>|
|CPU Util %|<p>-</p>|`Zabbix agent`|system.cpu.util[ ]<p>Update: 30s</p>|
|Tamanho Total DATAFILE- F3I_INDEX 1|<p>-</p>|`Zabbix agent`|system.run[test `cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt 2> /dev/null | grep INDEX | awk -F ';' {'print $2'} | sed '1!d' | wc -w` -eq 1 && cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep INDEX | awk -F ';' {'print $2'} | sed '1!d' || echo 0]<p>Update: 30s</p>|
|Sessões Máximo Utilizadas - Limites Banco|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/LIMITESBD_f3ipro.txt | grep sessions | awk -F ';' {'print $3'}]<p>Update: 30s</p>|
|Tamanho Arquivo Export|<p>-</p>|`Zabbix agent`|system.run[test -e /oracle/disco1/backup/compactados/backup-export-full_pro_`date "+%Y%m%d"`.tgz && du -sb /oracle/disco1/backup/compactados/backup-export-full_pro_`date "+%Y%m%d"`.tgz | awk {'print $1'} || echo 0]<p>Update: 30s</p>|
|Tamanho Total ORACLE JAVA POOL|<p>-</p>|`Zabbix agent`|system.run[test `cat /etc/zabbix/oracle/COMPONENTES_SGA_f3ipro.txt | grep java | awk -F ';' {'print $2'} | wc -w` -eq 1 && cat /etc/zabbix/oracle/COMPONENTES_SGA_f3ipro.txt | grep java | awk -F ';' {'print $2'} || echo 0]<p>Update: 30s</p>|
|Tamanho Usado Stream|<p>-</p>|`Zabbix agent`|system.run[ test `cat /etc/zabbix/oracle/COMPONENTES_SGA_f3ipro.txt | grep stream | awk -F ';' {'print $3'} | wc -w` -eq 1 && cat /etc/zabbix/oracle/COMPONENTES_SGA_f3ipro.txt | grep stream | awk -F ';' {'print $3'} || echo 0 ]<p>Update: 30s</p>|
|Percentual Ocupado TEMP 1|<p>-</p>|`Zabbix agent`|system.run[test `cat /etc/zabbix/oracle/TEMP_f3ipro.txt | sed '1!d' | awk -F ';' {'print $4'} | wc -w` -eq 1 && cat /etc/zabbix/oracle/TEMP_f3ipro.txt | awk -F ';' {'print $4'} | sed '1!d' || echo 0 ]<p>Update: 30s</p>|
|Porta 7757|<p>-</p>|`Zabbix agent`|net.tcp.listen[7757]<p>Update: 30s</p>|
|Tamanho Total UNDO 1|<p>-</p>|`Zabbix agent`|system.run[test `cat /etc/zabbix/oracle/UNDO_f3ipro.txt 2> /dev/null | sed '1!d' | wc -l` -eq 1 || echo 0 && cat /etc/zabbix/oracle/UNDO_f3ipro.txt | sed '1!d' | awk -F ';' {'print $2'}]<p>Update: 30s</p>|
|p5p2 - IN|<p>-</p>|`Zabbix agent`|net.if.in[p5p2,bytes]<p>Update: 30s</p>|
|Servico NMB|<p>-</p>|`Zabbix agent`|focco.servico.nmb<p>Update: 30s</p>|
|Checksum FSTAB|<p>-</p>|`Zabbix agent`|vfs.file.cksum[/etc/fstab]<p>Update: 30s</p>|
|Tamanho Usado ORACLE JAVA POOL|<p>-</p>|`Zabbix agent`|system.run[test `cat /etc/zabbix/oracle/COMPONENTES_SGA_f3ipro.txt | grep java | awk -F ';' {'print $3'} | wc -w` -eq 1 && cat /etc/zabbix/oracle/COMPONENTES_SGA_f3ipro.txt | grep java | awk -F ';' {'print $3'} || echo 0]<p>Update: 30s</p>|
|Tamanho Livre TEMP 1|<p>-</p>|`Zabbix agent`|system.run[test `cat /etc/zabbix/oracle/TEMP_f3ipro.txt | sed '1!d' | awk -F ';' {'print $3'} | wc -w` -eq 1 && cat /etc/zabbix/oracle/TEMP_f3ipro.txt | awk -F ';' {'print $3'} | sed '1!d' || echo 0]<p>Update: 30s</p>|
|Tamanho Arquivo Export - Storage|<p>-</p>|`Zabbix agent`|system.run[ test -e /mnt/bkpstorage/`/bin/date +"%Y%m%d"`/backup-export-full_pro_`date "+%Y%m%d"`.tgz && du -sb /mnt/bkpstorage/`/bin/date +"%Y%m%d"`/backup-export-full_pro_`date "+%Y%m%d"`.tgz | awk {'print $1'} || echo 0 ]<p>Update: 30s</p>|
|Processos Rodando|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/LIMITESBD_f3ipro.txt | grep processes | awk -F ';' {'print $2'}]<p>Update: 30s</p>|
|p5p2 - Total|<p>-</p>|`Zabbix agent`|net.if.total[p5p2,bytes]<p>Update: 30s</p>|
|p5p1 - OUT|<p>-</p>|`Zabbix agent`|net.if.out[p5p1,bytes]<p>Update: 30s</p>|
|TOP SQL|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/TOP_SQL_f3ipro.txt]<p>Update: 30s</p>|
|Percentual Ocupado SYSTEM|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep SYSTEM | awk -F ';' {'print $5'}]<p>Update: 30s</p>|
|Log License Server|<p>-</p>|`Zabbix agent`|system.run[cat /etc/AplicativosFocco/logs/application.log | grep comunica || echo 0]<p>Update: 30s</p>|
|Tamanho Total db_cache_size|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/COMPONENTES_SGA_f3ipro.txt | grep db_cache_size | awk -F ';' {'print $2'}]<p>Update: 30s</p>|
|Contingencia - Teste dos valores de coleta|<p>-</p>|`Zabbix agent`|system.run["/bin/cat /etc/zabbix/r.txt | wc -w"]<p>Update: 30s</p>|
|Tamanho Total Stream|<p>-</p>|`Zabbix agent`|system.run[ test `cat /etc/zabbix/oracle/COMPONENTES_SGA_f3ipro.txt | grep stream | awk -F ';' {'print $2'} | wc -w` -eq 1 && cat /etc/zabbix/oracle/COMPONENTES_SGA_f3ipro.txt | grep stream | awk -F ';' {'print $2'} || echo 0 ]<p>Update: 30s</p>|
|Blocos UNDO - UNEXPIRED|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/UNDO_DETAILS_f3ipro.txt | grep "UNDOTBS1;UNEXPIRED" | awk -F ';' {'print $3'}]<p>Update: 30s</p>|
|Verificacao Backup Arquivo Backup Programas|<p>-</p>|`Zabbix agent`|system.run[ ls /oracle/disco1/backup/compactados/backup-programas_`date "+%Y%m%d"`.tgz 2> /dev/null | wc -l ]<p>Update: 30s</p>|
|Servico SSH|<p>-</p>|`Zabbix agent`|net.tcp.service[ssh,,22]<p>Update: 30s</p>|
|Tamanho Usado DATAFILE - F3I_INDEX 1|<p>-</p>|`Zabbix agent`|system.run[test `cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt 2>/dev/null | grep INDEX | awk -F ';' {'print $3'} | sed '1!d' | wc -w` -eq 1 && cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep INDEX | awk -F ';' {'print $3'} | sed '1!d' || echo 0]<p>Update: 30s</p>|
|Tamanho Arquivo Programas - Storage|<p>-</p>|`Zabbix agent`|system.run[test -e /mnt/bkpstorage/`/bin/date +"%Y%m%d"`/backup-programas_`date "+%Y%m%d"`.tgz && du -sb /mnt/bkpstorage/`date "+%Y%m%d"`/backup-programas_`date "+%Y%m%d"`.tgz | awk {'print $1'} || echo 0]<p>Update: 30s</p>|
|UNDO - NUMERO DE LINHAS|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/UNDO_DETAILS_f3ipro.txt | wc -l]<p>Update: 30s</p>|
|Tamanho Total Shared|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/COMPONENTES_SGA_f3ipro.txt | grep shared | awk -F ';' {'print $2'}]<p>Update: 30s</p>|
|Tamanho Usado UNDO 1|<p>-</p>|`Zabbix agent`|system.run[test `cat /etc/zabbix/oracle/UNDO_f3ipro.txt 2> /dev/null | sed '1!d' | wc -l` -eq 1 || echo 0 && cat /etc/zabbix/oracle/UNDO_f3ipro.txt | sed '1!d' | awk -F ';' {'print $3'}]<p>Update: 30s</p>|
|Tempo do Backup dos Programas|<p>-</p>|`Zabbix agent`|system.run[ test -e /oracle/disco1/backup/logs/backup-programas_`date "+%Y%m%d"`.log && cat /oracle/disco1/backup/logs/backup-programas_`date "+%Y%m%d"`.log | sed -n '1p;$p' || echo "Arquivo nao gerado" ]<p>Update: 30s</p>|
|AplicativosFocco|<p>-</p>|`Zabbix agent (active)`|system.run[ps fax| grep "/etc/AplicativosFocco/Bifrost.jar" | wc -l]<p>Update: 30s</p>|
|Tamanho Arquivo do Log do Listener|<p>-</p>|`Zabbix agent`|system.run[test -e /oracle/disco1/produtos/diag/tnslsnr/oracle/listener/trace/listener.log && du -sb /oracle/disco1/produtos/diag/tnslsnr/oracle/listener/trace/listener.log | awk {'print $1'} || echo 0]<p>Update: 30s</p>|
|Tamanho Livre F3I_DATA|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep -w F3I_DATA | awk -F ';' {'print $4'}]<p>Update: 30s</p>|
|Percentual Ocupado SYSAUX|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep SYSAUX | awk -F ';' {'print $5'}]<p>Update: 30s</p>|
|Tamanho Total TEMP 1|<p>-</p>|`Zabbix agent`|system.run[ test `cat /etc/zabbix/oracle/TEMP_f3ipro.txt | sed '1!d' | awk -F ';' {'print $1'} | wc -w` -eq 1 && cat /etc/zabbix/oracle/TEMP_f3ipro.txt | awk -F ';' {'print $1'} | sed '1!d' || echo 0 ]<p>Update: 30s</p>|
|Sequencia dos Archives|<p>-</p>|`Zabbix agent`|focco.seq.cont<p>Update: 30s</p>|
|Processos Total - PROCESSOS|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/LIMITESBD_f3ipro.txt | grep processes | awk -F ';' {'print $4'}]<p>Update: 30s</p>|
|Tamanho Usado - F3I_DATA|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep -w F3I_DATA | awk -F ';' {'print $3'}]<p>Update: 30s</p>|
|bond0 - OUT|<p>-</p>|`Zabbix agent`|net.if.out[bond0,bytes]<p>Update: 30s</p>|
|Tamanho Usado - SYSTEM|<p>-</p>|`Zabbix agent`|system.run[cat /etc/zabbix/oracle/DATAFILES_f3ipro.txt | grep SYSTEM | awk -F ';' {'print $3'}]<p>Update: 30s</p>|


## Triggers

There are no triggers in this template.

