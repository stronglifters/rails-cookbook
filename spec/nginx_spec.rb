describe 'stronglifters-rails::nginx' do
  let(:domain) { "www.example.com" }
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['nginx']['domain'] = domain
      node.set['lsb']['codename'] = 'trusty'
    end.converge(described_recipe)
  end

  it 'installs nginx' do
    expect(chef_run).to install_package("nginx")
  end

  it 'creates a directory for the ssl certificates' do
    expect(chef_run).to create_directory('/etc/nginx/ssl')
      .with_owner('root')
      .with_group('root')
      .with_mode('0644')
  end

  it 'copies the ssl certificate' do
    expect(chef_run).to create_template("/etc/nginx/ssl/#{domain}.crt")
      .with_mode("0644")
  end

  it 'copies the ssl private key' do
    expect(chef_run).to create_template("/etc/nginx/ssl/#{domain}.key")
      .with_mode("0644")
  end

  it 'copies over the blacklist file' do
    expect(chef_run).to create_cookbook_file("/etc/nginx/conf.d/blacklist.conf")
      .with_mode("0644")
  end

  it 'adds the configuration for the website' do
    expect(chef_run).to create_template("/etc/nginx/sites-available/#{domain}")
      .with_mode("0644")
  end

  it 'restarts nginxj' do
    resource = chef_run.template("/etc/nginx/sites-available/#{domain}")
    expect(resource).to notify('service[nginx]').to(:restart).delayed
  end

  it 'starts nginx' do
    expect(chef_run).to start_service('nginx')
  end

  it 'creates a symlink to the sites-enabled directory' do
    expect(chef_run).to create_link("/etc/nginx/sites-enabled/#{domain}")
  end

  it 'deletes the default website' do
    expect(chef_run).to delete_file("/etc/nginx/sites-enabled/default")
  end

  it 'installs logrotate' do
    expect(chef_run).to install_package('logrotate')
  end

  it 'creates the log directory for nginx' do
    expect(chef_run).to create_directory('/var/log/nginx').with_mode('0755')
  end

  it 'adds the logrotate config for rotating nginx logs' do
    expect(chef_run).to create_template("/etc/logrotate.d/nginx")
  end
end
