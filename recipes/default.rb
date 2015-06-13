#
## Cookbook Name:: sensu
## Recipe:: default
##
## Copyright 2013, RiverMeadow, Inc.
##
#

#Create sensu repo
  template '/etc/yum.repos.d/sensu.repo' do
    source 'sensu.repo.erb'
    mode 0755
    owner 'root'
    group 'root'
  end


  use_yum = node['platform'] == 'centos'

  %w(sensu bc).each do|package|
     yum_package package do
       action :install
     end
  end


