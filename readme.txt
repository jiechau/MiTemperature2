# readme.txt

# check process
ps -ef | grep LYWSD03MMC | grep devicelistfile_hby

# check log
tail -f $HOME/_ai_logs/MiTemperature2/LYWSD03MMC_restart.log # restart log
tail -f $HOME/_ai_logs/MiTemperature2/LYWSD03MMC.log # bt log

# cron
10 5 * * * $HOME/life_codes/MiTemperature2/restart_LYWSD03MMC.sh >> $HOME/_ai_logs/MiTemperature2/LYWSD03MMC_restart.log 2>&1
