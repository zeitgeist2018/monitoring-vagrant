#!/bin/bash

# Prepare env variables
export HOSTNAME="$1" && echo "HOST=$HOSTNAME"
export NODE_IP="$2" && echo "NODE_IP=$NODE_IP"


# Install basic packages
sudo apt-get update -y
sudo apt-get install unzip curl vim jq -y
# make an archive folder to move old binaries into
if [ ! -d /tmp/archive ]; then
  sudo mkdir /tmp/archive/
fi

# Install Docker
echo "Docker Install Beginning..."
sudo apt-get remove docker docker-engine docker.io
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce
sudo service docker restart
sudo usermod -aG docker vagrant
sudo docker --version

# Install docker compose
echo "********** INSTALLING DOCKER-COMPOSE **********"
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose  > /dev/null 2>&1
sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version

# Start elk
cd /home/vagrant/elk
docker-compose -f docker-compose.yml \
               -f extensions/logspout/docker-compose.yml \
               up -d
