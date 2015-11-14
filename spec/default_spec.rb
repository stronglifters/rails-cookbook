describe "stronglifters::default" do
  subject do
    ChefSpec::SoloRunner.new do |node|
      node.set["stronglifters"]["packages"] = packages
    end.converge(described_recipe)
  end

  let(:packages) { [ "vim" ] }

  it "installs the base packages" do
    expect(subject).to install_package(packages)
  end

  it "installs logrotate" do
    expect(subject).to install_package("logrotate")
  end
end
