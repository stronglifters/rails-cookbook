describe "stronglifters-rails::aws" do
  subject do
    ChefSpec::SoloRunner.new do |node|
      node.set['aws']['username'] = username
    end.converge(described_recipe)
  end

  let(:username) { FFaker::Internet.user_name }

  it 'installs python-ip' do
    expect(subject).to install_package('python-pip')
  end

  it 'installs awscli' do
    expect(subject).to run_execute('pip install awscli')
  end

  it 'installs the config file' do
    expect(subject).to create_template("/home/#{username}/.aws/config")
  end

  it 'installs the credentials file' do
    expect(subject).to create_template("/home/#{username}/.aws/credentials")
  end
end
