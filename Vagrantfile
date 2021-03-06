# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  # we can pass a block here, if we want:
  config.vm.define "ivo_vagrant_chef"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network :forwarded_port, guest: 80, host: 2080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision :shell, inline: <<-SHELL
    printf "log_location     STDOUT\nchef_server_url  'https://api.chef.io/organizations/silverbubble'\nvalidation_client_name 'silverbubble-workstation'\nnode_name 'ivo-vagrant-mac'\n" >/etc/chef/client.rb
  SHELL

  config.vm.provider :virtualbox do |vb|
     vb.customize ['modifyvm', :id, '--memory', 1024, '--cpus', '1']
     # vb.gui = false
  end
  
  # config.omnibus.chef_version = :latest

  config.vm.provision :chef_client do |chef|
    
    chef.node_name = 'ivo-vagrant-mac'

    chef.chef_server_url = 'https://api.chef.io/organizations/silverbubble'
    
    # This is basically where to store chef stuff on the node
    # chef.provisioning_path = '/etc/chef'

    chef.validation_client_name = 'inovakov'
    chef.validation_key_path = 'silverbubble/.chef/inovakov.pem'
    
    # Add a run list
    # chef.run_list = [ "recipe[java_wrapper::default]" ]

    # Add a recipe
    # chef.add_recipe "rep_child"

    # Or maybe a role
    chef.add_role 'child'

    # chef.environment = "development"

    # cleanup on teardown
    chef.delete_node = true
    chef.delete_client = true
  end
end
