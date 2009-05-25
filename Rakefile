require 'rubygems'
require 'rake/gempackagetask'
require 'spec/rake/spectask'

GEM_NAME = "rails_doorman"
GEM_VERSION = "0.0.1"
AUTHOR = "Jeremy Burks"
EMAIL = "jeremy.burks@gmail.com"
HOMEPAGE = "http://github.com/jrun/rails_doorman/"
SUMMARY = "Rails plugin that provides an allow/deny DSL for controlling access"

spec = Gem::Specification.new do |s|
  s.name = GEM_NAME
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = false
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.add_dependency('rails', '>= 2.3.2')
  s.require_path = 'lib'
  s.files = %w(LICENSE README.rdoc Rakefile) + Dir.glob("{rails,lib,spec,features}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

namespace :gem do
  desc "Repackage, uninstall and install gem"
  task :refresh do
    Rake::Task[:spec].invoke    
    Rake::Task[:repackage].invoke
  end
end

desc "Create a gemspec file"
task :gemspec do
  File.open("#{GEM_NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

desc "Run the examples"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = ["spec/**/*_spec.rb"]
  t.spec_opts = %w[--color --format specdoc --diff]  
end

require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty"
end

task :default => [:spec, :features]
