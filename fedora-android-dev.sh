#!/usr/bin/env bash

clear

echo -e "Setting up android development tools"
sudo dnf install  android-tools autoconf213 bison bzip2 ccache curl flex gawk gcc-c++ git glibc-devel \
    glibc-static libstdc++-static libX11-devel make mesa-libGL-devel ncurses-devel patch python27 zlib-devel \
    ncurses-devel.i686 readline-devel.i686 zlib-devel.i686 libX11-devel.i686 mesa-libGL-devel.i686 \
    glibc-devel.i686 libstdc++.i686 libXrandr.i686 zip perl-Digest-SHA wget lzop openssl-devel \
    java-1.8.0-openjdk-devel ImageMagick ncurses-compat-libs schedtool

sudo ln -s /usr/lib/libncurses.so.6 /usr/lib/libncurses.so.5
sudo ln -s /usr/lib/libncurses.so.6 /usr/lib/libtinfo.so.5

echo -e "Setting up udev rules for adb"
sudo curl --create-dirs -L -o /etc/udev/rules.d/51-android.rules -O -L https://raw.githubusercontent.com/M0Rf30/android-udev-rules/master/51-android.rules
sudo chmod 644 /etc/udev/rules.d/51-android.rules
sudo chown root /etc/udev/rules.d/51-android.rules
sudo systemctl restart systemd-udevd
adb kill-server
sudo killall adb

echo "Installing repo"
sudo curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
sudo chmod a+x /usr/local/bin/repo

echo "Setting up global git configs"
git config --global user.name "Anik1199"
git config --global user.email "anik@lineageos.org"
git config --global credential.helper "cache --timeout=7200"
