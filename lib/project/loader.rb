module Project
  require 'project/project'
  require 'project/workflow'
  require 'fileutils'
  require 'yaml'
  
  class Loader
    attr_reader :raw_config
    
    def initialize(path)
      @template_path = File.join(ROOT, 'templates', 'example.yml')
      @path = path
    end
    
    def load!
      if File.exists?(@path)
        @raw_config = YAML.load_file(@path)
        
        Project.load_from_hash(@raw_config[:projects]) unless @raw_config[:projects].nil?
        Workflow.load_from_hash(@raw_config[:workflows]) unless @raw_config[:workflows].nil?
      else
        FileUtils.mkdir_p(File.dirname(@path))
        FileUtils.cp(@template_path, @path)
        
        $stdout.puts "* No YAML configuration file found!",
                     "+ #{@path}",
                     "* One has been created for you, please edit it to your liking and try again."
        
        Kernel.exit(1)
      end
    end
  end
end
