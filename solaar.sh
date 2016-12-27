#!/bin/bash

solaar_url="https://github.com/pwr/Solaar/archive/master.zip"
solaar_zip="solaar.zip"
solaar_src="solaar_src"
solaar_des=$solaar_src/Solaar-master/
wget -O $solaar_zip $solaar_url
unzip $solaar_zip -d $solaar_src

echo "install dependencies"
sudo apt install --yes python-pyudev python3-pyudev python-gi python3-gi python3-pip python-pip libusb-1.0-0-dev libudev-dev
pip install hidapi setuptools

receiver_rule="/etc/udev/rules.d/42-logitech-unifying-receiver.rules"
if [ -e $receiver_rules ]
then
  rm $receiver_rules
fi

current_dir=`pwd`
cd $solaar_des
sh rules.d/install.sh
python setup.py build
sudo python setup.py install
cd $current_dir

rm -rf $solaar_zip $solaar_src
