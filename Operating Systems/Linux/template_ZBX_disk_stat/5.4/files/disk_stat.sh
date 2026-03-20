#!/bin/bash
################################################################################
#                                                                              #
#                       Zabbix Disk_Stat monitoring                            #
#                       mailto:dusharu17@gmail.com                             #
#                                                                   2022.03.13 #
################################################################################
export PATH="$PATH:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"

#################### VAR
##### EXIT_CODE
EXIT_CODE_INVALID_INPUT_PARAMETRS=200
EXIT_CODE_INVALID_DISK=201
EXIT_CODE_DISK_NOT_FOUND=220 # used in functions blkdev_all_stat*



#################### Function
#######################################
# Print Help
# Globals:
#   None
# Arguments:
#   None
#######################################
function PrintHelp {
  echo "PRINT HELP:"
  echo "$0 blkdev_discovery # return json with list of block devices"
  echo "$0 blkdev_all_stat <sdX|vg/lv> # return json with statistic for /dev/sdX or LVM device(dev/vgX/lvX)"
  echo
  echo "More infomation in my github:"
  echo "https://github.com/dusharu/ZBX_Disk_Stat"
}



#######################################
# Discovery block devices
# Globals:
#   None
# Arguments:
#   None
#######################################
function blkdev_discovery {
  # json header
  echo -n -e "{\n\t\"data\":["

  i=0
  # shellcheck disable=SC2034  # Unused variables used for skip some items
  while read -r MAJOR MINOR DEV OTHER; do
    # skip invalid DEV
    if [[ "$DEV" =~ ^[0-9]*$ ]]; then
      # echo "skip DEV: $DEV" >&2
      # echo "reason: Dev can't be num or empty" >&2
      # echo "string(debug): $MAJOR $MINOR $DEV $OTHER" >&2
      continue
    fi

    # print comma(,) for pervious line
    ((++i))
    if [[ "$i" -gt 1 ]]; then 
      echo -n -e "\t},"
    fi

    # print blkdev Item Header
    echo -n -e "\n\t\t{\t\"{#DEVBLK}\":\""

    # print blkdev Item Name
    if [[ "$DEV" =~ ^dm-[0-9]*$ ]]; then
      lsblk -l -o Name,KNAME |\
         grep -m 1 "\s*${DEV}$" |\
         cut -d " " -f 1 |\
         tr -d '\n'
    else
      echo -n "$DEV"
    fi

    # print blkd Item finisher
    echo -n \"
  done < /proc/diskstats

  # json footer
  echo -n -e "\t}\n"
  echo -n -e "\t]\n}\n"
}


#######################################
# Return Disk statistics in json
# Globals:
#   None
# Arguments:
#   DISK name;
#######################################
function blkdev_all_stat {
  DISK="$1"
  EXIT_CODE_DISK_NOT_FOUND=220

  # count parametrs and make correct fields name for column utility
  DISK_PARAMETERS_ALL='major,minor,name,read_complete,read_merge,read_sector,read_time,write_complete,write_merge,write_sector,write_time,io_queue,io_time,io_time_weight,discard_complete,discard_merge,discard_sector,discard_time,flush_request,flush_time'
  DISK_PARAMETERS_COUNT="$(awk '{print NF; exit}' /proc/diskstats)"
  DISK_PARAMETERS="$(echo "$DISK_PARAMETERS_ALL" | cut -d , -f "1-$DISK_PARAMETERS_COUNT" )"

  # translate blk-name to dm-XX
  if [ ! -b "/dev/$DISK" ]; then 
    DISK="$(lsblk -l -o KNAME,Name | grep -m 1 "$DISK" |awk '{print $1}')"
  fi

  # generate json
  if [ "$DISK" != "" ]; then 
    # sed if end of cmd for Backward cmpability
    # modern version of column print table-name in lower case
    grep -m 1 " $DISK " /proc/diskstats |\
      column \
        --json \
        --table-name ZBX_Disk_Stat \
        --table-columns "$DISK_PARAMETERS" |\
      sed -e 's/zbx_disk_stat/ZBX_Disk_Stat/g'
  else 
    exit "$EXIT_CODE_DISK_NOT_FOUND"
  fi
}



#######################################
# Return Disk statistics in json without utility column
# This is old version and will be delete soon
# Globals:
#   None
# Arguments:
#   DISK name;
#######################################
function blkdev_all_stat_without_column {
  DISK="$1"
  EXIT_CODE_DISK_NOT_FOUND=220

  # translate blk-name to dm-XX
  if [ ! -b "/dev/$DISK" ]; then
    DISK="$(lsblk -l -o KNAME,Name | grep -m 1 "$DISK" |awk '{print $1}')"
  fi

  # generate json
  if [ "$DISK" != "" ]; then 
    grep -m1 " $DISK " /proc/diskstats | awk '
      BEGIN { printf("{\n\"ZBX_Disk_Stat\": [ {"); }
      { 
        printf("\n\t\"name\": \"" $3 "\","); 
        printf("\n\t\"read_complete\": \"" $4 "\",");
        printf("\n\t\"read_sector\": \"" $6 "\",");
        printf("\n\t\"read_time\": \"" $7 "\",");
        printf("\n\t\"write_complete\": \"" $8 "\",");
        printf("\n\t\"write_sector\": \"" $10 "\",");
        printf("\n\t\"write_time\": \"" $11 "\",");
        printf("\n\t\"io_queue\": \"" $12 "\""); 
      }
      END { printf("\n\t} ]\n}"); }'
  else
    exit "$EXIT_CODE_DISK_NOT_FOUND"
  fi
}





#################### MAIN
case "$1" in
 blkdev_discovery) blkdev_discovery ;;
 blkdev_all_stat)
   if [[ -n "$2" ]]; then
     COLUMN_VERSION="$(column --version|grep -oe '[0-9\.]*')"
     if [[ "$(echo -e "2.30\n${COLUMN_VERSION}"| sort -V | head -n 1)" == 2.30 ]]; then
       # column version >= 2.30 and has --json option
       # https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.30/v2.30-ReleaseNotes
       blkdev_all_stat "$2"
     else
       # column version < 2.30 and doesn't have --json option
       blkdev_all_stat_without_column "$2"
     fi
   else
     echo "ERROR Unknow DISK: $2"; PrintHelp; exit "$EXIT_CODE_INVALID_DISK"
   fi
 ;;
 *) echo "ERROR Unknow action: $1"; PrintHelp; exit "$EXIT_CODE_INVALID_INPUT_PARAMETRS" ;;
esac
