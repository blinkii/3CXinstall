#!/bin/bash 

clear 

echo " 

██╗███╗   ██╗████████╗███████╗██╗     ██╗ █████╗ 
██║████╗  ██║╚══██╔══╝██╔════╝██║     ██║██╔══██╗ 
██║██╔██╗ ██║   ██║   █████╗  ██║     ██║███████║ 
██║██║╚██╗██║   ██║   ██╔══╝  ██║     ██║██╔══██║ 
██║██║ ╚████║   ██║   ███████╗███████╗██║██║  ██║ 
╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚══════╝╚═╝╚═╝  ╚═╝ 
" 

echo "#######################" 
echo "Installation 3CX" 
echo "#######################"

apt install gnupg2 -y
wget -O- http://downloads-global.3cx.com/downloads/3cxpbx/public.key | sudo apt-key add
echo "deb http://downloads-global.3cx.com/downloads/debian buster main" | sudo tee /etc/apt/sources.list.d/3cxpbx.list
apt update
apt install -y net-tools dphys-swapfile
apt install -y 3cxpbx

echo 'sshd: 37.71.220.131' >> /etc/hosts.allow
echo 'sshd: ALL' >> /etc/hosts.deny
/etc/init.d/ssh restart
