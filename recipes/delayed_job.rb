include_recipe "mokhan-myface::user"

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
end if File.exists?("#{configuration['current_path']}/Gemfile")
