require "serverspec"

set :backend, :exec

describe "web" do
  it 'starts nginx' do
    expect(service("nginx")).to be_running
    expect(port(80)).to be_listening
    expect(port(443)).to be_listening
  end

 it 'installs foreman' do
    expect(file("/usr/local/rbenv/shims/foreman")).to be_file
  end
end
