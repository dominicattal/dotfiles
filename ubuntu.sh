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

sudo apt install gcc make cmake git gnome-shell-extensions exuberant-ctags
git clone https://github.com/neovim/neovim.git
gnome-extensions disable ubuntu-dock@ubuntu.com
make -C neovim/ CMAKE_BUILD_TYPE=RelWithDebInfo
make -C neovim/ install
mkdir -p "/home/$username/.config/nvim/" 
cp ./init.lua "/home/$username/.config/nvim/init.lua"
chown "$username" "/home/$username/.config" -R

