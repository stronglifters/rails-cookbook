include_recipe "stronglifters-rails::rbenv"
include_recipe "stronglifters-rails::capistrano"
include_recipe "stronglifters-rails::nginx"
include_recipe "stronglifters-rails::puma"
include_recipe "stronglifters-rails::nodejs"

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
