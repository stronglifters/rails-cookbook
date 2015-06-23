describe 'stronglifters-rails::default' do
  subject do
    ChefSpec::SoloRunner.new do |node|
    end.converge(described_recipe)
  end

  let(:packages) do
    [
      "curl",
      "libcurl3",
      "libcurl3-gnutls",
      "libcurl4-openssl-dev",
      "git-core",
      "python-software-properties",
      "build-essential",
      "tklib",
      "zlib1g-dev",
      "libssl-dev",
      "libreadline-gplv2-dev",
      "libxml2",
      "libxml2-dev",
      "libxslt1-dev",
      "gawk",
      "libreadline6-dev",
      "libyaml-dev",
      "autoconf",
      "libgdbm-dev",
      "libncurses5-dev",
      "automake",
      "libtool",
      "bison",
      "pkg-config",
      "libffi-dev",
      "vim",
    ]
  end

  it 'installs the base packages' do
    packages.each do |package|
      expect(subject).to install_package(package)
    end
  end
end
