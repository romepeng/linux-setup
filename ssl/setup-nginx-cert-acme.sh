#!/bin/bash

sudo -i
apt install nginx

apt apt install socat -y

# http://rome.tk

#https://linoxide.com/setup-nginx-with-lets-encrypt-acme-on-ubuntu/

curl https://get.acme.sh | sh -s email=romepeng@outlook.com

source ~/.bashrc

acme.sh --issue -d rome.tk --nginx

# acme.sh --issue -d  romepeng.tk --nginx

mkdir -p /etc/nginx/certs/rome.tk
mkdir -p /etc/nginx/certs/romepeng.tk

acme.sh --install-cert -d rome.tk  \
--key-file       /etc/nginx/certs/rome.tk/key.pem \
--fullchain-file /etc/nginx/certs/rome.tk/cert.pem  \
--reloadcmd     "service nginx force-reload"

acme.sh --install-cert -d romepeng.tk  \
--key-file       /etc/nginx/certs/romepeng.tk/key.pem \
--fullchain-file /etc/nginx/certs/romepeng.tk/cert.pem  \
--reloadcmd     "service nginx force-reload"

#sudo vi  /etc/nginx/sites-available/rome.tk
# add
# 80
# [::]:80
echo 
EOF>
listen [::]:443 ssl ipv6only=on;
listen 443 ssl;
ssl_certificate /etc/nginx/certs/rome.tk/cert.pem;
ssl_certificate_key /etc/nginx/certs/rome.tk/key.pem;
>EOF
>> /etc/nginx/sites-available/rome.tk

sudo nginx -t
sudo systemctl restart nginx
