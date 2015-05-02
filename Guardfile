guard :rspec, cmd: "bin/rspec" do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{recipes/(.+)\.rb$})  { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { 'spec' }
end

guard :shell do
  watch(%r{recipes/(.+)\.rb$}) do |m| 
    system("bin/foodcritic .")
  end
end
