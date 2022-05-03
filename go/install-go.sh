#!/bin/bash

sudo -i

rm -rf /usr/local/go 

read -p "input cpu type amd64/arm63: " CPUTYPE

wget https://go.dev/dl/go1.18.1.linux-${CPUTYPE}.tar.gz

tar -C /usr/local -xzf go1.18.1.linux-S{CPUTYPE}.tar.gz

echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
source /etc/profile

zsh
#bash

read -p "input suer name: " USER

su - ${USER}
mkdir -p $HOME/gopath/{pkg,bin,src}

echo "export $GOROOT='/usr/local/go' \
       $GOPATH='$HOME/gopath' \
       PATH=$PATH:$GOROOT/bin"

source ~/.zshrc


