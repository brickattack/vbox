# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "Ubuntu1204LTS"
  config.vm.box_url = "http://dl.dropbox.com/u/1537815/precise64.box"
  config.vm.network :private_network, ip: "192.168.0.10"
  config.ssh.forward_agent = true
  config.vm.provision "shell", path: 'setup.sh'
end