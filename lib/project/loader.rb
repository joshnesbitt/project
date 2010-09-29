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
        
        projects = @raw_config[:projects]
        workflows = @raw_config[:workflows]
        
        Project.load_from_hash(projects) unless projects.nil?
        Workflow.load_from_hash(workflows) unless workflows.nil?
      else
        FileUtils.mkdir_p(File.dirname(@path))
        FileUtils.cp(@template_path, @path)
        
        $stdout.puts "* No YAML configuration file found!",
                     "+ #{@path}",
                     "* One has been created for you at #{@path}."
        
        Kernel.exit(1)
      end
    end
  end
end
