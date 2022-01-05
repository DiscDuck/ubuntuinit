#!/bin/bash
#

# functions

# reboot

ask_reboot () {
   echo
   echo "Would you like to reboot now (y/n) ?"
   read rebootchoice
   if [ $rebootchoice = y ] || [ $rebootchoice = Y ]
   then
      sudo reboot
   fi
}

# Option 1: Update and Upgrade the system

update_upgrade () {
   sudo apt update && sudo apt upgrade -y
   sudo apt install python3-pip -y
}

# Option 2: Install Docker

install_docker () {
   sudo apt-get remove docker docker-engine docker.io containerd runc
   sudo apt-get update
   sudo apt-get install ca-certificates curl gnupg lsb-release
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
   sudo apt-get update
   sudo apt-get install docker-ce docker-ce-cli containerd.io
}

# Option 3: Install Docker-Compose

install_docker_compose () {
   sudo pip3 install docker-compose
}

#menu

tput clear
tput bold
echo
echo "Ubuntu Init Menu"
echo
echo "1 Update and Upgrade the system"
echo "2 Install Docker"
echo "3 Install Docker-Compose"
echo "9 Exit"
tput sgr0

read menuchoice

if [ $menuchoice = 1 ]
then
   update_upgrade
   echo
   echo "Upgrade finished."
   ask_reboot
elif [ $menuchoice = 2 ]
then
   install_docker
   echo
   echo "Docker install finished."
   ask_reboot
elif [ $menuchoice = 3 ]
then
   install_docker_compose
   echo
   echo "Docker-Compose install finished."
elif [ $menuchoice = 9 ]
then
   echo
   echo "Exiting..."
else
   echo
   echo "No valid choice given."
fi