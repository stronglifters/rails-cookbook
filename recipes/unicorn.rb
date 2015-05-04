configuration = node['unicorn']

template "/etc/init.d/unicorn" do
  source "unicorn.erb"
  owner configuration[:username]
  group configuration[:username]
  mode "0744"
  variables(configuration)
end

service "unicorn" do
  action [:enable, :start]
end if File.exists?("#{configuration[:current_path]}/Gemfile")
