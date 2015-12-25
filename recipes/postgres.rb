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

backups_dir = "/var/backups/postgresql"
directory backups_dir do
  user "postgres"
  group "postgres"
  recursive true
end

template "#{backups_dir}/pg_backup_rotated.sh" do
  user "postgres"
  group "postgres"
  mode "0744"
end

template "/etc/postgresql/pg_backup.config" do
  user "postgres"
  group "postgres"
  variables({
    backup_dir: "#{backups_dir}/",
    s3_backup_path: node['stronglifters']['s3_backup_path'],
  })
end

file "/var/lib/postgresql/.pgpass" do
  content "localhost:5432:*:postgres:#{node["postgresql"]["password"]["postgres"]}"
  group "postgres"
  mode "0600"
  user "postgres"
end

aws_config = node['stronglifters']['aws']['profiles']['default']

package "python-pip"
execute "pip install awscli"
cron 'pg_backups' do
  action :create
  command "#{backups_dir}/pg_backup_rotated.sh -c /etc/postgresql/pg_backup.config"
  environment({
    "AWS_ACCESS_KEY_ID" => aws_config['aws_access_key_id'],
    "AWS_SECRET_ACCESS_KEY" => aws_config['aws_secret_access_key'],
    "PGPASSFILE" => "/var/lib/postgresql/.pgpass",
    "PGPASSWORD" => node["postgresql"]["password"]["postgres"],
  })
  hour '1'
  minute '0'
  user 'postgres'
end
