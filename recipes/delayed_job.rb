configuration = node['delayed_job']

template "/etc/init.d/delayed_job" do
  source "delayed_job.erb"
  owner configuration['username']
  group configuration['username']
  mode "0744"
  variables(configuration)
end

service 'delayed_job' do
  action [:enable, :start]
end
