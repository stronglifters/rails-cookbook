configuration = node['puma']

template "/etc/init.d/puma" do
  source "puma.erb"
  owner configuration['username']
  group configuration['username']
  mode "0744"
  variables(configuration)
end

service "puma" do
  action [:enable, :start]
end if File.exists?("#{configuration['current_path']}/Gemfile")
