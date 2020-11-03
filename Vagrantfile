# -*- mode: ruby -*-
# vi: set ft=ruby :

HOSTNAME="elk"
IP="192.168.1.231"

Vagrant.configure(2) do |config|
  config.vm.box = "minimal/xenial64" # 16.04
  config.vm.provider "virtualbox" do |vb|
        vb.memory = "1536"
  end

  config.vm.define HOSTNAME do |n|
    n.vm.network :public_network, ip: IP
    n.vm.hostname = HOSTNAME
    n.vm.provision "shell", path: "elk-install.sh", :args => [HOSTNAME, IP]
    config.vm.provision "file", source: "./elk", destination: "/home/vagrant/elk"
  end
end
