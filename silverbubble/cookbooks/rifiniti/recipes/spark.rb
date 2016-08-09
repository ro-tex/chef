#
# Cookbook Name:: rifiniti_maven
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'rifiniti::maven'
include_recipe 'apache_spark::spark-install'
