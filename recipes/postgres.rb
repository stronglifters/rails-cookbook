include_recipe "stronglifters::rbenv"
include_recipe "postgresql::server"
include_recipe "postgresql::contrib"
include_recipe "database::postgresql"

database = node['postgres']["database"]
username = node['postgres']['username']
password = node['postgres']["password"]
host = node['postgres']['host']

postgresql_connection_info = {
  host: host,
  port: 5432,
  username: 'postgres',
  password: node['postgresql']['password']['postgres'],
}

postgresql_database_user username do
  connection postgresql_connection_info
  password password
  action :create
end

postgresql_database database do
  connection postgresql_connection_info
  action :create
end

postgresql_database_user username do
  connection postgresql_connection_info
  database_name database
  privileges [:all]
  action :grant
end
