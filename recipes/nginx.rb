package 'nginx'
package 'logrotate'

nginx = node['nginx']
directory "/etc/nginx/ssl" do
  owner "root"
  group "root"
  mode "0644"
  action :create
end

cookbook_file "/etc/nginx/ssl/#{nginx['domain']}.crt" do
  source "#{node.chef_environment}.crt"
  mode "0644"
end

cookbook_file "/etc/nginx/ssl/#{nginx['domain']}.key" do
  source "#{node.chef_environment}.key"
  mode "0644"
end

cookbook_file "/etc/nginx/conf.d/blacklist.conf" do
  source "blacklist.conf"
  mode "0644"
end

template "/etc/nginx/sites-available/#{nginx['domain']}" do
  source "nginx_unicorn.erb"
  mode "0644"
  variables({
    domain: nginx['domain'],
    current_path: node['current_path'],
    shared_path: node['shared_path'],
    ssl_certificate: nginx['ssl_certificate'],
    ssl_certificate_key: nginx['ssl_certificate_key'],
    application: node['application']
  })
  notifies :restart, "service[nginx]"
end

link "/etc/nginx/sites-enabled/#{nginx['domain']}" do
  to "/etc/nginx/sites-available/cakeside"
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
