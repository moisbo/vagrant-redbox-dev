#!/bin/bash
sudo yum install -y wget java-1.7.0-openjdk java-1.7.0-openjdk-devel unzip git ruby
if [ ! -f "/usr/bin/mvn" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  #wget "https://archive.apache.org/dist/maven/binaries/apache-maven-2.2.1-bin.zip"
  #unzip apache-maven-2.2.1-bin.zip
  #mv apache-maven-2.2.1/ /opt/
  #echo "export PATH=/opt/apache-maven-2.2.1/bin:$PATH" >> ~/.bashrc
  sudo curl -s https://bitbucket.org/mjensen/mvnvm/raw/master/mvn > mvn
  sudo mv mvn /usr/bin
  sudo chmod 0755 /usr/bin/mvn
fi

if [ ! -f "/usr/bin/docker-compose" ]; then
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo yum install -y epel-release
sudo yum install -y python-pip
sudo yum install -y gcc
sudo yum install -y python-devel
sudo pip install --upgrade pip
sudo pip install docker-compose
sudo pip install backports.ssl_match_hostname --upgrade
sudo pip install python-glanceclient
sudo yum upgrade -y python*
fi

if [ ! -f "/usr/bin/unison" ]; then
  #If this line fails, it's probably because the version has updated check out http://ftp5.gwdg.de/pub/linux/archlinux/extra/os/x86_64/ and fix the url to get the new version
  curl -o unison.tar.xz http://ftp5.gwdg.de/pub/linux/archlinux/extra/os/x86_64/unison-2.51.2-1-x86_64.pkg.tar.xz
  sudo tar xf unison.tar.xz -C /
fi
# installing ntpd
sudo yum install -y ntp
sudo systemctl enable ntpd
sudo systemctl start ntpd
