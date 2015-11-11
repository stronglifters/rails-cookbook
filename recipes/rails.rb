include_recipe "stronglifters::rbenv"
include_recipe "stronglifters::capistrano"
include_recipe "stronglifters::nginx"
include_recipe "stronglifters::puma"
include_recipe "stronglifters::nodejs"

[
  'imagemagick',
  'libmagickwand-dev',
  'memcached',
  'logrotate',
  'sqlite3',
].each do |item|
  package item do
    action :install
  end
end

shared_path = "#{node['capistrano']['root_path']}/shared"

template "/etc/logrotate.d/rails" do
  source "rails_logrotate.erb"
  mode "0644"
  variables({ shared_path: shared_path })
end
