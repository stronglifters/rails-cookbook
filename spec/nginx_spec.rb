describe "stronglifters::nginx" do
  let(:domain) { "www.example.com" }
  subject do
    ChefSpec::SoloRunner.new do |node|
      node.set["nginx"]["domain"] = domain
    end.converge(described_recipe)
  end

  it "installs nginx" do
    expect(subject).to install_package("nginx")
  end

  it "copies the ssl certificate" do
    expect(subject).to create_file("/etc/ssl/certs/#{domain}.crt")
  end

  it "copies the ssl private key" do
    expect(subject).to create_file("/etc/ssl/private/#{domain}.key")
  end

  it "adds the configuration for the website" do
    expect(subject).to create_template("/etc/nginx/nginx.conf")
  end

  it "restarts nginx" do
    resource = subject.template("/etc/nginx/nginx.conf")
    expect(resource).to notify("service[nginx]").to(:restart).delayed
  end

  it "starts nginx" do
    expect(subject).to start_service("nginx")
  end

  it "installs logrotate" do
    expect(subject).to install_package("logrotate")
  end

  it "creates the log directory for nginx" do
    expect(subject).to create_directory("/var/log/nginx")
  end

  it "adds the logrotate config for rotating nginx logs" do
    expect(subject).to create_template("/etc/logrotate.d/nginx")
  end
end
