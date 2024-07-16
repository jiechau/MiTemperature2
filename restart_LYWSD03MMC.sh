#!/bin/bash
NOW=$(date +"%Y-%m-%d %H:%M:%S")
#
ff_pid=$(ps -ef | grep LYWSD03MMC | grep devicelistfile_hby | grep -v 'grep' | awk '{print $2}')
kill -9 $ff_pid
echo $NOW 'stop LYWSD03MMC.sh' $ff_pid
#
echo $(date +"%Y-%m-%d %H:%M:%S") 'start LYWSD03MMC.sh'
cd $HOME/life_codes/MiTemperature2
. LYWSD03MMC.sh >> $HOME/_ai_logs/MiTemperature2/LYWSD03MMC.log 2>&1 &
sleep 5
echo $(date +"%Y-%m-%d %H:%M:%S") ' process LYWSD03MMC.sh: '$(ps -ef | grep LYWSD03MMC | grep devicelistfile_hby | grep -v grep | awk '{print $2}')
#
END=$(date +"%Y-%m-%d %H:%M:%S")
echo $END 'END (from' $NOW
echo ' '

