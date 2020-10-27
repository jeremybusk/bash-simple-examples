#!/usr/bin/env bash
set -e

tail -F my.log | awk '/line/ {++i;printf "\r%d",i}'
