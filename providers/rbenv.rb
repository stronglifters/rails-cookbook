use_inline_resources

action :run do
  bash "rbenv_#{new_resource.command}" do
    code <<-BASH
source /etc/profile.d/rbenv.sh
rbenv #{new_resource.command}
BASH
  end
end
