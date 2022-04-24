#!/bin/bash

crontab -l > /tmp/crontab-backup

#echo "0 1 * * *   bash /root/ssl-cert-renew.sh"  >> /tmp/crontab-backup
DOMAIN="rbobosz.tk"
echo "0 1 * * *  ~/.acme.sh/acme.sh --installcert -d $DOMAIN --key-file /root/ssl/private.key --fullchain-file /root/ssl/cert.crt

crontab -u $USER /tmp/crontab-backup


