#!/bin/bash

#check_system_os and arch(amd64 or arm64)
#os
source /etc/os_release
#arch
dpkg --print-architecture

# update && upgrade
sudo apt update && sudo apt upgrade -y && sudo apt autoremove

#login security
# disable root login 
# disable port 22 ssh
# login by ssk-key

#firewall/iptable/ufw
 
#adduser 
chusermod
sudo nopasswd

#tools app
#wget curl git fuse tree net-tool

#git config


#vim and neovim

#python3 && pip3
#python3 venv

# install nodejs , npm , yard

# docker and docker-compose  ok  install_docker.sh wget -O - github

#domain 

#nginx / ssl

# linux install  poetry

curl -sSL https://install.python-poetry.org | python3 -

add 


# to different os or arch(cpu) 
#you can write diff srcipt on github to wget
# for example install docker

# or use select $VAR and condition to install
#for example $ARCH=amd64 0r arm64  
https://repo.anaconda.com/miniconda/Miniconda3-py39_4.11.0-Linux-${uname-m}.sh

MINICCONDA_PATH="$HOME/minconda
wget  https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-$(uname -m).sh -O  ~/miniconda.sh
 bash  ~/miniconda.sh -b -f -p MINICONDA_PATH
MINICONDA_PATH/bin/conda init
source  ~/.bashrc

