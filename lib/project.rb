$:.unshift File.dirname(__FILE__)

module Project
  ROOT = File.expand_path(File.dirname(__FILE__) + "/..")
  CONFIG = if(xdg = ENV["XDG_CONFIG_HOME"])
             File.join(xdg, 'project', 'config.yaml')
           else
             File.join(ENV["HOME"], '.project')
           end
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
