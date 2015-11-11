include_recipe "ruby_build::default"
include_recipe "ruby_rbenv::system"

configuration = node['rbenv']
rbenv_global configuration['rubies'].first
