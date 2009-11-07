require 'rubygems'
require 'spec/rake/spectask'

GEM_NAME = "rails_doorman"
EMAIL = "jeremy.burks@gmail.com"
HOMEPAGE = "http://github.com/jrun/rails_doorman/"
SUMMARY = "Rails plugin that provides an allow/deny DSL for controlling access"

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = GEM_NAME
    gem.summary = SUMMARY
    gem.description = SUMMARY
    gem.has_rdoc = false
    gem.email = EMAIL
    gem.homepage = HOMEPAGE
    gem.authors = ["Jeremy Burks"]
    gem.add_dependency('rails', '>= 2.3.2')
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "cucumber", ">= 0"
    gem.files = %w(LICENSE README.rdoc Rakefile) + Dir.glob("{rails,lib,spec,features}/**/*")
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

task :spec => :check_dependencies

namespace :gem do
  desc "Repackage, uninstall and install gem"
  task :refresh do
    Rake::Task[:spec].invoke    
    Rake::Task[:repackage].invoke
  end
end

desc "Run the examples"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = ["spec/**/*_spec.rb"]
  t.spec_opts = %w[--color --format specdoc --diff]  
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end


require 'cucumber/rake/task'
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "--format pretty"
end

task :default => [:spec, :features]
