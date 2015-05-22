include_recipe "apt"
apt_repository "nginx-stable" do
  uri "http://ppa.launchpad.net/nginx/stable/ubuntu"
  distribution node['lsb']['codename']
  components ["main"]
  keyserver "keyserver.ubuntu.com"
  key "C300EE8C"
end

package 'nginx' do
  action :install
end
package 'logrotate'

configuration = node['nginx']
directory "/etc/nginx/ssl" do
  owner "root"
  group "root"
  mode "0644"
  action :create
end

template "/etc/nginx/ssl/#{configuration['domain']}.crt" do
  source "ssl.crt.erb"
  mode "0644"
  variables(configuration)
  notifies :restart, "service[nginx]"
end

template "/etc/nginx/ssl/#{configuration['domain']}.key" do
  source "ssl.key.erb"
  mode "0644"
  variables(configuration)
  notifies :restart, "service[nginx]"
end

cookbook_file "/etc/nginx/conf.d/blacklist.conf" do
  source "blacklist.conf"
  mode "0644"
end

template "/etc/nginx/sites-available/#{configuration['domain']}" do
  source "nginx_unicorn.erb"
  mode "0644"
  variables(configuration)
  notifies :restart, "service[nginx]"
end

link "/etc/nginx/sites-enabled/#{configuration['domain']}" do
  to "/etc/nginx/sites-available/#{configuration['domain']}"
end

file "/etc/nginx/sites-enabled/default" do
  action :delete
end

directory '/var/log/nginx' do
  mode '0755'
  action :create
end

template "/etc/logrotate.d/nginx" do
  source "nginx_logrotate.erb"
  mode "0644"
end

service "nginx" do
  action [:enable, :start]
end
