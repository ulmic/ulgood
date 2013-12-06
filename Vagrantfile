# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise32"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-i386-vagrant-disk1.box"
  config.vm.network :public_network
  config.vm.boot_timeout = 180
  config.vm.graceful_halt_timeout = 180
  config.vm.hostname = "ulgood"
  #config.vm.provision :shell, :inline => "curl -L https://www.opscode.com/chef/install.sh | bash"

end
