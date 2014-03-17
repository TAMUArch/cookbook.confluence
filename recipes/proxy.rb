case node['confluence']['proxy']['server']
when 'nginx'
  include_recipe 'nginx'

  vhost_file = ::File.join(node['nginx']['dir'], 'sites-available/confluence')
  template vhost_file do
    action :create
    source 'nginx.conf.erb'
    variables(
      port: node['confluence']['proxy']['port'],
      server_name: node['fqdn'],
      confluence_addr: node['confluence']['proxy']['confluence_addr']
    )
  end

  nginx_site 'confluence' do
    action :enable
  end
else
  Chef::Log.error("#{node['confluence']['proxy']['server']} not currently supported")
end
