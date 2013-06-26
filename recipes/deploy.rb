directory node[:confluence][:directory] do
  action :create
  owner node[:confluence][:user]
  group node[:confluence][:group]
  mode "0754"
end

ark 'confluence' do
  url "#{node[:confluence][:download_url]}/#{node[:confluence][:package]}" 
  action :put
  path node[:confluence][:directory]
  only_if { node[:confluence][:installed_version] != node[:confluence][:version] }
  owner node[:confluence][:user]
  group node[:confluence][:group]
  notifies :create, "ruby_block[set_installed_confluence_version]", :immediately
end

ruby_block "set_installed_confluence_version" do
  block do
    node.set[:confluence][:installed_version] = node[:confluence][:version]
    node.save
  end
  not_if { Chef::Config[:solo] }
  action :nothing
end

directory node[:confluence][:home_directory] do
  action :create
  owner node[:confluence][:user]
  group node[:confluence][:group]
  mode "0754"
end

include_recipe "confluence::configure_application"
include_recipe "confluence::service"
