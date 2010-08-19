$:.unshift File.dirname(__FILE__)
$:.unshift File.join(File.dirname(__FILE__), "project")

#!/usr/bin/ruby
require 'ostruct'

class Lookup
  class << self
    
    def store
      @store = {} unless @store
      @store
    end
    
    def set(key, data)
      store[key.to_sym] = data
    end
    alias :register :set
    
    def get(key)
      store[key.to_sym] ? return_object(store[key.to_sym]) : nil
    end
    alias :find :get
    
    protected
    def return_object(data)
      raise "AbstractClassError: this is an abstract class method and should not be called directly."
    end
  end
end

class Workflow < Lookup
  KEY_REGEX = /%([a-z|A-Z]*)?/
  
  class << self
    
    protected
    def return_object(data)
      data
    end
  end
end

class Project < Lookup
  class << self
    
    protected
    def return_object(data)
      OpenStruct.new(data)
    end
  end
end

# Example Yaml
#
# workflows:
#   default:
#     - mate %path
#     - cd %path && gitx
# projects:
#   raw:
#     :path: /a/path
#     :workflow: default

Workflow.register(:default, [
  "mate %path",
  "cd %path && gitx"
])

Project.register(:random, {
  :path => "/Users/joshnesbitt/Sites/app",
  :workflow => :default
})

class Runner
  attr_accessor :key, :project, :workflow
  
  def initialize(key)
    raise "No project key given" if key.nil?
    self.key = key.chomp.to_sym
    
    # TODO: Load YAML config here (including catch parse errors).
    
    self.project = Project.find(self.key)
    raise "No project error" if self.project.nil?
    
    self.workflow = Workflow.find(project.workflow)
    raise "No workflow error" if self.workflow.nil?
  end
  
  def run!
    puts "* Opening project '#{self.key}' using workflow '#{self.project.workflow}'"
    
    self.workflow.each do |command|
      matches = command.scan(Workflow::KEY_REGEX)
      matches.flatten!
      matches.each do |match|
        raise "No variable named %#{match} was spefified in the project #{self.key}" if self.project.send(match).nil?
        command.gsub!("%#{match}", self.project.send(match))
      end
      
      # TODO: execute command here
      puts "- #{command}"
    end
  end
end

runner = Runner.new(ARGV[0])
runner.run!
