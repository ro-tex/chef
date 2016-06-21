#
# Cookbook Name:: ro-tex_ruby
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'rvm::system_install'

# https://docs.chef.io/resource_file.html

# Use the cookbook_file resource to copy a file from a cookbook’s /files directory. 
# Use the template resource to create a file based on a template in a cookbook’s /templates 
# directory. And use the remote_file resource to transfer a file to a node from a remote location.
template '/etc/init.d/optimo_ui' do
  source 'optimo_ui.erb'
  mode '0755'
  owner 'root'
  group 'root'
  notifies :run, 'execute[echo]', :immediately
end

execute 'echo' do
  command 'echo " >>> THIS IS SOME OUTPUT <<< "'
  action :nothing
end