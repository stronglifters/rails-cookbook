describe "stronglifters-rails::monit" do
  subject do
    ChefSpec::SoloRunner.new do |node|
    end.converge(described_recipe)
  end

  it 'installs monit' do
    expect(subject).to install_package('monit')
  end

  it 'lays down the monitrc' do
    expect(subject).to create_template("/etc/monit/monitrc")
      .with_user('root')
      .with_group('root')
  end

  it 'starts the monit service' do
    expect(subject).to start_service('monit')
  end
end
