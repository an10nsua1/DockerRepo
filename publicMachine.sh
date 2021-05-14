#!/bin/bash
apt install vim wget curl net-tools unzip xvfb x11vnc
apt install openjdk-8-jdk
Xvfb :1 -ac -screen 0 1024x768x24 &
export DISPLAY=:1 ; x11vnc -ncache 10 -ncache_cr -display :1 -forever -shared -logappend /var/log/x11vnc.log -bg -noipv6
echo "VNC initialized"
cd /root
echo "Initiating IBGateway..."
wget https://download2.interactivebrokers.com/installers/ibgateway/latest-standalone/ibgateway-latest-standalone-linux-x64.sh
chmod u+x ibgateway-latest-standalone-linux-x64.sh
sh ibgateway-latest-standalone-linux-x64.sh -c -y
echo "IBGateway started"
wget https://github.com/ib-controller/ib-controller/releases/download/3.4.0/IBController-3.4.0.zip
unzip ./IBController-3.4.0.zip -d ./ibcontroller.paper
#Sustitucion de IBGatewayStart.sh
wget https://github.com/an10nsua1/DockerRepo/blob/main/IBControllerGatewayStart.sh 
rm /root/ibcontroler.paper/IBControllerGatewayStart.sh
cp IBControllerGatewayStart.sh /root/ibcontroler.paper
rm IBControllerGatewayStart.sh
chmod u+x ./ibcontroller.paper/*.sh ./ibcontroller.paper/*/*.sh

#Sustitucion de IBController.ini
wget https://github.com/an10nsua1/DockerRepo/blob/main/IBController.ini
rm /root/ibcontroler.paper/IBController.ini
cp IBController.ini /root/ibcontroler.paper/
rm IBController.ini

#Sustitucion de Jts.ini

wget https://github.com/an10nsua1/DockerRepo/blob/main/jts.ini
rm /root/Jts/jts.ini
cp jts.ini /root/Jts/
rm jts.ini

DISPLAY=:1 ~/ibcontroller.paper/IBControllerGatewayStart.sh

