template '/etc/init.d/confluence' do
  action :create
  mode 0744
  source 'confluence.erb'
end

service 'confluence' do
  action [ :enable, :start ]
end
