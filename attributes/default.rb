default[:confluence][:user] = "confluence"
default[:confluence][:group] = "confluence"
default[:confluence][:directory] = "/usr/local/confluence"
default[:confluence][:home_directory] = "#{node[:confluence][:directory]}/confluence_home"

default[:confluence][:version] = "5.1.3"
default[:confluence][:package] = "atlassian-confluence-#{node[:confluence][:version]}.tar.gz"
default[:confluence][:download_url] = "http://www.atlassian.com/software/confluence/downloads/binary/"
