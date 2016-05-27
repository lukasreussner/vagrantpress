# -*- mode: ruby -*-
# vi: set ft=ruby :

<<<<<<< HEAD
Vagrant.configure("2") do |config|
  config.vm.box = "trusty64"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # allows running commands globally in shell for installed composer libraries
  config.vm.provision :shell, path: "files/scripts/setup.sh"

  # setup virtual hostname and provision local IP
  config.vm.hostname = "vagrantpress.dev"
  config.vm.network :private_network, :ip => "192.168.50.4"
  config.hostsupdater.aliases = %w{www.vagrantpress.dev}
  config.hostsupdater.remove_on_suspend = true
=======
# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Include the configuration file
CONFIG = "#{File.dirname(__FILE__)}/config.rb"
puts CONFIG
if File.exist?(CONFIG)
  require CONFIG
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Using the default hashicorp / Ubuntu 12.04 LTS version.
  # If you would like to use a different box, edit this parameter.
  puts $options
  if $options.key?(:box_file)
    config.vm.box = $options[:box_file]
  else
    puts "Using Default"
    config.vm.box = "hashicorp/precise32"
  end

  # Set a box hostname
  if $options.key?(:box_hostname)
    config.vm.hostname = $options[:box_hostname]
  else
    config.vm.hostname = 'vagrantpress'
  end

  # config.vm.box_url = "http://domain.com/path/to/above.box"

  # Forwarded ports for the virtual box.  If you would like to
  # connect to the box on port 8080. you'll want to uncomment
  # that line.  For using virtual hosts, you may want to modify this
  # to...
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3306, host:13306


  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"



  # A bootstrapping shell for checking for puppet.
  config.vm.provision "shell", path: "shell/bootstrap.sh"
>>>>>>> vagrantpress/2.0

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    #puppet.module_path = "puppet/modules"
    puppet.manifest_file  = "site.pp"
    puppet.working_directory = '/vagrant/puppet'
    puppet.manifest_file  = "site.pp"
    puppet.facter = {
        "webserver" => $options[:webserver]

    }
    #puppet.options = "--hiera_config=/vagrant/puppet/hiera.yaml"
    #puppet.options="--verbose --debug"
  end
<<<<<<< HEAD
  
  # Fix for slow external network connections
  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
  end
end
=======

end
>>>>>>> vagrantpress/2.0
