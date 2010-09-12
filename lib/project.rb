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

PROJECT_CONFIG = if xdg = ENV["XDG_CONFIG_HOME"]
                   File.join(xdg, 'project', 'config.yaml')
                 else
                   File.join(ENV["HOME"], '.project')
                 end
Project::Loader.config_path(PROJECT_CONFIG)
