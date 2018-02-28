Vagrant configuration for ReDBox development environment using VirtualBox
====================

Mac OS Installation instructions
## 1. [Install Homebrew](http://brew.sh/)
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

## 2. Install Vagrant
`brew install vagrant`
or
`brew cask install vagrant`

## 3. Bring box up
`vagrant up`

Your box should initialise and install all the required development tools

## 4. SSH onto box
`vagrant ssh`

---
### Sync Issues

If you get Vagrant errors when mounting synced folder. Installing the VirtualBox Guest Additions can help

`vagrant plugin install vagrant-vbguest`

then

`vagrant destroy && vagrant up`
