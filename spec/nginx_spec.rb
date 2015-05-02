describe 'mokhan-myface::nginx' do
  let(:chef_run) do 
    ChefSpec::SoloRunner.new do |node|
      node.set['nginx']['domain'] = 'www.example.com'
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
    expect(chef_run).to create_cookbook_file("/etc/nginx/ssl/www.example.com.crt")
      .with_mode("0644")
  end

  it 'copies the ssl private key' do
    expect(chef_run).to create_cookbook_file("/etc/nginx/ssl/www.example.com.key")
      .with_mode("0644")
  end

  it 'copies over the blacklist file' do
    expect(chef_run).to create_cookbook_file("/etc/nginx/conf.d/blacklist.conf")
      .with_mode("0644")
  end
end
