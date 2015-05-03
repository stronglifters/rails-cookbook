describe "mokhan-myface::delayed_job" do
  subject do
    ChefSpec::SoloRunner.new do |node|
      node.set['delayed_job'] = configuration#.merge(node['delayed_job'])
    end.converge(described_recipe)
  end

  let(:username) { FFaker::Internet.user_name }
  let(:configuration) do
    {
      username: username,
      current_path: '/tmp',
      rails_env: :production,
    }
  end

  it 'creates the init.d script' do
    expect(subject).to create_template("/etc/init.d/delayed_job")
      .with_owner(username)
      .with_group(username)
      .with_mode("0744")
  end

  context "when the application has been deployed" do
    before :each do
      FileUtils.touch('/tmp/Gemfile')
    end

    after :each do
      FileUtils.rm('/tmp/Gemfile')
    end

    it 'starts the delayed_job service' do
      expect(subject).to start_service('delayed_job')
    end
  end
end
