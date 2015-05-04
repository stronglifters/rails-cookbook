include_recipe "apt"
configuration = node['aws']

package 'python-pip' do
  action :install
end

execute 'install awscli' do
  command 'pip install awscli'
  action :run
end

directory "/home/#{configuration["username"]}/.aws/" do
  owner configuration['username']
  group configuration['username']
  mode "0755"
  recursive true
  action :create
end

template "/home/#{configuration["username"]}/.aws/config" do
  source "aws/config.erb"
  variables(configuration)
end

template "/home/#{configuration["username"]}/.aws/credentials" do
  source "aws/credentials.erb"
  variables(configuration)
end
