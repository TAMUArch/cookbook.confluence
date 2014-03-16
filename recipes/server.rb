directory node['confluence']['directory'] do
  action :create
  owner node['confluence']['user']
  group node['confluence']['group']
  mode 0754
end

confluence_package = "atlassian-confluence-#{node['confluence']['version']}.tar.gz"

ark 'confluence' do
  url "#{node['confluence']['download_url']}/#{confluence_package}"
  action :put
  path node['confluence']['directory']
  only_if { node['confluence']['installed_version'] != node['confluence']['version'] }
  owner node['confluence']['user']
  group node['confluence']['group']
  notifies :create, 'ruby_block[set_installed_confluence_version]', :immediately
end

ruby_block 'set_installed_confluence_version' do
  block do
    node.set['confluence']['installed_version'] = node['confluence']['version']
    node.save
  end
  not_if { Chef::Config[:solo] }
  action :nothing
end

directory node['confluence']['home_directory'] do
  action :create
  owner node['confluence']['user']
  group node['confluence']['group']
  mode 0754
end

template ::File.join(node['confluence']['directory'], 'confluence/confluence/WEB-INF/classes/confluence-init.properties') do
  action :create
  owner node['confluence']['user']
  group node['confluence']['group']
  mode 0644
  source 'confluence-init.properties.erb'
  notifies :restart, 'service[confluence]', :delayed
end

template '/etc/init.d/confluence' do
  action :create
  mode 0744
  source 'confluence.erb'
end

service 'confluence' do
  action [:enable, :start]
end
