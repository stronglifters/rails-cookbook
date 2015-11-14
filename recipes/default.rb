if redhat?
  execute "yum update -y"
else
  execute "apt-get update -y"
end

package node['stronglifters']['packages']
package "logrotate"

include_recipe "runit"
include_recipe "stronglifters::ruby"
