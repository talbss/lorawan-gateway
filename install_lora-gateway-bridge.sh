#!/bin/bash

if [ $(id -u) -ne "0" ]
then
  echo "ERROR: please run as root"
  exit 1
fi
echo "Install mosquitto"
apt-get install mosquitto

echo "lora-gateway-bridge"
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1CE2AFD36DBCCA00
export DISTRIB_ID=`lsb_release -si`
export DISTRIB_CODENAME=`lsb_release -sc`
echo "deb https://repos.loraserver.io/${DISTRIB_ID,,} ${DISTRIB_CODENAME} testing" | sudo tee /etc/apt/sources.list.d/loraserver.list
apt-get update --yes
apt-get install lora-gateway-bridge

echo "modify lora-gateway-bridge.toml username and password"
sed -i 's/username=""/username="loragw"/g' /etc/lora-gateway-bridge/lora-gateway-bridge.toml
sed -i 's/password=""/password="lorawan"/g' /etc/lora-gateway-bridge/lora-gateway-bridge.toml

echo "start lora-gateway-bridge service"
systemctl start lora-gateway-bridge
