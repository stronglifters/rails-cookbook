class Chef
  class Recipe
    def aws_cli(username)
      package "python-pip"
      execute "pip install awscli"

      home = node['etc']['passwd'][username]['dir']
      directory "#{home}/.aws/" do
        owner username
        group username
        mode "0755"
        recursive true
        action :create
      end

      configuration = node["stronglifters"]["aws"]
      template "#{home}/.aws/config" do
        variables(configuration)
      end

      template "#{home}/.aws/credentials" do
        variables(configuration)
      end
    end
  end
end
