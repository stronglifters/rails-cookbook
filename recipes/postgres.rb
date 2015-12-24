include_recipe "postgresql::server"
include_recipe "postgresql::contrib"
include_recipe "database::postgresql"

database = node["postgres"]["database"]
username = node["postgres"]["username"]
password = node["postgres"]["password"]
host = node["postgres"]["host"]

postgresql_connection_info = {
  host: host,
  port: 5432,
  username: "postgres",
  password: node["postgresql"]["password"]["postgres"],
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

directory "/var/backups/postgresql/" do
  user "postgres"
  group "postgres"
  recursive true
end

template "/var/backups/postgresql/pg_backup_rotated.sh" do
  user "postgres"
  group "postgres"
  mode "0744"
end

template "/etc/postgresql/pg_backup.config" do
  user "postgres"
  group "postgres"
  variables(backup_dir: "/var/backups/postgresql/")
end

file "/var/lib/postgresql/.pgpass" do
  content "localhost:5432:*:postgres:#{node["postgresql"]["password"]["postgres"]}"
  mode "0600"
end
