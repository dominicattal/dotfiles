#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "this script must be run as root"
    exit 1
fi

if [[ $# -ne 1 ]]; then
    echo "first argument must be username to setup for"
    exit 1
fi

username=$1

#sudo apt install gcc make cmake git gnome-shell-extensions exuberant-ctags curl

# remove ubuntu dock
#gnome-extensions disable ubuntu-dock@ubuntu.com

# download neovim
#git clone https://github.com/neovim/neovim.git
#make -C neovim/ CMAKE_BUILD_TYPE=RelWithDebInfo
#make -C neovim/ install
#mkdir -p "/home/$username/.config/nvim/" 
#cp ./init.lua "/home/$username/.config/nvim/init.lua"
#chown "$username" "/home/$username/.config" -R

# download wezterm
#curl -fsSL https://apt.fury.io/wez/gpg.key | gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
#echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | tee /etc/apt/sources.list.d/wezterm.list
#chmod 644 /usr/share/keyrings/wezterm-fury.gpg
#apt update
#apt install wezterm-nightly
cp ./wezterm.lua "/home/$username/.wezterm.lua"
chown "$username" "/home/$username/.wezterm.lua"




