#!/bin/zsh

# Move files to $HOME
mv $HOME/.zshrc .zshrc.bak
cp ./files/home/* $HOME/
source ~/.zshrc

# Setup apt with point-release repo
mv /etc/apt/sources.list /etc/apt/sources.list.bak
cp ./files/sources.list /etc/apt/sources.list
sudo apt update

# Install programs
# General tools
sudo apt install exa

# Rev and BinEx
sudo apt install patchelf gdb checksec
cargo install pwninit

# Steg
pip3 install flare-floss --user
sudo apt install foremost binwalk

# Network
sudo apt install nmap
