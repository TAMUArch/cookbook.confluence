default['confluence']['user'] = 'confluence'
default['confluence']['group'] = 'confluence'
default['confluence']['install_dir'] = '/opt'
default['confluence']['home_directory'] = '/var/confluence'

default['confluence']['version'] = '5.8.14'
default['confluence']['download_url'] = 'http://www.atlassian.com/software/confluence/downloads/binary/'

default['confluence']['app_properties']['confluence_home'] = node['confluence']['home_directory']

# To enable ssl forwarding from a loadbalancer set https_proxy to
# true and update the proxy name.
default['confluence']['https_proxy'] = false
default['confluence']['proxy']['name'] = node['fqdn']
default['confluence']['proxy']['port'] = 443
default['confluence']['proxy']['scheme'] = 'https'
