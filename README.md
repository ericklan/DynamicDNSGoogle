# DynamicDNSGoogle
A simple shell script to update your Google Domains synthetic record, keeping it in sync with your current external IP


## Google Domains provides an API to update a DNS
### "Synthetic record". This script updates a record with
### the script-runner's public IP address, as resolved using a DNS
### lookup.

 
#### crond - daemon to execute scheduled commands
      crontab -e

     # m h  dom mon dow   command
     */1 * * * *  /home/user1/task/DynamicDNSGoogle/DynamicDNSGoogle.sh

#### You can do this to newer syslog files:
   tail -F /var/log/syslog 
