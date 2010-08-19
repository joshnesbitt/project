module Project
  require 'fileutils'
  require 'yaml'
  
  class Loader
    class << self
      def config_path(path=nil)
        path ? (@config_path = path) : @config_path
      end
    end
    
    def load!
      if File.exists?(self.class.config_path)
        config = YAML.load_file(self.class.config_path)
        Project.load_from_hash(config[:projects]) unless config[:projects].nil?
        Workflow.load_from_hash(config[:workflows]) unless config[:workflows].nil?
      else
        FileUtils.cp(ROOT + "/templates/example.yml", self.class.config_path, { :verbose => true })
        $stdout.puts "* No YAML file found at #{self.class.config_path}. One has been created for you, please edit it to your liking and try again."
        Kernel.exit(1)
      end
    end
  end
end
