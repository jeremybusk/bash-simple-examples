#!/bin/bash
set -aeu
. .env

dir="/tmp/my/certdir"
hosts=(
"foo01"
"foo02")

for host in ${hosts[@]}; do
  echo "Checking $host"
  sshpass -p ${USERPASS} ssh -o StrictHostKeyChecking=no ${USERNAME}@${host} bash -c "hostname; openssl x509 -text -in ${dir}/$host.crt | grep \"Not After\"" || true
done
