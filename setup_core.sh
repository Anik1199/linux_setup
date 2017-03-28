#!/bin/bash
#
# Copyright (C) 2017, Anik khan "Anik1199" <anik@lineageos.org>
#
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# Please maintain this if you use this script or any part of it.
#

set -e

clear

echo Installing needed Dependencies
sudo apt update -y
sudo apt install -y arj dconf-editor nautilus-dropbox evolution figlet file-roller git gpick glances \
gparted grsync hardinfo mpack openshot plank ppa-purge p7zip-rar p7zip-full screenruler screenfetch \
rar scrot shutter slurm synapse thunar unace unrar sharutils uudeview vlc vnstat
echo Dependencies installed!

clear

# Adapta
echo Installing Adapta
# If previous versions were installed/existed, remove them first.
sudo rm -rf /usr/share/themes/{Adapta,Adapta-Eta,Adapta-Nokto,Adapta-Nokto-Eta}
rm -rf ~/.local/share/themes/{Adapta,Adapta-Eta,Adapta-Nokto,Adapta-Nokto-Eta}
rm -rf ~/.themes/{Adapta,Adapta-Eta,Adapta-Nokto,Adapta-Nokto-Eta}
sudo add-apt-repository ppa:tista/adapta
sudo apt -y update
sudo apt install -y adapta-backgrounds adapta-gtk-theme
echo Adapta installed!

clear

# Atom
echo Installing Atom
rm /tmp/atom-amd64.deb

wget https://atom.io/download/deb -O /tmp/atom-amd64.deb
sudo dpkg -i /tmp/atom-amd64.deb

rm /tmp/atom-amd64.deb
echo Atom installed!

clear

# Boot Repair
echo Installing Boot Repair
sudo add-apt-repository -y ppa:yannubuntu/boot-repair
sudo apt -y update
sudo apt install -y boot-repair
echo Boot Repair installed!

clear

# Google Chrome
echo Installing Google Chrome
rm /tmp/google-chrome-stable_current_amd64.deb

echo Downloading latest stable edition of google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb
sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb

rm /tmp/google-chrome-stable_current_amd64.deb
echo Google Chrome installed!

clear

# Grub Customizer
echo Installling Grub Customizer
sudo add-apt-repository ppa:danielrichter2007/grub-customizer -y
sudo apt -y update
sudo apt install -y grub-customizer
echo Grub Customizer installed!

clear

# Numix Icon
echo Installing Numix Icon
sudo add-apt-repository ppa:numix/ppa -y
sudo apt -y update
sudo apt install -y numix-gtk-theme numix-icon-theme-circle
echo Numix Icon installed!

clear

# Skype
echo Installing Skype
rm /tmp/skypeforlinux-64-alpha.deb

wget https://go.skype.com/skypeforlinux-64-alpha.deb -O /tmp/skypeforlinux-64-alpha.deb
sudo apt install -y libjpeg62:i386
sudo dpkg -i /tmp/skypeforlinux-64-alpha.deb

rm /tmp/skypeforlinux-64-alpha.deb
echo Skype installed!

clear

# Slack
echo Installing Slack
rm /tmp/slack-desktop-2.2.1-amd64.deb

wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.2.1-amd64.deb -O /tmp/slack-desktop-2.2.1-amd64.deb
sudo dpkg -i /tmp/slack-desktop-2.2.1-amd64.deb

rm /tmp/slack-desktop-2.2.1-amd64.deb

echo Fixing hardcoded icon
old="Icon=\/usr\/share\/pixmaps\/slack.png"
new="Icon=slack"
location="/usr/share/applications/slack.desktop"
sudo sed -i s/$old/$new/g $location
echo Slack installed!

clear

# Spotify
echo Installing Spotify

# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt -y update

# 4. Install Spotify
sudo apt install -y spotify-client
echo Spotify installed!

clear

# Sublime text 3
echo Installing Sublime Text Editor
rm /tmp/sublime-text_build-3126_amd64.deb

wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb -O /tmp/sublime-text_build-3126_amd64.deb
sudo dpkg -i /tmp/sublime-text_build-3126_amd64.deb

rm /tmp/sublime-text_build-3126_amd64.deb
echo Sublime Text Editor installed!

clear

# Teamviewer
echo Installing Teamviewer
rm /tmp/teamviewer_i386.deb

wget https://download.teamviewer.com/download/teamviewer_i386.deb -O /tmp/teamviewer_i386.deb
sudo apt install -y libjpeg62:i386
sudo dpkg -i /tmp/teamviewer_i386.deb

rm /tmp/teamviewer_i386.deb
echo Teamviewer installed!

clear

# Telegram
echo Installing Telegram
sudo add-apt-repository -y ppa:atareao/telegram
sudo apt -y update
sudo apt install -y telegram

echo Fixing hardcoded icon
old="Icon=\/opt\/telegram\/telegram.svg"
new="Icon=telegram"
location="/usr/share/applications/telegram.desktop"
sudo sed -i s/$old/$new/g $location
echo Telegarm installed!

# Virtual Box
echo Installing Virtual Box
rm /tmp/virtual-box.deb
wget http://download.virtualbox.org/virtualbox/5.1.18/virtualbox-5.1_5.1.18-114002~Ubuntu~xenial_amd64.deb -O /tmp/virtual-box.deb
sudo dpkg -i /tmp/virtual-box.deb

rm /tmp/virtual-box.deb
echo Virtul Box installed!

echo Setup Completed! Reboot may required.
