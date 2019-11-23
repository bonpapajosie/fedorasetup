#!/usr/bin/bash
cd ~
# First we setup the repositories so we can install lots of stuff
# Set Virtual Box repo
wget https://raw.githubusercontent.com/bonpapajosie/fedorasetup/master/fedora.packages
wget https://raw.githubusercontent.com/bonpapajosie/fedorasetup/master/bashrc.aliases
# Install Google Chrome repo
sudo dnf install fedora-workstation-repositories -y
# Install Rpmfusion repo
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# Update cache for package installs
sudo dnf makecache
# Install Dropbox
sudo dnf install https://www.dropbox.com/download?dl=packages/fedora/nautilus-dropbox-2015.10.28-1.fedora.x86_64.rpm -y
# Install TeamViewer
sudo dnf install https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm -y
# grab all packages to install
sudo dnf install $(cat ~/fedora.packages) -y

#Custom shell prompt with aliases Source: https://www.linuxquestions.org/questions/linux-general-1/ultimate-prompt-and-bashrc-file-4175518169/
cat ~/bashrc.aliases >> ~/.bashrc

#Disable Wayland and use Xorg
sudo sed -i '/WaylandEnable/s/^#//g' /etc/gdm/custom.conf
