# Universal Printer Supply Levels by SNMP
This template simply tracks your toner/ink levels via SNMP, and a simple ping to your device, with "low" and "critical" alerts. That's the whole scope of the template.

As long as your MFP follows the Printer MIB standard (should be true for any mainstream printer), this template will discover all installed "Supplies" in your MFP via SNMP. "Marker Supplies" is the term used in the Printer MIB for toner, ink, and other consumable substances that make a mark on whatever you're printing on.

## What's provided
Item prototypes use the "current" and "max" values provided by SNMP to calculate the remaining amount in a percentage. Simple graph prototypes included.

Alert prototypes provide an info-level alert when the "low" threshold is crossed, and a warning-level alert when the "critical" threshold is crossed. These are 5% and 0% by default, and are adjustable with provided macros.

## Setup
1. Download `template_universal_printer_supply_levels.yaml`.
2. In Zabbix, go to `Data Collection` -> `Templates` and then `Import` the .yaml with the button in the upper-right.
3. Create a new Host using an SNMP interface and attach the template "**Universal Printer Supply Levels by SNMP"**.
4. Adjust Host `Macros` to filter Discovery.

## Additional tweaking
Depending on how your printer uses the Supplies table, **you very well may end up with unused or duplicate items discovered**. To filter out unwanted entries, it's easiest to discover everything, and use the discovered items as reference. Every discovered item will have its SNMP index as part of the item key (e.g. supply.type.[5] for the supply at SNMP Index 5) - Any indices you wish to filter out of discovery, I've provided macros to do so.

You can learn more about the Printer MIB by searching for it on your favorite search engine. It's old, hasn't changed, and is widely used and documented.

## Credits
Author: Mick Swanson / @Treeefort
