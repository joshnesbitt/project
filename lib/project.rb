$:.unshift File.dirname(__FILE__)

module Project
  ROOT = File.expand_path(File.dirname(__FILE__) + "/..")
end

require 'project/core_ext'
require 'project/errors'
require 'project/template'
require 'project/lookup'
require 'project/workflow'
require 'project/project'
require 'project/loader'
require 'project/runner'

PROJECT_CONFIG = File.join(ENV["HOME"], '.project')
Project::Loader.config_path(PROJECT_CONFIG)
