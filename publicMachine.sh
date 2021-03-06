#!/bin/bash
apt install vim wget curl net-tools unzip xvfb x11vnc
apt install openjdk-8-jdk
Xvfb :1 -ac -screen 0 1024x768x24 &
export DISPLAY=:1 ; x11vnc -ncache 10 -ncache_cr -display :1 -forever -shared -logappend /var/log/x11vnc.log -bg -noipv6
echo "VNC initialized"
cd /root

echo "Creating folders"

mkdir Jts
#cd /Jts
mkdir /root/Jts/IBJts
mkdir /root/Jts/ibgateway
#cd /ibgateway 
mkdir /root/Jts/ibgateway/984
#cd /984
mkdir /root/Jts/ibgateway/984/jars
#cd ..
#cd ..
mkdir /root/Jts/jars
mkdir /root/Jts/ibgatewat
mkdir /root/Jts/META-INF

#cd /root

mkdir ibcontroller.paper
#cd /ibcontroller.paper
mkdir /root/ibcontroller.paper/Logs
mkdir /root/ibcontroller.paper/Scripts
#cd ..

echo "Initiating IBGateway..."
wget https://download2.interactivebrokers.com/installers/ibgateway/latest-standalone/ibgateway-latest-standalone-linux-x64.sh
chmod u+x ibgateway-latest-standalone-linux-x64.sh
sh ibgateway-latest-standalone-linux-x64.sh -c -q
echo "IBGateway started"
wget https://github.com/ib-controller/ib-controller/releases/download/3.4.0/IBController-3.4.0.zip
apt-get install unzip
unzip ./IBController-3.4.0.zip -d ./ibcontroller.paper
#Sustitucion de IBGatewayStart.sh
wget https://raw.githubusercontent.com/an10nsua1/DockerRepo/main/IBControllerGatewayStart.sh
ls -l
echo "/////////////////////////////////////////////////////////////////////"
rm ./ibcontroller.paper/IBControllerGatewayStart.sh
cp IBControllerGatewayStart.sh ./ibcontroller.paper
rm IBControllerGatewayStart.sh
chmod u+x ./ibcontroller.paper/*.sh ./ibcontroller.paper/*/*.sh

echo "//////////////////////////////////////////////////////////////////////////"

pwd

#Sustitucion de IBController.ini
wget https://raw.githubusercontent.com/an10nsua1/DockerRepo/main/IBController.ini
rm ./ibcontroller.paper/IBController.ini
cp IBController.ini ./ibcontroller.paper/
rm IBController.ini

#Sustitucion de Jts.ini

wget https://raw.githubusercontent.com/an10nsua1/DockerRepo/main/jts.ini
#rm /root/Jts/jts.ini
cp jts.ini /root/Jts/
rm jts.ini

DISPLAY=:1 /root/ibcontroller.paper/IBControllerGatewayStart.sh


