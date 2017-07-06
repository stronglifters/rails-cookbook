if redhat?
  execute "yum upgrade -y ca-certificates"
  package "epel-release"
end

package "nginx"
user "nginx"

configuration = node['stronglifters']['nginx']

template "/etc/nginx/nginx.conf" do
  variables(configuration)
  notifies :restart, 'service[nginx]'
end

execute "certbot renew"
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
