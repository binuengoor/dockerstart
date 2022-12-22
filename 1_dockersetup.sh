#!/bin/sh
# uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc -y

# Update the apt package index and install packages to allow apt to use a repository over HTTPS:
sudo apt-get update -y
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
    
#Add Docker’s official GPG key:
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#Use the following command to set up the repository:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#To install the latest version, run:
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

sleep 2
# versions
echo "hopefully its done now"
sleep 2
docker --version
docker compose version

sleep 2

echo 

# sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
