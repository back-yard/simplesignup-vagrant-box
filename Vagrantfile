# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.box_check_update = false
  config.vm.network "forwarded_port", guest: 80, host: 8080
  # config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.network "public_network"
  config.vm.synced_folder "./simplesignup", "/app"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "2048"
  end
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end
  config.vm.provision "shell", privileged: false, path: "provision.sh"
end
