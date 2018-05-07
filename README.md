Vagrant configuration for ReDBox development environment using VirtualBox
====================

Installation instructions
## 1. [Install Homebrew](http://brew.sh/)
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

## 2. Install Vagrant
`brew install vagrant`
or
`brew cask install vagrant`

## 3. Configure source directory to be mounted on box
Edit the Vagrantfile and set the config.unison.host_folder to the directory you'd like to sync

## 4. Bring box up
`vagrant up`

Your box should initialise and install all the required development tools

## 5. Install unison on local machine
`brew install unison`

## 6. Install vagrant unison plugin
`vagrant plugin install vagrant-unison2`

## 7. Start unison file synching
`vagrant unison-sync-polling`

This will start polling every second your local machine share directory and the directory on the virtual machine and keep them in sync as files change. You may want to do this in another console window as this will stay running until you hit Ctrl+C

- If there is an error mentioning inconsistent state, try deleting the archives:
    On Mac OS X, the local files are stored in ~/Library/Application\ Support/Unison you can also create a ~/.unison folder (if it is already not created) so that Unison stores the archives in that location

### Sync Issues

- Run `vagrant unison-cleanup` this will delete the files in the guest machine
- Delete `~/.unison/` key files on host machine

## 8. SSH onto box
`vagrant ssh`
