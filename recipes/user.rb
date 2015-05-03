configuration = node['user']

user configuration['username'] do
  comment "rails user"
  home "/home/#{configuration['username']}"
  shell "/bin/bash"
end

