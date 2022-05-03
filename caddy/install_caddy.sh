#!/bin/bash

# for ubuntu, debian

sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https 
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/caddy-stable.asc 
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list 
sudo apt update -y
sudo apt install -y caddy

# test
caddy version

# systemd
sudo systemctl daemon-reload  
# 重载服务
sudo systemctl enable caddy   
# 开机启动
sudo systemctl start caddy    # 启动
# sudo systemctl stop caddy     # 停止

# 重启
sudo systemctl restart caddy  
# 查看状态
sudo systemctl status caddy   


