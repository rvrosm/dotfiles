#!/usr/bin/env bash
#
#
if [[ -z $2 ]]; then
	echo "Usage: $0 port username"
	exit 1;
fi

port=${1}
username=${2}

sed -i '/^Port.*/d' /etc/ssh/sshd_config
sed -i '/^PermitRootLogin.*/d' /etc/ssh/sshd_config
sed -i '/^PubkeyAuthentication.*/d' /etc/ssh/sshd_config
sed -i '/^PasswordAuthentication.*/d' /etc/ssh/sshd_config

echo "Port ${port}" >> /etc/ssh/sshd_config
echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config
echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config
echo "AllowUsers ${username}" >> /etc/ssh/sshd_config
