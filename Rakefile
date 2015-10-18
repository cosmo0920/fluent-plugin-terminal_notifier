require "bundler/gem_tasks"

require "rake/testtask"
desc "Run test-unit based test"
Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.test_files = Dir["test/**/test_*.rb"].sort
end
task :default => :test
