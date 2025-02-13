#!/usr/bin/bash

if [ $# -eq 0 ]; then
	echo "Usage: $0 username password port"
	exit 1;
fi

username="${1}"
password="${2}"
port="${3}"
homedir=/home/${username}
ssh_pubkey='ssh-rsa AAAAB3NzaC1yc2EAAAABIwAABAEAwnBemzbCjtnyKLImE7gnqoVRW9HrJHRNxymMDI83jxHlitZKhI0tIP+vXS7YFyRsYlEWKu/NMqxl+KRjsuH/Lv9nbYlnPPLS0hG5l5qfCH4HYNTQdV/suwG1R/eqSMcRUUTG3WMXwp9RyZ7U53F0wa0B1OivpM24WWPtAjoTbFCOS5dhBwXAYd6Ozdb4ZV/ubAQXHSZCl2gDgmzyQ8QolriB6o5jUXVQbIadt7JJWH8qbnWgEVIkwdSxJqp7ft3dvT55yd5XptjwtTB7jONHAQVmG04//9lYoQbDj9HatlQNycMX8CiNupC3BMGAkFcJtrhB9FuKAGzpImxK3YtU8WhJiQVLlYONP1hmQriR8Q2mfjSGIS3gWYx+MoU0AfHnhsohgMtpCp2d+pBGxKO4fYVSdkx+aK3HHWDnrbwd0Mi+k9WDwjLZ6Iq44iKhy+qusmbCnBiQJPOWiJWtKkvVgCjkNLajB1APBycnD8IamuqOMM16vB+HB/xQPlHQTe5XM+LIVV1RcvWiJEA5PWIGT1VFLA8rQk5De1Bj0ie7ADb84aHX1J6dhGyBHiPXowIerVzC0t3RKATJCLdYgWQfTjb+TUJQWczH91Y7yY0JL5lCb33FGt3dIJgjx2NsFn1aOku8xRneWAzKBYWFdqdU5CnSm9i5QEcJjQlEFO0CkE1eyFy9BRqTYI7DzwGBxUZLsdvWWFDcQgWde8/Yt5BRYeEz5Oi3ZfpIFJtZ9aBKie3pLZMZYW8KlNuLmHy80kzB7bkihd6++1MO6BlS9AsaOkX7pnvOjhWTqmyAHXcdNb12pzOssTPX4JDnlhegGcpLhkRl0XSAd2vJRgOt+0fuSJOz+PRA7lPbCZST1mFpjv7ZocEjHBCUPpXHr/vsJsovqcoe7bPpnkfZbTtj+PJa6QoiUPlDTFG3kDL9aURMtWjVGL8Eg7Z9+S+Gi6qQ3GSwVVSvz600ZPik9qfm171drrcWPC9gLwLkRGSInLuvE2COh0g3XV2SVMGSkSsGnZ2s+lWks5/O4SQa7MO2LTiK9Ua3pbPE4e0uZpD36J7izY+ijyAyFCmlIuKpAMmA+YFquHjR26rn1AJw5O6Z+zxF6PSzmeIBfBnMoqYQ7/M+1mJVKEl3cjg4P/cIkcKVFkw//K0xxEDkVhbS7xL1FokhpFK1F5gOLkGwJPPWS1M2bzHGYANCCYnAMc/6aucU65c9QmsYRE617gK+UEQ8AzleP3xSPK/P9ZZCoOglzdspnXn2qSOesfpM0kpvp3okNI2A7H3+IyfmkiLLxPqOZJ60XgcBSZuW2hQbO1bNGc+avbfz+StKYLr9lKpRFhfExJQfMZsnGy+jWKf7IXCi6OKecQ=='

# update system
pacman -Syu
pacman -S --needed vim sudo git base-devel lsof nftables tcpdump tree zsh rsync
pacman -S --needed caddy wireguard-tools shadowsocks-rust

# create user
useradd -ms /usr/bin/zsh ${username}
echo "${username}:${password}" | chpasswd

# config sudoers
echo "${username}    ALL=(ALL:ALL) ALL" >> /etc/sudoers

# config ssh
mkdir -p $homedir/.ssh;
[ -f $homedir/.ssh/authorized_keys ] && /bin/rm -f $homedir/.ssh/authorized_keys
echo "${ssh_pubkey}" >> $homedir/.ssh/authorized_keys
chmod 700 $homedir/.ssh;
chmod 600 $homedir/.ssh/authorized_keys;
chown -R $username:$username $homedir/.ssh

sed -i '/^Port.*/d' /etc/ssh/sshd_config
sed -i '/^PermitRootLogin.*/d' /etc/ssh/sshd_config
sed -i '/^PubkeyAuthentication.*/d' /etc/ssh/sshd_config
sed -i '/^PasswordAuthentication.*/d' /etc/ssh/sshd_config

echo "Port ${port}" >> /etc/ssh/sshd_config
echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config
echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config
echo "AllowUsers ${username}" >> /etc/ssh/sshd_config

# restart ssh
systemctl restart sshd

# Optimize network
cat 10-optimal.conf > /etc/sysctl.d/local.conf
sysctl -p /etc/sysctl.d/local.conf

# show use ulimit -n
cat limits.conf >> /etc/security/limits.conf
