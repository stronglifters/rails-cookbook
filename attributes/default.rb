default['user']['username'] = 'rails'
default['capistrano']['root_path'] = '/var/www/app'
default['capistrano']['username'] = default['user']['username']
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
default['delayed_job'] = {
  username: default['user']['username'],
  current_path: "#{default['capistrano']['root_path']}/current",
  rails_env: node.chef_environment,
}
