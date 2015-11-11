use_inline_resources

action :install do
  bash "gem_#{new_resource.name}" do
    code <<-BASH
source /etc/profile.d/rbenv.sh
gem install #{new_resource.name} --no-ri --no-rdoc
BASH
  end
end
