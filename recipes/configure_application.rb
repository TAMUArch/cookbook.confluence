template "#{node[:confluence][:directory]}/confluence/confluence/WEB-INF/classes/confluence-init.properties" do
  action :create
  owner node[:confluence][:user]
  group node[:confluence][:group]
  mode "0644"
  source "confluence-init.properties.erb"
  notifies :restart, "service[confluence]", :delayed
end
