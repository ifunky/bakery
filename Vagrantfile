# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
ENV['ENVIRONMENT'] = "vagrant"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.librarian_puppet.puppetfile_dir = "puppet/environments/vagrant"

  config.vm.define "centos" do |centos|
    centos.vm.hostname = "basecentos"
    centos.vm.box = "centos"
    if Vagrant.has_plugin?("vagrant-cachier")
    	centos.cache.scope       = :machine
    	centos.cache.auto_detect = false
    end
    centos.vm.box_url = "centos-7.1.box"
    centos.vm.network "private_network", ip: "192.168.33.11"

    centos.vm.provider :virtualbox do |v, override|
        v.gui = true
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", 1]
    end

    centos.vm.provision :puppet do |puppet|
      puppet.binary_path       = "/opt/puppetlabs/bin"
      puppet.hiera_config_path = "puppet/hiera.yaml"
      puppet.environment       = ENV['ENVIRONMENT']
      puppet.environment_path  = "puppet/environments"
      puppet.manifests_path    = "puppet/environments/vagrant/manifests"
      puppet.manifest_file     = "default.pp"
      puppet.facter            = {
                                  "instance_base" => "puppetmaster"
                                 }

      puppet.options        = ["--verbose"]
      # --modulepath /vagrant/puppet/modules","--pluginsync",
      #                         "--verbose","--hiera_config /etc/hiera.yaml", "--environment #{ENV['ENVIRONMENT']}"]


      centos.vm.synced_folder "puppet", "/etc/puppetlabs/code/environments/vagrant", id: "vagrant-puppet-root"
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
    if Vagrant.has_plugin?("vagrant-cachier")
      win2012.cache.scope       = :machine
      win2012.cache.auto_detect = false
    end

    win2012.vm.network "private_network", ip: "192.168.33.12"

    win2012.vm.provider :virtualbox do |v, override|
      v.gui = true
      v.customize ["modifyvm", :id, "--memory", 2024]
      v.customize ["modifyvm", :id, "--cpus", 2]
    end

  end

end
