describe "mokhan-myface::user" do
  subject do
    ChefSpec::SoloRunner.new do |node|
      node.set['user']['username'] = username
    end.converge(described_recipe)
  end

  let(:username) { FFaker::Internet.user_name }

  it 'creates the rails user' do
    expect(subject).to create_user(username)
  end
end
