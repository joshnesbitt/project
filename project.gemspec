require 'lib/project'

Gem::Specification.new do |s|
  s.name = %q{project}
  s.version = Project::Version::STRING
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Nesbitt"]
  s.date = Time.now.strftime("%Y/%m/%d")
  s.description = %q{Project aims to make working with multiple projects as simple as possible. By registering projects with workflows you can quickly create a set of commands that will be run against each project.}
  s.email = %q{josh@josh-nesbitt.net}
  s.executables = ["project"]
  s.extra_rdoc_files = [
    "LICENSE"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "Rakefile",
     "VERSION",
     "bin/project",
     "lib/project.rb",
     "lib/project/version.rb",
     "lib/project/core_ext.rb",
     "lib/project/errors.rb",
     "lib/project/loader.rb",
     "lib/project/lookup.rb",
     "lib/project/project.rb",
     "lib/project/runner.rb",
     "lib/project/template.rb",
     "lib/project/workflow.rb",
     "project.gemspec",
     "readme.textile",
     "spec/fixtures/config.yml",
     "spec/lib/core_ext_spec.rb",
     "spec/lib/errors_spec.rb",
     "spec/lib/loader_spec.rb",
     "spec/lib/lookup_spec.rb",
     "spec/lib/project_spec.rb",
     "spec/lib/template_spec.rb",
     "spec/lib/workflow_spec.rb",
     "spec/spec_helper.rb",
     "spec/watch.rb",
     "templates/example.yml"
  ]
  s.homepage = %q{http://github.com/joshnesbitt/project}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A streamlined approach to working with multiple projects and tasks.}
  s.test_files = [
    "spec/lib/core_ext_spec.rb",
    "spec/lib/errors_spec.rb",
    "spec/lib/loader_spec.rb",
    "spec/lib/lookup_spec.rb",
    "spec/lib/project_spec.rb",
    "spec/lib/template_spec.rb",
    "spec/lib/workflow_spec.rb",
    "spec/spec_helper.rb",
    "spec/watch.rb"
  ]
  s.post_install_message = <<-MESSAGE
#{"*"* 80}
Thanks for installing Project. Please check the README for the changelog:

http://github.com/joshnesbitt/project#readme
#{"*"* 80}

  MESSAGE
  s.platform = Gem::Platform::RUBY
  s.add_dependency(%q<rspec>, [">= 1.2.9"])
end
