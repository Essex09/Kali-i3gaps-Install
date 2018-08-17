#!/bin/bash

# Update
echo -e "Updating Kali"
apt-get update -y

# Install i3 and it's dependencies
sleep .5;
echo -e "\n"
echo -e "Installing i3"
apt-get install i3 -y

# i3-gaps Dependencies
sleep .5;
echo -e "\n"
echo -e "Installing i3-gaps dependencies"
apt-get install -y libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev

# Copy Custom configs
#cd /root/
#git clone https://github.com/Essex09/dotfiles.git

# i3-gaps Installation
sleep .5;
echo -e "\n"
echo -e "Installing i3-gaps"
mkdir gui && cd gui
git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps

## Source: https://github.com/Airblader/i3/wiki/Compiling-&-Installing
# Compile & Install
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

# Disabling sanitizers is important for release versions!
# The prefix and sysconfdir are, obviously, dependent on the distribution.
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

##### Kali Ricing
# lxappearance changes themes and icons
# nitrogen used to change wallpaper
sleep .5;
echo -e "\n"
echo -e "Ricing Kali"
apt-get install -y lxappearance nitrogen arc-theme moka-icon-theme rofi compton xfce4-terminal neofetch

# ddnotes - Dependencies
apt-get install -y xdotools dmenu

cd /usr/
git clone https://github.com/wmutils/core.git && cd core/
make && make install

## ddnotes Installation
cd /root/gui/
git clone https://github.com/umurgdk/ddnotes.git && cp ddnotes/ddnotes /usr/bin/

## Finish
sleep .5;
echo -e "\n"
echo -e "Finished. Please restart to login to i3."
