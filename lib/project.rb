$:.unshift File.dirname(__FILE__)
$:.unshift File.join(File.dirname(__FILE__), "project")

module Project
  ROOT = File.expand_path(File.dirname(__FILE__) + "/..")
end

require 'core_ext'
require 'errors'
require 'template'
require 'lookup'
require 'workflow'
require 'project'
require 'loader'
require 'runner'

Project::Loader.config_path(ENV["HOME"] + "/.project")
