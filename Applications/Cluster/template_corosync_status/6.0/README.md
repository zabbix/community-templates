# CoroSync-Ring-0

## Overview

Template and script below checks the status of the corosync Ring(s)


 


1: Create a Script File under the zabbix scripts directory, called corosync.pl and paste the script content into it


2: Make it executable and ownd by the zabbix user


3: Add the user Parameter below to the zabbix agent on the cluster nodes


 


**Zabbix Agent Config:**



```
**#**
# Corosync Status
#
UserParameter=check\_corosync[*], /etc/zabbix/scripts/corosync.pl $1
```

 


**Corosync Script:**


 


#!/usr/bin/perl


 


my $sudo = '/usr/bin/sudo';


my $cfgtool = '/usr/sbin/corosync-cfgtool -s';


 


$num\_args = $#ARGV + 1;


if ($num\_args != 1) {


 print "\nUsage: corosync.pl ring number\n";


 exit;


}


my $ringNumber = $ARGV[0];


open( $fh, "$cfgtool |" ) or die ( "Running corosync-cfgtool failed" );


foreach my $line (<$fh>) {


 if ( $line =~ m/status\s*=\s*(\S.+)/ ) {


 my $status = $1;


 if ( $status =~ m/^ring $ringNumber/ ) {


 # print "RING NUMBER $ringNumber STATUS: $status\n";


 if ( $status =~ m/^ring $ringNumber active with no faults/ ) {


 print "0";


 } else {


 print "1";


 }


 exit;


 }


 }


}


close($fh) or die ( "Running corosync-cfgtool failed" );


 



## Author

Roland Käser

## Macros used

There are no macros links in this template.

## Template links

There are no template links in this template.

## Discovery rules

There are no discovery rules in this template.

## Items collected

|Name|Description|Type|Key and additional info|
|----|-----------|----|----|
|Corosync Ring 0 Status|<p>Status of the Corosync Ring 0</p>|`Zabbix agent`|check_corosync[0]<p>Update: 30</p>|


## Triggers

There are no triggers in this template.

