include_recipe "stronglifters::user"
include_recipe "stronglifters::aws"
include_recipe "stronglifters::nginx"

root_path = node['stronglifters']['root_path']
shared_path = File.join(root_path, 'shared')
current_path = File.join(root_path, 'current')

template "/etc/logrotate.d/rails" do
  source "rails_logrotate.erb"
  mode "0644"
  variables({ shared_path: shared_path })
end

directories = [
  root_path,
  shared_path,
  "#{shared_path}/config",
  "#{shared_path}/log",
  "#{shared_path}/tmp/sockets",
  "#{shared_path}/tmp/pids",
  "#{shared_path}/tmp/cache",
  "#{root_path}/releases",
]

directories.each do |dir_name|
  directory dir_name do
    mode "0755"
    recursive true
    action :create
  end
end

username = node['stronglifters']['username']
execute "chown -R #{username}:#{username} #{root_path}" do
  not_if "stat -c %U #{root_path} | grep root"
end

template "#{shared_path}/config/database.yml" do
  source "database.yml.erb"
  mode "0664"
  variables({
    rails_env: node.chef_environment,
    database: node['postgres']["database"],
    username: node['postgres']['username'],
    password: node['postgres']["password"],
    host: node['postgres']['host'],
  })
end

gem "foreman"

startup = File.exists?("#{current_path}/Gemfile")
runit_service "foreman" do
  action [:enable, :start]
  default_logger true
  env node['stronglifters']['env']
  log true
  retries 3
end if startup
