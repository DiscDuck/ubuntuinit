#!/bin/bash
#

# functions

ask_reboot () {
   echo
   echo "Would you like to reboot now (y/n) ?"
   read rebootchoice
   if [ $rebootchoice = y ] || [ $rebootchoice = Y ]
   then
      sudo reboot
   fi
}

update_upgrade () {
   sudo apt update && sudo apt upgrade -y
}

install_docker () {
   sudo apt install docker.io -y
}

#menu

tput clear
tput bold
echo
echo "Ubuntu Init Menu"
echo
echo "1 Update and Upgrade the system"
echo "2 Update and Upgrade the system and install Docker"
echo "3 Install Docker"
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
   update_upgrade
   install_docker
   echo
   echo "Upgrade and Docker install finished."
   ask_reboot
elif [ $menuchoice = 3 ]
then
   install_docker
   echo
   echo "Docker install finished."
elif [ $menuchoice = 9 ]
then
   echo
   echo "Exiting..."
else
   echo
   echo "No valid choice given."
fi