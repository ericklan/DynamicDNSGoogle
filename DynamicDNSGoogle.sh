#!/bin/bash

## Google Domains provides an API to update a DNS
### "Synthetic record". This script updates a record with
### the script-runner's public IP address, as resolved using a DNS
### lookup.
###
### Google Dynamic DNS: https://support.google.com/domains/answer/6147083
### Synthetic Records: https://support.google.com/domains/answer/6069273

USERNAME="UtbkKrepm"
PASSWORD="9eOKrrH"
HOSTNAME="www.iodocs.com"

# Resolve current public IP
IP=$(curl -s "https://domains.google.com/checkip")

HOST_IP=$(dig @8.8.8.8 +short A "$HOSTNAME" | sort | tail -1)

if [ $HOST_IP != $IP ]
then
  echo "Updating Dynamic DNS record for host " .  $HOST_IP . " to IP " . $IP
  #Update Google DNS Record
  URL="https://${USERNAME}:${PASSWORD}@domains.google.com/nic/update?hostname=${HOSTNAME}&myip=${IP}"
  curl -s $URL
else
  echo "Dynamic DNS for host  is up-to-date!"
fi
