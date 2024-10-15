#!/bin/bash

if [[ ! $# == 1 ]];then
echo "${0} host"
exit
fi

cat ~/.ssh/id_rsa.pub | ssh ${1} 'umask 0077; mkdir -p .ssh; cat >> .ssh/authorized_keys && echo "Key copied"'
