describe 'mokhan-myface::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04').converge(described_recipe) }

  it 'installs apache2' do
    expect(chef_run).to install_package('apache2')
  end

  it 'starts the apache2 service' do
    expect(chef_run).to start_service('apache2')
  end

  it 'enables apache2 to start on boot' do
    expect(chef_run).to enable_service('apache2')
  end

  it 'creates the default template' do
    expect(chef_run).to create_template('/var/www/index.html')
      .with_owner('root')
      .with_group('root')
  end
end
