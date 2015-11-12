include_recipe "stronglifters::redis"
include_recipe "stronglifters::rails"

current_path = "#{node["stronglifters"]["root_path"]}/current"
runit_service "sidekiq" do
  action [:enable, :start]
  default_logger true
  env node["stronglifters"]["env"]
  log true
  log_size 1_000_000
  log_num 31
  retries 3
end if File.exists?("#{current_path}/Gemfile")
