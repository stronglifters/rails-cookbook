require "serverspec"

set :backend, :exec

describe "db" do
  it "runs postgres" do
    expect(service("postgresql")).to be_running
    expect(port("5432")).to be_listening
  end
end
