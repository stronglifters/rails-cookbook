include_recipe "stronglifters::user"
include_recipe "stronglifters::aws"

root_path = node["stronglifters"]["root_path"]

template "/etc/logrotate.d/rails" do
  source "rails_logrotate.erb"
  mode "0644"
  variables({ shared_path: File.join(root_path, "shared") })
end

directory root_path do
  mode "0755"
  owner node["stronglifters"]["username"]
  group node["stronglifters"]["username"]
  recursive true
end

gem "foreman"

runit_service "foreman" do
  action [:enable, :start]
  default_logger true
  env node["stronglifters"]["env"]
  log true
  retries 3
end if File.exists?("#{File.join(root_path, "current")}/Procfile")
