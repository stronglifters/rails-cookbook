include_recipe "stronglifters::user"
include_recipe "stronglifters::aws"

root_path = node["stronglifters"]["root_path"]
shared_path = File.join(root_path, "shared")

template "/etc/logrotate.d/rails" do
  source "rails_logrotate.erb"
  mode "0644"
  variables({ shared_path: shared_path })
end

template "/etc/profile.d/rails.sh" do
  variables(env: node["stronglifters"]["env"])
end

[root_path, shared_path, "#{shared_path}/config"].each do |dir|
  directory dir do
    mode "0755"
    owner node["stronglifters"]["username"]
    group node["stronglifters"]["username"]
    recursive true
  end
end

file "#{shared_path}/config/database.yml" do
  content <<-YAML
production:
  adapter: postgresql
  encoding: unicode
  pool: 5
  url: <%= ENV['DATABASE_URL'] %>
YAML
end
