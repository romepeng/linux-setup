#!/bin/bash
apt update -y && apt install -y curl

apt install -y socat

curl https://get.acme.sh | sh

read -p "input email for ssl: " EMAIL
echo -e "your email : $EMAIL"

~/.acme.sh/acme.sh --register-account -m $EMAIL

read -p "input damon for ssl: " DAMON
echo -e "your damon is $DAMON"

~/.acme.sh/acme.sh  --issue -d $DAMON  --standalone

~/.acme.sh/acme.sh --installcert -d $DAMON --key-file /root/private.key --fullchain-file /root/cert.crt

echo 0 1 1 * *   bash /root/xray-cert-renew.sh  >> crontab
