#
## Cookbook Name:: sensu
## Recipe:: client
##
## Copyright 2013
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##

#Install sensu plugins 
  remote_directory "/etc/sensu/plugins" do
    files_mode '755'
    mode '755'
    owner 'sensu'
    group 'sensu'
    source "plugins"
  end


  template "/etc/default/sensu" do
    #notifies :restart, 'service[sensu-client]', :delayed
    owner 'root'
    group 'root'
    source 'sensu.erb'
    variables(
      sensu_ruby: "#{node['sensu']['sensu_ruby']}"
    )
  end

  template "/etc/sensu/conf.d/client.json" do
    notifies :restart, 'service[sensu-client]', :delayed
    owner 'sensu'
    group 'sensu'
    source 'client.json.erb'
    variables(
      ipaddress: "#{node['ipaddress']}",
      fqdn:  "#{node['fqdn']}",
      subscriptions: "#{node['sensu']['subscriptions']}"
    )
  end

  template "/etc/sensu/config.json" do
    notifies :restart, 'service[sensu-client]', :delayed
    owner 'sensu'
    group 'sensu'
    source 'config.json.erb'
    variables(
      sensu_server: "#{node['sensu']['ipaddress']}",
      vhost:  "#{node['sensu']['vhost']}",
      user: "#{node['sensu']['user']}",
      password: "#{node['sensu']['password']}",
    )
  end

  service 'sensu-client' do
    action :start
    supports restart: true, status: true
  end


