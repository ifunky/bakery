# -*- mode: ruby -*-
# vi: set ft=ruby :

#begin
#  gem "puppet"
#rescue Gem::LoadError
#  raise "puppet is not installed in vagrant gems! please run 'vagrant plugin install puppet'"
#end

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "centos" do |centos|
    centos.vm.hostname  = "basecentos"
    centos.vm.box 		  = "centos"
    centos.vm.box_url   = "centos-7.1.box"
	  centos.ssh.username	= "vagrant"
	  centos.ssh.password	= "vagrant"
    centos.ssh.insert_key = false

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

  config.vm.define "win2012" do |win2012|

    win2012.vm.communicator = "winrm"
    win2012.winrm.username = "vagrant"
    win2012.winrm.password = "vagrant"

    win2012.vm.guest = :windows
    win2012.windows.halt_timeout = 15

    config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true

    win2012.vm.hostname = "windows2012"
    win2012.vm.box = "windows2012"
    win2012.vm.box_url = "windows_2012_r2_virtualbox.box"
    win2012.vm.network "private_network", ip: "192.168.33.12"

    win2012.vm.provider :virtualbox do |v, override|
      v.gui = true
      v.customize ["modifyvm", :id, "--memory", 2024]
      v.customize ["modifyvm", :id, "--cpus", 2]
    end

  end

end
