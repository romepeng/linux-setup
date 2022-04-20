#!/bin/bash

read -p "input email for ssl: " EMAIL
echo -e "your email : $EMAIL"

# ~/.acme.sh/acme.sh --register-account -m $EMAIL

read -p "input damon for ssl: " DAMON
echo -e "your damon is $DAMON"

# ~/.acme.sh/acme.sh  --issue -d $DAMON  --standalone

~/.acme.sh/acme.sh --installcert -d $DAMON --key-file /root/ssl/private.key --fullchain-file /root/ssl/cert.crt

