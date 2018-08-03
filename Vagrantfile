# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "centos/7"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 1500, host: 1500
  config.vm.network "forwarded_port", guest: 25, host: 25
  config.vm.network "forwarded_port", guest: 27017, host: 27017
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.1 68.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  #config.vm.synced_folder "/Users/moises/source/code.research/sails-hook-redbox-omero", "/opt/hooks/sails-hook-redbox-omero", id: "omero"
  config.vm.synced_folder "/Users/moises/source/qcif/sails-hook-redbox-gitlab", "/opt/hooks/sails-hook-redbox-gitlab", id: "gitlab"
  # Required configs
  #config.unison.host_folder = "/Users/moises/source/qcif/redbox-portal"  #relative to the folder your Vagrantfile is in
  config.unison.host_folder = "/Users/moises/source/github/redbox-portal"  #relative to the folder your Vagrantfile is in
  #config.unison.host_folder = "/Users/moises/source/github.com-uts/redbox-portal"  #relative to the folder your Vagrantfile is in
  config.unison.guest_folder = "/opt/redbox-portal" #relative to the vagrant home folder (e.g. /home/vagrant)
  config.unison.perms = 0
  config.unison.ignore = "Name {.DS_Store,.git,node_modules, *.swp}"
  config.vm.provider 'virtualbox' do |vb|
   vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]
   vb.memory = 3072
   vb.cpus = 2
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
  config.vm.provision "file", source: "installDevTools.sh", destination: "installDevTools.sh"
  config.vm.provision "shell", inline: "chmod +x installDevTools.sh; ./installDevTools.sh"
end
