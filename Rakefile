require 'rspec/core/rake_task'
require 'foodcritic'

RSpec::Core::RakeTask.new(:spec)
FoodCritic::Rake::LintTask.new

task default: [:foodcritic, :spec]
