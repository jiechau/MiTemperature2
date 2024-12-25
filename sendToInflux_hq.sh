#!/bin/bash

#use e.g with that script: MySensor.sh 
#!/bin/bash
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
#$DIR/LYWSD03MMC.py -d <device> -2p -p2 75 -o2 -4 -p1 33 -o1 -6 -r --debounce --skipidentical 50 --name MySensor --callback sendToInflux.sh

. config_secrets.txt
#echo $pi
#echo $pp
#echo $pw
#echo $pm

#curl -i -u "<user:pass>" -XPOST http://<host>:<port>/write?db=openhab_db\&precision=s --data-binary "<measurement>,sensorname=$2 temperature=$3,calibratedHumidity=$6,voltage=$5 $7"

curl -i -u "$pw" -XPOST http://$pi:$pp/write?db=home\&precision=s --data-binary "$pm,sensorname=$2 temperature=$3,humidity=$4,voltage=$5"

#echo "$1,sensor_hby,sensorname=$2 temperature=$3,humidity=$4,voltage=$5,$6" >> /tmp/pi.log


mkdir -p /tmp/sensor
echo $3 > /tmp/sensor/$2


