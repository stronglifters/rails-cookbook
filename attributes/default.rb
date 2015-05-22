default['user']['username'] = 'rails'
default['capistrano']['root_path'] = '/var/www/app'
default['capistrano']['username'] = node['user']['username']
default['capistrano']['env'] = {
  asset_host: '',
  secret_token: ''
}
default['delayed_job']['username'] = node['user']['username']
default['delayed_job']['current_path'] = "#{node['capistrano']['root_path']}/current"
default['delayed_job']['rails_env'] = node.chef_environment
default['nginx']['domain'] = 'www.example.com'
default['nginx']['current_path'] = "#{node['capistrano']['root_path']}/current"
default['nginx']['shared_path'] = "#{node['capistrano']['root_path']}/shared_path"
default['unicorn']['username'] = node['user']['username']
default['unicorn']['current_path'] = "#{node['capistrano']['root_path']}/current"
default['unicorn']['rails_env'] = node.chef_environment
default['monit']['application'] = 'app'
default['rbenv']['ruby_version'] = '2.2.2'
default['aws']['username'] = node['user']['username']
default['aws']['profiles']['default']['region'] = 'us-east-1'
default['aws']['profiles']['default']['aws_access_key_id'] = 'secret'
default['aws']['profiles']['default']['aws_secret_access_key'] = 'secret'
