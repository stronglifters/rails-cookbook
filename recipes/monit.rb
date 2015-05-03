configuration = node["monit"]

package "monit" do
  action :install
end

template "/etc/monit/monitrc" do
  source "monit/monitrc.erb"
  user "root"
  group "root"
  mode "0600"
  variables(configuration)
  notifies :restart, "service[monit]"
end

service "monit" do
  action [:enable, :start]
end
