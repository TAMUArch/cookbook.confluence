default['confluence']['user'] = 'confluence'
default['confluence']['group'] = 'confluence'
default['confluence']['install_dir'] = '/opt'
default['confluence']['home_directory'] = '/var/confluence'

default['confluence']['version'] = '5.4.2'
default['confluence']['download_url'] = 'http://www.atlassian.com/software/confluence/downloads/binary/'

default['confluence']['app_properties']['confluence_home'] = node['confluence']['home_directory']

default['confluence']['use_proxy'] = false
default['confluence']['proxy']['server'] = 'nginx'
default['confluence']['proxy']['redirect_http'] = false
default['confluence']['proxy']['use_ssl'] = false
default['confluence']['proxy']['ssl_cert'] = nil
default['confluence']['proxy']['ssl_key'] = nil
default['confluence']['proxy']['name'] = node['fqdn']
default['confluence']['proxy']['port'] = 80
default['confluence']['proxy']['confluence_addr'] = 'localhost:8090'
