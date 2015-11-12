git "/usr/local/rbenv" do
  repository "https://github.com/sstephenson/rbenv.git"
end

cookbook_file "/etc/profile.d/rbenv.sh"
cookbook_file "/etc/gemrc"
directory "/usr/local/rbenv/plugins"

git "/usr/local/rbenv/plugins/ruby-build" do
  repository "https://github.com/sstephenson/ruby-build.git"
end

ruby_version = node["stronglifters"]["ruby_version"]
stronglifters_rbenv "install #{ruby_version}" do
  not_if { ::File.exist?("/usr/local/rbenv/versions/#{ruby_version}") }
end
rbenv "global #{ruby_version}"

gem "bundler"
