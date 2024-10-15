#!/usr/bin/env bash
#
if [ "$EUID" -ne 0 ]; then
  echo "This script requires root privileges. Please run as root."
  exit 1
fi

if [ -z "$1" ]; then
  echo "Usage: `basename $0` utunX"
  exit 1
fi

ip -6 r d ::/1
ip -6 r d 8000::/1
ip -6 r a ::/1 dev ${1}
ip -6 r a 8000::/1 dev ${1}
