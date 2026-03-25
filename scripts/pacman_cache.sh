#!/bin/bash
echo "=====Arch Linux Cache Cleanup====="

echo "Cleaning pacman cache..."
sudo pacman -Scc
echo "Cleaning yay (AUR) cache..."
yay -Sc --noconfirm
yay -Yc --noconfirm
rm -rf ~/.cache/yay/*

echo "=====Cleanup Complete====="
