include_recipe "mokhan-myface::rbenv"
include_recipe "mokhan-myface::capistrano"
include_recipe "mokhan-myface::nginx"
include_recipe "mokhan-myface::puma"
include_recipe "mokhan-myface::nodejs"

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
