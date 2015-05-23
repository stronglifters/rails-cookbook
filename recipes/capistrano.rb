include_recipe "mokhan-myface::user"

configuration = node['capistrano']
root_path = configuration['root_path']
shared_path = File.join(root_path, "shared")

directories = [
  root_path,
  shared_path,
  "#{shared_path}/backups",
  "#{shared_path}/bundle",
  "#{shared_path}/config",
  "#{shared_path}/log",
  "#{shared_path}/pids",
  "#{shared_path}/sockets",
  "#{root_path}/releases",
]

directories.each do |dir_name|
  directory dir_name do
    owner configuration['username']
    group configuration['username']
    mode "0755"
    recursive true
    action :create
  end
end

template "#{shared_path}/.env" do
  source "env.erb"
  owner configuration['username']
  group configuration['username']
  mode "0600"
  variables(configuration)
end

template "#{shared_path}/config/database.yml" do
  source "database.yml.erb"
  mode "0664"
  variables({
    rails_env: node.chef_environment,
    database: node['postgres']["database"],
    username: node['postgres']['user'],
    password: node['postgres']["password"],
    host: node['postgres']['host'],
  })
end
