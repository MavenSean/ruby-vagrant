# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "ruby"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path	= "puppet/manifests"
    puppet.module_path		= "puppet/modules"
    puppet.manifest_file	= "development.pp"
  end
  #config.vm.provision :shell, :path => "bootstrap.sh"

  # Change 4096 to whatever amount of memory you want allocated to Vagrant
  config.vm.customize ["modifyvm", :id, "--memory", 4096]

  config.vm.network :hostonly, "33.33.33.32"

  # Forward both web port and rails port
  config.vm.forward_port 8080, 8080
  config.vm.forward_port 3000, 3000

  # Changes ../backend to whatever relative path your backend repo is checked out to, no trailing /
  config.vm.share_folder "webroot", "/var/www", "../web", :nfs => true
end
