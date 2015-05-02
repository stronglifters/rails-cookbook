package 'nginx' do
  action :install
end

directory "/etc/nginx/ssl" do
  owner "root"
  group "root"
  mode "0644"
  action :create
end

cookbook_file "/etc/nginx/ssl/#{node['nginx']['domain']}.crt" do
  source "#{node.chef_environment}.crt"
  mode "0644"
end

cookbook_file "/etc/nginx/ssl/#{node['nginx']['domain']}.key" do
  source "#{node.chef_environment}.key"
  mode "0644"
end

cookbook_file "/etc/nginx/conf.d/blacklist.conf" do
  source "blacklist.conf"
  mode "0644"
end
