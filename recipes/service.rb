template "/etc/init.d/confluence" do
  action :create
  owner "root"
  group "root"
  mode "744"
  source "confluence.erb"
end

service "confluence" do
  action [ :enable, :start ]
end
