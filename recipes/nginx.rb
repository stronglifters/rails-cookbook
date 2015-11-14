if redhat?
  execute "yum upgrade -y ca-certificates"
  package "epel-release"
end

package "nginx"
package "logrotate"
user "nginx"

configuration = node['stronglifters']['nginx']

template "/etc/nginx/nginx.conf" do
  variables(configuration)
  notifies :restart, 'service[nginx]'
end

file "/etc/ssl/certs/#{configuration['domain']}.crt" do
  mode "0644"
  content configuration['ssl']['crt']
  notifies :restart, "service[nginx]"
end

file "/etc/ssl/private/#{configuration['domain']}.key" do
  mode "0644"
  content configuration['ssl']['key']
  notifies :restart, "service[nginx]"
end

execute "cd /etc/ssl/certs && openssl dhparam -out dhparam.pem 2048" do
  not_if { ::File.exist?('/etc/ssl/certs/dhparam.pem') }
  notifies :restart, "service[nginx]"
end

directory '/var/log/nginx' do
  mode '0755'
end

service "nginx" do
  action [:enable, :start]
end

template "/etc/logrotate.d/nginx" do
  source "nginx_logrotate.erb"
  mode "0644"
end
