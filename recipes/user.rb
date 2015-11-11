user node['stronglifters']['username'] do
  supports manage_home: true
  comment "rails user"
  home "/home/#{node['stronglifters']['username']}"
  shell "/bin/bash"
end
