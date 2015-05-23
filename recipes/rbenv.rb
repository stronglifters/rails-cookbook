include_recipe "ruby_build::default"
include_recipe "rbenv::system"

#include_recipe "apt"
#configuration = node['rbenv']

#items = [ "build-essential", "tklib", "zlib1g-dev", "libssl-dev", "libreadline-gplv2-dev", "libxml2", "libxml2-dev", "libxslt1-dev" ]
#items.each do |item|
  #package item do
    #action :upgrade
  #end
#end

#git "/usr/local/rbenv" do
  #repository "git://github.com/sstephenson/rbenv.git"
  #reference "master"
  #action :sync
#end

#directory "/usr/local/rbenv/plugins" do
  #action :create
#end

#git "/usr/local/rbenv/plugins/ruby-build" do
  #repository "git://github.com/sstephenson/ruby-build.git"
  #reference "master"
  #action :sync
#end

#template "/etc/skel/.bashrc" do
  #source "bashrc.erb"
#end

#bash "install ruby #{configuration['ruby_version']}" do
  #code <<-SCRIPT
  #export PATH="/usr/local/rbenv/bin:$PATH"
  #eval "$(rbenv init -)"
  #rbenv install #{configuration['ruby_version']}
  #rbenv global #{configuration['ruby_version']}
  #gem install bundler --no-ri --no-rdoc
  #rbenv rehash
  #SCRIPT
#end
