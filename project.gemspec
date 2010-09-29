require 'lib/project'

Gem::Specification.new do |s|
  s.name = %q{project}
  s.version = Project::Version::STRING
  s.authors = ["Josh Nesbitt"]
  s.description = %q{Project aims to make working with multiple projects as simple as possible. By registering projects with workflows you can quickly create a set of commands that will be run against each project.}
  s.email = %q{josh@josh-nesbitt.net}
  s.executables = %w{ project }
  s.files = `git ls-files`.split("\n")
  s.homepage = %q{http://github.com/joshnesbitt/project}
  s.require_paths = ["lib"]
  s.summary = %q{A streamlined approach to working with multiple projects and tasks.}
  s.test_files = `git ls-files spec`.split("\n")
  s.post_install_message = <<-MESSAGE
  
  Thanks for installing Project. Please check the README for the changelog:

  http://github.com/joshnesbitt/project#readme

  MESSAGE
  s.platform = Gem::Platform::RUBY
  s.rubygems_version = %q{>= 1.3.6}
  s.add_dependency('trollop', '1.16.2')
  s.add_dependency('rspec', '>= 1.2.9')
  s.rdoc_options = ["--charset=UTF-8"]
end
