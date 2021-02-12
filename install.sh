#!/bin/bash

# Install dependencies
sudo dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file tar bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux netcat lib32gcc1 lib32stdc++6 steamcmd

# Install server
mkdir ~/valheim_server
cd ~/valheim_server
wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh vhserver
./vhserver install

# Configure files and enable boot startup
ln -s ~/.config/unity3d/IronGate/Valheim/ Valheim
cp adminlist.txt ~/Valheim/
cp update_and_start.sh ~/valheim_server/
sudo cp valheim_server.service /etc/systemd/system/
