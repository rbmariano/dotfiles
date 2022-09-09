#!/bin/bash

# Docker - Start and enable on boot
sudo systemctl start docker.service

sudo systemctl enable docker.service
sudo systemctl enable containerd.service


# Docker - non sudo
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker


# FSTRIM - SSD
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer


# Set ZSH default shell
chsh -s $(which zsh)
