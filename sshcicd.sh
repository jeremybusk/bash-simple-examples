#!/usr/bin/env bash
set -e
host=dnsmasq.example.com
echo "Running dns stub resolvers deploy/refresh."
eval $(ssh-agent -s)
echo "$SSH_SECRET_KEY" | tr -d '\r' | ssh-add - > /dev/null
scp -P 22 dnsmasq.conf dnsmasq.hosts root@$host:/etc/
ssh -p 22 root@$host "systemctl restart dnsmasq"

# NOTES
# ssh root@myhost "bash -s" -- < ./localdnstests
# ssh-keyscan -t ed25519 -p 20004 myhost >> ~/.ssh/known_hosts
# [[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" >> ~/.ssh/config
