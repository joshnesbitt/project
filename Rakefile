require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "project"
    gem.summary = "A streamlined approach to working with multiple projects and tasks."
    gem.description = "Project aims to make working with multiple projects as simple as possible. By registering projects with workflows you can quickly create a set of commands that will be run against each project."
    gem.email = "josh@josh-nesbitt.net"
    gem.homepage = "http://github.com/joshnesbitt/project"
    gem.authors = ["Josh Nesbitt"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.executables << 'project'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies
task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "configurable #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
