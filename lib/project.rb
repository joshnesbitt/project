$:.unshift File.dirname(__FILE__)

module Project
  ROOT = File.expand_path(File.dirname(__FILE__) + "/..")
  CONFIG = File.join(ENV["HOME"], '.project')
  SHELL_BINARY = ENV["SHELL"]
end

require 'project/version'
require 'project/core_ext'
require 'project/errors'
require 'project/command_set'
require 'project/template'
require 'project/lookup'
require 'project/workflow'
require 'project/project'
require 'project/loader'
require 'project/runner'

Project::Loader.config_path(Project::CONFIG)
