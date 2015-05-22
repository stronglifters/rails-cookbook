configuration = node['user']

user configuration['username'] do
  supports manage_home: true
  comment "rails user"
  home "/home/#{configuration['username']}"
  shell "/bin/bash"
end
