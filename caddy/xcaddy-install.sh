#!/bin/bash

# go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest

sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/xcaddy/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/caddy-xcaddy.asc
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/xcaddy/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-xcaddy.list
sudo apt update
sudo apt install xcaddy


#the xcaddy command has two primary uses:
#1.Compile custom caddy binaries
#2.A replacement for go run while developing Caddy plugins


#For example:

#$ xcaddy list-modules
#$ xcaddy run
#$ xcaddy run --config caddy.json

# xcaddy version
