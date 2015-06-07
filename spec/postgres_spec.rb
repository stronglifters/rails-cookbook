describe "stronglifters-rails::postgres" do
  subject do
    ChefSpec::SoloRunner.new do |node|
      node.set["postgres"]["database"] = database_name
      node.set["postgres"]["host"] = database_host
      node.set["postgres"]["username"] = database_user
      node.set["postgresql"]["password"]['postgres'] = database_password
      node.set["postgresql"]["config"] = {}
      node.set["rbenv"]["install_pkgs"] = []
    end.converge(described_recipe)
  end

  let(:database_name) { FFaker::Internet.user_name }
  let(:database_host) { "localhost" }
  let(:database_user) { FFaker::Internet.user_name }
  let(:database_password) { "password" }

  before :each do
    stub_command('ls /recovery.conf').and_return(true)
  end

  it 'creates the specified database' do
    expect(subject).to create_postgresql_database(database_name)
  end

  it 'creates the database user' do
    expect(subject).to create_postgresql_database_user(database_user)
  end

  it 'grants all privileges to the database user' do
    expect(subject).to grant_postgresql_database_user(database_user)
      .with_privileges([:all])
  end
end
