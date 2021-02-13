#!/bin/bash

# Fail out if any errors occur
set -e

script_dir=$(pwd)

# Install dependencies
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y curl wget file tar bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux netcat lib32gcc1 lib32stdc++6 steamcmd libsdl2-2.0-0:i386

# Install server
mkdir ~/valheim_server
cd ~/valheim_server
wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh vhserver
./vhserver install

# Configure files and enable boot startup
mkdir -p ~/.config/unity3d/IronGate/Valheim/
ln -s ~/.config/unity3d/IronGate/Valheim ~/Valheim
cp $script_dir/adminlist.txt ~/Valheim/
cp $script_dir/update_and_start.sh ~/valheim_server/
sudo cp $script_dir/valheim_server.service /etc/systemd/system/
