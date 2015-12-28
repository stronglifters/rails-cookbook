package "python-pip"
execute "pip install awscli"

username = node["stronglifters"]["username"]
home = "/home/#{node["stronglifters"]["username"]}"
directory "#{home}/.aws/" do
  owner username
  group username
  mode "0700"
  recursive true
  action :create
end

configuration = node["stronglifters"]["aws"]
template "#{home}/.aws/config" do
  owner username
  group username
  mode "0700"
  variables(configuration)
end

template "#{home}/.aws/credentials" do
  owner username
  group username
  mode "0700"
  variables(configuration)
end
