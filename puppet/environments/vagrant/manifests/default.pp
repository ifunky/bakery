node default {
  if $::instance_base == "puppetmaster" {
    #hiera_include('classes','vagrantbase::master')
    notify { 'Im a puppet master!!': }

    package {'vim-enhanced':
      ensure => latest,
    }

    package { 'deep_merge':
      ensure   => 'installed',
      provider => 'gem',
    }

    package {'highline':
      ensure   => installed,
      provider => 'gem',
    }

    package { 'hiera-eyaml':
      ensure   => installed,
      provider => 'gem',
      require  => Package['highline']
    }

    package {'puppetserver':
      ensure => latest,
    }

    ini_setting { 'dns_alt_names':
      ensure  => present,
      path    => '/etc/puppetlabs/puppet/puppet.conf',
      section => 'master',
      setting => 'dns_alt_names',
      value   => "${fqdn} puppet",
      require => Package['puppetserver'],
    }

    ini_setting { 'autosign':
      ensure  => present,
      path    => '/etc/puppetlabs/puppet/puppet.conf',
      section => 'master',
      setting => 'autosign',
      value   => 'true',
      require => Package['puppetserver'],
    }

    ini_setting { 'init.config.javaheap':
      ensure  => present,
      path    => '/etc/sysconfig/puppetserver',
      section => '',
      setting => 'JAVA_ARGS',
      value   => "\"-Xms512m -Xmx512m -XX:MaxPermSize=256m\"",
      require => Package['puppetserver'],
    }

    ini_setting { 'trusted_server_facts':
      ensure  => present,
      path    => '/etc/puppetlabs/puppet/puppet.conf',
      section => 'main',
      setting => 'trusted_server_facts',
      value   => 'true',
    }

    ini_setting { 'strict_variables':
      ensure  => present,
      path    => '/etc/puppetlabs/puppet/puppet.conf',
      section => 'main',
      setting => 'strict_variables',
      value   => 'true',
    }

    #  Puppet agent settings
    ini_setting { 'pluginsync':
      ensure  => present,
      path    => '/etc/puppetlabs/puppet/puppet.conf',
      section => 'main',
      setting => 'pluginsync',
      value   => 'false',
    }

    ini_setting { 'environment':
      ensure  => present,
      path    => '/etc/puppetlabs/puppet/puppet.conf',
      section => 'main',
      setting => 'environment',
      value   => "${environment}",
    }

    ini_setting { 'server':
      ensure  => present,
      path    => '/etc/puppetlabs/puppet/puppet.conf',
      section => 'main',
      setting => 'server',
      value   => 'basecentos',
    }

    ini_setting { 'autoflush':
      ensure   => present,
      path     => '/etc/puppetlabs/puppet/puppet.conf',
      section  => 'main',
      setting  => 'autoflush',
      value    => 'true',
    }

    ini_setting { 'report':
      ensure   => present,
      path     => '/etc/puppetlabs/puppet/puppet.conf',
      section  => 'main',
      setting  => 'report',
      value    => 'true',
    }


  }

  if $::instance_base == "windows2012" {
    #hiera_include('classes','vagrantbase::win2012')
    notify { 'Im a windows 2012 server!!': }
  }
}