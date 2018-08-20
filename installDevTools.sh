#!/bin/bash
sudo yum update && sudo yum -y install kernel-$(uname -r) kernel-headers kernel-devel ocaml
sudo yum install -y wget java-1.7.0-openjdk java-1.7.0-openjdk-devel unzip git ruby vim

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
  curl -o unison.tar.xz https://raw.githubusercontent.com/moisbo/vagrant-redbox-dev/master/unison-2.48.4-2-x86_64.pkg.tar.xz
  sudo tar xf unison.tar.xz -C /
  echo local machine should have same version if cannot install with brew check Formulae https://github.com/Homebrew/homebrew-core/blob/master/Formula/unison.rb
  # Or You can try to compile it!
  #curl -o unison.tar.gz https://github.com/bcpierce00/unison/archive/v2.51.2.tar.gz
  # sudo tar zxf unison.tar.xz -C
  # cd unison
  # make -j2
  # make install
fi

# installing ntpd
sudo yum install -y ntp
sudo systemctl enable ntpd
sudo systemctl start ntpd
