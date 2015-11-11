require "serverspec"

set :backend, :exec

describe "default" do
  it 'installs the default version of ruby' do
    expect(command("/usr/local/rbenv/shims/ruby -v").stdout).to match(/2\.2\.3/)
  end

  it 'installs bundler' do
    expect(file("/usr/local/rbenv/shims/bundle")).to be_file
  end
end
