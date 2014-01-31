include_recipe 'database'
case node['confluence']['database']['type']
when 'postgresql'
  include_recipe 'postgresql::server'
  include_recipe 'postgresql::ruby'

  connection_info = { host: 'localhost',
                      port: node['postgresql']['config']['port'],
                      username: 'postgres',
                      password: node['postgresql']['password']['postgres']
                    }

  postgresql_database node['confluence']['database']['name'] do
    template 'template0'
    encoding 'UNICODE'
    collation 'en_US.utf8'
    connection connection_info
  end

  postgresql_database_user node['confluence']['database']['user'] do
    database_name node['confluence']['database']['name']
    password node['confluence']['database']['password']
    privileges [:all]
    action [:create, :grant]
    connection connection_info
  end
when 'mysql'
## TODO: Implement
end
