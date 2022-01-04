#!/bin/bash
#

echo "This script will upgrade your system and install Docker."
echo
echo "Would you like to reboot at the end (recommended) y/n ?"

read rebootchoice

sudo apt update && sudo apt upgrade -y
sudo apt install docker.io -y

echo "Upgrade and Docker install finished."

if [ $rebootchoice = y ] || [ $rebootchoice = Y ]
then
   sudo reboot
fi