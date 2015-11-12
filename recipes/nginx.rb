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

directory "/etc/nginx/ssl" do
  mode "0644"
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
