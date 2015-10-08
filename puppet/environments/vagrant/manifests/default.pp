node default {
  if $::instance_base == "puppetmaster" {
    #hiera_include('classes','vagrantbase::master')
    notify { 'Im a puppet master!!': }

    class { 'puppet': }

  }

  if $::instance_base == "windows2012" {
    #hiera_include('classes','vagrantbase::win2012')
    notify { 'Im a windows 2012 server!!': }
  }
}