#!/bin/bash

echo "Update System"
sudo apt-get update -y
sudo apt update && sudo apt dist-upgrade -y
clear

echo "Install Applikations"
sudo apt install nano
sudo apt install task-lxde-desktop -y
sudo apt install xserver-xephyr -y
clear

echo "Disable lightdm logon"
sudo systemctl disable lightdm
clear

echo "Making Desktop Launcher"
cat << 'EOF' | sudo tee /usr/bin/gxd > /dev/null
Xephyr -br -fullscreen -resizeable :20 &
sleep 5
DISPLAY=:20 startlxde &

EOF

echo "Make script executeable"
sudo chmod +x /usr/bin/gxd

echo "Installing tldr"
sudo apt install tldr -y
clear

echo "Finishing setup"
tldr -u
sudo poweroff
