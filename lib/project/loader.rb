module Project
  require 'project/project'
  require 'project/workflow'
  require 'fileutils'
  require 'yaml'
  
  class Loader
    class << self
      def config_path(path=nil)
        path ? (@config_path = path) : @config_path
      end
    end
    attr_reader :raw_config
    
    def initialize
      @template_path = File.join(ROOT, 'templates', 'example.yml')
    end
    
    def load!
      if File.exists?(self.class.config_path)
        @raw_config = YAML.load_file(self.class.config_path)
        
        Project.load_from_hash(@raw_config[:projects]) unless @raw_config[:projects].nil?
        Workflow.load_from_hash(@raw_config[:workflows]) unless @raw_config[:workflows].nil?
      else
        FileUtils.cp(@template_path, self.class.config_path)
        
        $stdout.puts "* No YAML configuration file found!",
                     "+ #{self.class.config_path}",
                     "* One has been created for you, please edit it to your liking and try again."
        
        Kernel.exit(1)
      end
    end
  end
end
