# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'project/version'

Gem::Specification.new do |s|
  s.name         = "project"
  s.version      = Project::VERSION
  s.authors      = ["Josh Nesbitt", "Simon Hafner"]
  s.email        = "hafnersimon@gmail.com"
  s.homepage     = "http://github.com/Tass/project"
  s.summary      = "A streamlined approach to working with multiple projects and tasks."
  s.description  = "Project aims to make working with multiple projects as simple as possible. By registering projects with workflows you can quickly create a set of commands that will be run against each project."

  s.files        = `git ls-files lib bin templates`.split("\n")
  s.bindir       = 'bin'
  s.executables  = 'project'
  s.platform     = Gem::Platform::RUBY
  s.require_path = 'lib'
  s.required_rubygems_version = '>= 1.3.6'
end
