#
# Cookbook Name:: rep_parent
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'print' do
  command "echo ' >>> #{node[:rep_parent][:text]} <<< '"
end