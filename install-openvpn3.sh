#!/bin/bash

# remove yourself
rm $0

# install dependencies
sudo apt install apt-transport-https

# add key
wget https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub
sudo apt-key add openvpn-repo-pkg-key.pub
rm openvpn-repo-pkg-key.pub

# focal
DISTRO=$(sudo cat /etc/os-release | grep VERSION_CODENAME | cut -d '=' -f2)

# source
sudo wget -O /etc/apt/sources.list.d/openvpn3.list https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-$DISTRO.list

# update
sudo apt update

# install openvpn3
sudo apt install -y openvpn3

echo
echo '"openvpn3" is now on the path'
