require 'rubygems'
require 'spec/rake/spectask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'rails-doorman'
    gem.summary = 'Ruby on Rails authorization plugin'
    gem.description = 'Ruby on Rails authorization plugin'
    gem.has_rdoc = false
    gem.email = 'jeremy.burks@gmail.com'
    gem.homepage = "http://jrun.github.com/rails-doorman"
    gem.authors = ["Jeremy Burks"]
    gem.files = %w(LICENSE README.rdoc Rakefile) + Dir.glob("{rails,lib,spec,features}/**/*")
    gem.add_dependency('rails', '>= 2.3.2')
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "rspec-rails", ">= 1.2.9"
    gem.add_development_dependency "cucumber", ">= 0"
    gem.add_development_dependency 'yard', '~> 0.4.0'    
    gem.add_development_dependency 'grancher', '> 0'

    desc "Install development dependencies."
    task :setup do
      gems = ::Gem::SourceIndex.from_installed_gems
      gem.dependencies.each do |dep|
        if gems.find_name(dep.name, dep.version_requirements).empty?
          puts "Installing dependency: #{dep}"
          system %Q|gem install #{dep.name} -v "#{dep.version_requirements}"  --development|
        end
      end
    end
    
    desc "Build and reinstall the gem locally."
    task :reinstall => :build  do
      version = File.read('VERSION')
      if (system("gem list #{gem.name} -l") || "")  =~ /#{gem.name}-#{version}/
        system "gem uninstall #{gem.name}"
      end
      system "gem install --no-rdoc --no-ri -l pkg/#{gem.name}-#{version}"
    end
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
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

task :spec => :check_dependencies
task :default => [:spec, :features]
task :build => [:spec, :features, :yard]

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yard do
    abort "YARD is not available. Run 'rake setup' to install all development dependencies."
  end
end

begin
  require 'grancher/task'
  Grancher::Task.new do |g|
    g.branch = 'gh-pages'
    g.push_to = 'origin'
    g.directory 'doc'
  end
rescue LoadError
  task :publish do
    abort "grancher is not available. Run 'rake setup' to install all development dependencies."
  end
end
