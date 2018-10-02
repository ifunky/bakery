# -*- mode: ruby -*-
# vi: set ft=ruby :

#begin
#  gem "puppet"
#rescue Gem::LoadError
#  raise "puppet is not installed in vagrant gems! please run 'vagrant plugin install puppet'"
#end

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "devdocker" do |a|
    a.vm.provider "docker" do |d|
      d.build_dir = "."
      #d.image = "centos"
      d.force_host_vm = false
      d.has_ssh = true
      d.cmd = ["tail", "-f"]
      d.remains_running = true
    end
  end


  config.vm.define "centos" do |centos|
    centos.vm.hostname  = "basecentos"
    centos.vm.box 		  = "centos74"
    centos.vm.box_url   = "centos-7.4.box"

    if Vagrant.has_plugin?("vagrant-cachier")
    	centos.cache.scope       = :machine
    	centos.cache.auto_detect = false
    end

    centos.vm.network "private_network", ip: "192.168.33.5"

    centos.vm.provider :virtualbox do |v, override|
        v.gui = true
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", 1]
    end
  end

  config.vm.define "windows" do |windows|

    windows.vm.communicator = "winrm"
    windows.winrm.username = "vagrant"
    windows.winrm.password = "vagrant"

    windows.vm.guest = :windows
    windows.windows.halt_timeout = 15

    config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true

    windows.vm.hostname = "windows2016"
    windows.vm.box = "windows2016Standard"
    windows.vm.box_url = "windows_2016_standard_virtualbox.box"
    windows.vm.network "private_network", ip: "192.168.33.12"

    windows.vm.provider :virtualbox do |v, override|
      v.gui = true
      v.customize ["modifyvm", :id, "--memory", 2024]
      v.customize ["modifyvm", :id, "--cpus", 2]
    end

  end

end
