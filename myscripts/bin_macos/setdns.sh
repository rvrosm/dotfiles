#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    echo "Usage:`basename ${0}` router|lo|show|search"
    exit 1;
fi

if [ "$1" = "router" ]; then
sudo networksetup -setdnsservers Wi-Fi empty
sudo networksetup -setdnsservers Wi-Fi 192.168.89.64
fi

if [ "$1" = "lo" ]; then
sudo networksetup -setdnsservers Wi-Fi empty
sudo networksetup -setdnsservers Wi-Fi 127.0.0.1
fi

if [ "$1" = "show" ]; then
    scutil --dns | grep 'nameserver\[[0-9]*\]'
fi

if [ "$1" = "search" ]; then
    networksetup -setsearchdomains Wi-Fi lan
fi

# flush dns cache
sudo killall -HUP mDNSResponder
sudo killall mDNSResponderHelper
sudo dscacheutil -flushcache
