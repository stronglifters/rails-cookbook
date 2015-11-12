package "python-pip"
execute "pip install awscli"

username = node["stronglifters"]["username"]
directory "/home/#{username}/.aws/" do
  owner username
  group username
  mode "0755"
  recursive true
  action :create
end

configuration = node["stronglifters"]["aws"]
template "/home/#{username}/.aws/config" do
  variables(configuration)
end

template "/home/#{username}/.aws/credentials" do
  variables(configuration)
end
