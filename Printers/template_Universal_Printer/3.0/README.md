# Universal Printer Template

This template is valid for all printer manufacturers and all devices that are attached to the [RFC1759](https://tools.ietf.org/html/rfc1759.html) and [RFC3805](https://tools.ietf.org/html/rfc3805) (Printer-MIB).

The serial number, trays, toner and output trays are discovered (LLD) and monitored. The counter and filling levels are displayed in graphs.

## The following components are detected:

### Input

- Input trays
- Manual feed

### Media Transfer

- Simplex Module
- Duplex Module

### Supplies

- Toner cartridges
- Drumps
- Transfer Kit
- Waste Toner Box

### Output

- Output trays
- Finisher

 

Tested with HP, Kyocera, Samsung and Xerox in Zabbix 3.0

 

## Knowing Issues:

Some manufacturers send the string as a HEX, for example HP. This can't be automaticly converted by Zabbix, please see Bugreport [ZBXNEXT-505](https://support.zabbix.com/browse/ZBXNEXT-505).

 

enjoy and vote!
