# Zabbix Template – Beemo (SNMP Only)

Developed by **Grujowmi**

## Coverage
- CPU per-core load (HOST-RESOURCES-MIB)
- Load average 1/5/15 (UCD-SNMP-MIB, if exposed)
- Swap discovery (hrStorageVirtualMemory) with triggers: WARNING > 20%, HIGH > 30%
- Filesystems discovery (hrStorage) with thresholds 80/90
- Network traffic (IFX 64-bit counters -> bps) with a traffic graph prototype

## Notes
If your SNMP daemon does not expose UCD-SNMP-MIB (1.3.6.1.4.1.2021), load/disk items may be unsupported; the rest will still work.
