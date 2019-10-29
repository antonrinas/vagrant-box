# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/bionic64"

  # Mentioning the SSH Username/Password:
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"

  # Begin Configuring
  config.vm.define "lamp" do|lamp|
    lamp.vm.hostname = "lamp" # Setting up hostname
    lamp.vm.network "private_network", ip: "192.168.205.10" # Setting up machine's IP Address
    lamp.vm.provision :shell, path: "script.sh" # Provisioning with script.sh

    lamp.vm.synced_folder "./storage/","/vagrant/storage/", create:true,
    :owner => "vagrant",
    :group => "www-data",
    :mount_options => ["dmode=775","fmode=664"]
  end
  # End Configuring

  # use
  # vagrant reload --provision
  # if you change config
end