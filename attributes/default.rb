default['confluence']['user'] = 'confluence'
default['confluence']['group'] = 'confluence'
default['confluence']['directory'] = '/opt/confluence'
default['confluence']['home_directory'] = '/var/confluence'

default['confluence']['version'] = '5.4.2'
default['confluence']['download_url'] = 'http://www.atlassian.com/software/confluence/downloads/binary/'

default['confluence']['app_properties']['confluence_home'] = node['confluence']['home_directory']
