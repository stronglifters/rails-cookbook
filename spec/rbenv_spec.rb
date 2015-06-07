describe "stronglifters-rails::rbenv" do
  subject do
    ChefSpec::SoloRunner.new do |node|
    end.converge(described_recipe)
  end

  xit 'installs rbenv' do
    expect(subject).to sync_git("/usr/local/rbenv")
  end

  xit 'creates the rbenv plugins directory' do
    expect(subject).to create_directory('/usr/local/rbenv/plugins')
  end

  xit 'installs ruby-build' do
    expect(subject).to sync_git("/usr/local/rbenv/plugins/ruby-build")
  end
end
