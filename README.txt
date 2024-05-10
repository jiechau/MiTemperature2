
original 
README_original.md
original
https://github.com/JsBergbau/MiTemperature2

(1) Raspberry Pi Imager
https://www.raspberrypi.com/software/operating-systems/
i use pi3b, 64bit, bullseye, no desktop version (desktop version takes long to 'apt update ...')
Debian GNU/Linux 11 (bullseye)
Linux pi3b 6.1.21-v8+ #1642 SMP PREEMPT Mon Apr  3 17:24:16 BST 2023 aarch64 GNU/Linux
it comes with /usr/bin/python # --version Python 3.9.2

(2) root
apt install -y git htop tmux
apt install -y python3 python3-pip python3-venv
apt install -y bluez libbluetooth-dev libglib2.0-dev
apt install -y bluetooth 

(3) find out Xiaomi Mi Bluetooth
sudo hcitool lescan
# write down 

(3) user
mkdir -p $HOME/venv; cd $HOME/venv
/usr/bin/python3.9 -m venv --system-site-packages py39bt
source py39bt/bin/activate
pip3 install --upgrade pip
# use requirements
pip3 install -r py39bt.pi3b.bullseye.requirements.txt
# ( or install by hand)
#pip3 install bluepy
#pip3 install pybluez pycryptodomex

(4) MiTemperature2
# under venv 'py39bt'
sudo setcap cap_net_raw,cap_net_admin+eip $(eval readlink -f `which python3`)
cd
git clone https://github.com/jiechau/MiTemperature2.git
cd MiTemperature2
cp devicelistfile_example_hby devicelistfile_hby
vi devicelistfile_hby # the bt address found in (3)
cp config_secrets_example_MiTemperature2.txt config_secrets.txt
vi config_secrets.txt # your secret info about influxdb

(6) run
. LYWSD03MMC.sh


Debug:
./LYWSD03MMC.py -d A4:C1:38:57:38:9F -r -b
./LYWSD03MMC.py -p
curl -i -u "<USERNAME>:<PASSWORD>" -XPOST http://<IP>:<PORT>/write?db=home\&precision=s --data-binary "sensor_hby,sensorname=HBY_livingroom temperature=28.3,humidity=77,voltage=2.95"



