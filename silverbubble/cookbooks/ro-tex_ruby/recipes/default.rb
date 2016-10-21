#
# Cookbook Name:: ro-tex_ruby
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# This one is custom - it installs ruby and then runs bundler
include_recipe 'rvm::system'

template '/etc/init.d/optimo_ui' do
  source 'optimo_ui.erb'
  mode '0755'
  owner 'root'
  group 'root'
  notifies :run, 'execute[gem]', :immediately
end

execute 'gem' do
  command 'gem install bundler'
  notifies :run, 'execute[bundle]', :immediately
  action :nothing
end

execute 'bundle' do
  command 'cd /opt/Source/optimo_ui && bundle'
  notifies :run, 'execute[service_stop]', :immediately
  action :nothing
end

execute 'service_stop' do
  command 'service optimo_ui stop'
  notifies :run, 'execute[service_start]', :immediately
  action :nothing
end

execute 'service_start' do
  command 'service optimo_ui start'
  action :nothing
end
