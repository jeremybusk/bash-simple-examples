#!/usr/bin/env bash
set -e
logfile=my.log
match='Finished: SUCCESS'
while true; do
  # tail -F -n 0 $logfile | sed "/^$match$/ q" > /dev/null
  tail -F -n 0 $logfile | sed "/$match/ q" > /dev/null
  echo found new instance of $match in $logfile
done
