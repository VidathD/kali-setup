#!/bin/zsh

# Move files to $HOME
mv $HOME/.zshrc .zshrc.bak
cp ./files/home/* $HOME/

# Setup apt with point-release repo
mv /etc/apt/sources.list /etc/apt/sources.list.bak
cp ./files/sources.list /etc/apt/sources.list
