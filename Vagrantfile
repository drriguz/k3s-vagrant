# -*- mode: ruby -*-
# vi: set ft=ruby :

NETWORK_BASE="192.168.100.10"

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/bionic64"
    config.vm.box_check_update = false

    config.vm.provision "shell", path: "common.sh"

    config.vm.define "master", primary: true do |master|
        master.vm.provider "virtualbox" do |vb|
            vb.memory = 1024
            vb.cpus = 1
        end
        master.vm.network "private_network", ip: "#{NETWORK_BASE}0"
        master.vm.hostname = "master"

        master.vm.provision "shell", inline: <<-SHELL
            curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--node-external-ip 192.168.100.100 --tls-san 192.168.100.100" sh -
            cp /var/lib/rancher/k3s/server/node-token /home/vagrant/node-token
            chown vagrant:vagrant /home/vagrant/node-token
        SHELL
    end

    config.vm.provider "virtualbox" do |vb|
        vb.memory = 2048
        vb.cpus = 2
    end

    (1..2).each do |i|
        config.vm.define "node0#{i}" do |node|
            node.vm.network "private_network", ip: "#{NETWORK_BASE}#{i}"
            node.vm.hostname = "node0#{i}"

            node.vm.provision "master-key", type: "file", source: ".vagrant/machines/master/virtualbox/private_key", destination: "/home/vagrant/.ssh/master.key"
            node.vm.provision "shell", path: "install-node.sh"
        end
    end

    
end
