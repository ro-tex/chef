#
# Cookbook Name:: rep_child
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'rep_parent::default'

execute 'print_child' do
  command "echo ' >>> #{node[:rep_child][:text]} <<< '"
end