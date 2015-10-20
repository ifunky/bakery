# -*- mode: ruby -*-
# vi: set ft=ruby :

begin
  gem "puppet"
rescue Gem::LoadError
  raise "puppet is not installed in vagrant gems! please run 'vagrant plugin install puppet'"
end

VAGRANTFILE_API_VERSION = "2"
ENV['ENVIRONMENT'] = "vagrant"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  required_plugins = %w(vagrant-r10k vagrant-triggers)
  plugin_installed = false

  ## Install Vagrant Plugins
  required_plugins.each do |plugin|
    unless Vagrant.has_plugin? plugin
      system "vagrant plugin install #{plugin}"
      plugin_installed = true
    end
  end

  ## Restart Vagrant: if new plugin installed
  if plugin_installed == true
    exec "vagrant #{ARGV.join(' ')}"
  end

  #config.trigger.before :ALL do
  #  run "mkdir puppet/environments/vagrant/modules"
  #end

  config.vm.define "centos" do |centos|
    centos.vm.hostname  = "basecentos"
    centos.vm.box 		  = "centos"
    centos.vm.box_url   = "centos-7.1.box"
	  centos.ssh.username	= "vagrant"
	  centos.ssh.password	= "vagrant"
	
    if Vagrant.has_plugin?("vagrant-cachier")
    	centos.cache.scope       = :machine
    	centos.cache.auto_detect = false
    end

    centos.vm.network "private_network", ip: "192.168.33.11"

    centos.vm.provider :virtualbox do |v, override|
        v.gui = true
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", 1]
    end
  end

  config.vm.define "puppetmaster" do |puppetmaster|
    puppetmaster.r10k.puppet_dir = "puppet/environments/vagrant"
    puppetmaster.r10k.puppetfile_path = "puppet/environments/vagrant/Puppetfile"
    puppetmaster.r10k.module_path = "puppet/environments/vagrant/modules"

    puppetmaster.vm.hostname  = "puppetmaster"
    puppetmaster.vm.box 		  = "puppetmaster"
    puppetmaster.vm.box_url   = "centos-7.1.box"
    puppetmaster.ssh.username	= "vagrant"
    puppetmaster.ssh.password	= "vagrant"

    if Vagrant.has_plugin?("vagrant-cachier")
      centos.cache.scope       = :machine
      centos.cache.auto_detect = false
    end

    puppetmaster.vm.network "private_network", ip: "192.168.33.12"
    puppetmaster.vm.network "forwarded_port", guest: 8140, host: 8140, auto_correct: true
    puppetmaster.vm.network "forwarded_port", guest: 80, host: 8082, auto_correct: true

    puppetmaster.vm.provider :virtualbox do |v, override|
      v.gui = true
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--cpus", 1]
    end

    puppetmaster.vm.provision :puppet do |puppet|
      puppet.binary_path       = "/opt/puppetlabs/bin"
      #puppet.hiera_config_path = "puppet/hiera.yaml"
      puppet.environment       = ENV['ENVIRONMENT']
      puppet.environment_path  = "puppet/environments"
      puppet.manifests_path    = "puppet/environments/vagrant/manifests"
      puppet.module_path	     = "puppet/environments/vagrant/modules"
      puppet.manifest_file     = "default.pp"
      puppet.facter            = {
          "instance_base" => "puppetmaster"
      }
      puppet.options        = ["--verbose"]

      puppetmaster.vm.synced_folder "puppet", "/etc/puppetlabs/code/environments/vagrant", id: "vagrant-puppet-root"
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
