describe "mokhan-myface::unicorn" do
  subject do
    ChefSpec::SoloRunner.new do |node|
      node.set['unicorn'] = unicorn_variables
    end.converge(described_recipe)
  end

  let(:username) { FFaker::Internet.user_name }
  let(:unicorn_variables) do
    {
      'username' => username
    }
  end

  it 'creates the unicorn init.d script' do
    expect(subject).to create_template("/etc/init.d/unicorn")
      .with_source("unicorn.erb")
      .with_owner(username)
      .with_group(username)
      .with_mode("0744")
      .with_variables(unicorn_variables)
  end

  it 'starts the unicorn service' do
    expect(subject).to start_service("unicorn")
  end
end
