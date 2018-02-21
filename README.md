LoRaWAN Gateway Installer
=========================

Simple LoRaWAN gateway packet forwarder installer. Compatible with Raspberry Pi host & SPI concentrator + RAK831.
install mosquitto + lora-gateway-bridge

## Installation

Run the following commands:

```bash
git clone https://github.com/talbss/lorawan-gateway.git
cd lorawan-gateway

## to install packet forwarder only
sudo ./install_Packet_Forwarder_Only.sh

or 
## to install packet forwarder + mosquitto + lora-gateway-bridge

sudo ./install_Complete_GW.sh

```
