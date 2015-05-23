describe "mokhan-myface::puma" do
  subject do
    ChefSpec::SoloRunner.new do |node|
      node.set['puma'] = configuration
    end.converge(described_recipe)
  end

  let(:username) { FFaker::Internet.user_name }
  let(:configuration) do
    {
      username: username,
      current_path: '/tmp',
    }
  end

  it 'creates the puma init.d script' do
    expect(subject).to create_template("/etc/init.d/puma")
      .with_source("puma.erb")
      .with_owner(username)
      .with_group(username)
      .with_mode("0744")
  end

  context "when the app is deployed" do
    before :each do
      FileUtils.touch('/tmp/Gemfile')
    end

    after :each do
      FileUtils.rm('/tmp/Gemfile')
    end

    it 'starts the puma service' do
      expect(subject).to start_service("puma")
    end
  end
end
