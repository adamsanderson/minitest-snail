require 'rake'
require 'rake/testtask'
require 'rubygems/package_task'

spec = Gem::Specification.load("minitest-snail.gemspec")
pkg  = Gem::PackageTask.new(spec) do |p|
  p.gem_spec = spec
end

desc "Install the current gem"
task "install" => [:gem] do
  path = pkg.package_dir_path
  system 'gem', 'install', "#{path}.gem"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test