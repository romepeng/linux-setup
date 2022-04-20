#!/bin/bash

crontab -l > /tmp/crontab-backup

echo "0 1 * * *   bash /root/ssl-cert-renew.sh"  >> /tmp/crontab-backup

crontab -u $USER /tmp/crontab-backup


