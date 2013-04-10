# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "personal"
  config.vm.box_url = "https://dl.dropbox.com/u/7225008/Vagrant/CentOS-6.3-x86_64-minimal.box"
  config.vm.provision :shell, :path => "bootstrap.sh"

  # Change 4096 to whatever amount of memory you want allocated to Vagrant
  config.vm.customize ["modifyvm", :id, "--memory", 4096]

  config.vm.network :hostonly, "33.33.33.32"

  # Forward both web port and solr port
  config.vm.forward_port 8080, 8080

  # Changes ../backend to whatever relative path your backend repo is checked out to, no trailing /
  config.vm.share_folder "webroot", "/var/www", "../web", :nfs => true
end
