include_recipe "stronglifters::redis"
include_recipe "stronglifters::rails"

current_path = "#{node["stronglifters"]["root_path"]}/current"
runit_service "sidekiq" do
  action [:enable, :start]
  default_logger true
  env node["stronglifters"]["env"]
  log true
  retries 3
end if File.exists?("#{current_path}/Gemfile")
