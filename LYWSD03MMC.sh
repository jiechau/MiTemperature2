#!/bin/bash
cd $HOME/venv
source $HOME/venv/py39bt/bin/activate
cd $HOME/life_codes/MiTemperature2
python3 LYWSD03MMC.py -p -df devicelistfile_hby --onlydevicelist --callback ./sendToInflux_hby.sh
deactivate
