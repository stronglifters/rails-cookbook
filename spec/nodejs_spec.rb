describe "mokhan-myface::nodejs" do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set["lsb"]["codename"] = "trusty"
    end.converge(described_recipe)
  end

  it "upgrades nodejs" do
    expect(chef_run).to upgrade_package("nodejs")
  end
end
