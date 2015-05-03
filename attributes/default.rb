default['user']['username'] = 'rails'
default['capistrano']['root_path'] = '/var/www/app'
default['capistrano']['username'] = node['user']['username']
default['capistrano']['env'] = {
  aws: {
    access_key: '',
    secret_access_key: '',
    product_key: '',
    associate_id: '',
    s3_backup_bucket: '',
    s3_bucket: '',
  },
  asset_host: '',
  smtp: {
    host: '',
    port: '',
    domain: '',
    username: '',
    password: '',
  },
  mix_panel_api_key: '',
  secret_token: '',
  google_analytics: '',
  embedly_key: '',
  facebook_app_id: '',
  disqus: {
    api_key: '',
    secret_key: '',
    short_name: '',
  },
  exception_email_address: '',
  mailchimp: {
    api_key: '',
    list_id: '',
  },
  twitter: {
    consumer_key: '',
    consumer_secret: '',
    access_token: '',
    access_secret: '',
  },
  newrelic_key: '',
}
default[:delayed_job][:username] = node['user']['username']
default[:delayed_job][:current_path] = "#{node['capistrano']['root_path']}/current"
default[:delayed_job][:rails_env] = node.chef_environment
default[:nginx][:domain] = 'www.example.com'
default[:nginx][:current_path] = "#{node['capistrano']['root_path']}/current"
default[:nginx][:shared_path] = "#{node['capistrano']['root_path']}/shared_path"
default[:unicorn][:username] = node['user']['username']
default[:unicorn][:current_path] = "#{node['capistrano']['root_path']}/current"
default[:unicorn][:rails_env] = node.chef_environment
