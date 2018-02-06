#!/bin/bash

RESET_PIN=17
WAIT_TIME=0.1

if [ $(id -u) -ne "0" ]
then
  echo "ERROR: please run as root"
  exit 1
fi

if [ ! -d /sys/class/gpio/gpio$RESET_PIN ]
then
  echo "$RESET_PIN" > /sys/class/gpio/export
  sleep $WAIT_TIME
fi

echo "out" > /sys/class/gpio/gpio$RESET_PIN/direction
sleep $WAIT_TIME
echo "1" > /sys/class/gpio/gpio$RESET_PIN/value
sleep $WAIT_TIME
echo "0" > /sys/class/gpio/gpio$RESET_PIN/value

sleep 5

echo "Gateway reset successfully"

./lora_pkt_fwd
