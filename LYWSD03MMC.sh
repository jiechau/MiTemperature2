#!/bin/bash
cd $HOME/life_codes/MiTemperature2
source .venv/bin/activate
cd $HOME/life_codes/MiTemperature2
python3 LYWSD03MMC.py -p -df devicelistfile_hq --onlydevicelist --callback ./sendToInflux_hq.sh
deactivate
