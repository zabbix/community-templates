Sangfor Hyperconverged Infrastructure

Fill in the {$SNMP_COMMUNITY} field

Discovery: 
  CPU,
  Datastore,
  Fan,
  Filesystem,
  Optical Network,
  Raid,
  SSD

Triggers:
  CPU temperature,
  Datastore use rate,
  Fan status,
  Disk space on Filesystem,
  Optical signal power,
  Raid status,
  SSD Lifetime

Macroses:
  {$SANGFOR.CPU.UTILIZATION.CRITICAL},
  {$SANGFOR.DATASTORE.FREE.CRITICAL},
  {$SANGFOR.DATASTORE.FREE.WARN},
  {$SANGFOR.FS.FREE.CRITICAL},
  {$SANGFOR.FS.FREE.WARN},
  {$SANGFOR.MEMORY.UTILIZATION.CRITICAL},
  {$SANGFOR.MEMORY.UTILIZATION.WARN},
  {$SANGFOR.SSD.LIFETIME.CRITICAL},
  {$SANGFOR.SSD.LIFETIME.WARN},
  {$SANGFOR.TEMPERATURE.CRITICAL},
  {$SANGFOR.TEMPERATURE.WARN}
  {$SANGFOR.RX.MAX},
  {$SANGFOR.TX.MAX},
  {$SANGFOR.RX.MIN},
  {$SANGFOR.TX.MIN}
