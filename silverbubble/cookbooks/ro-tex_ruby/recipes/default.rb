#
# Cookbook Name:: ro-tex_ruby
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# This is how we inspect the resulting node object:
# puts "\n\n\n>>>>>"
# puts node.default.inspect
# puts node['override'].inspect
# puts "<<<<<\n\n\n"

# This piece grabs the override attributes that might come with roles and applies them
unless node['override'].nil? || node['override']['ro-tex_ruby'].nil? || node['override']['ro-tex_ruby']['ruby_version'].nil?
  node.default['rvm']['default_ruby'] = node['override']['ro-tex_ruby']['ruby_version']
  node.default['rvm']['user_default_ruby'] = node['override']['ro-tex_ruby']['ruby_version']
end
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
