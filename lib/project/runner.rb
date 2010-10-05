require 'trollop'
module Project
  class Runner
    attr_reader :options
    COMMANDS = %w{ open list install }
    
    def initialize(args)
      @options = parse_options!(args)
      load_config!(options[:config])
    end
    
    def run!
      command = options[:command]
      
      unless command && COMMANDS.include?(command)
        exit_with "command '#{command}' not found"
      end
      
      case command.to_sym
      when :open
        open(options[:key], options)
      when :list
        list(options)
      end
    end
    
    def open(key, options={})
      exit_with "no project key given" if key.nil?
      
      project = Project.find(key)
      exit_with "no project found using key '#{key}'" if project.nil?
      
      workflow = Workflow.find(project.workflow)
      exit_with "no workflow found using key '#{project.workflow}'" if project.nil?
      
      say "* Opening project '#{key}' using workflow '#{project.workflow}'"
      
      commands = CommandSet.new(project, workflow)
      stdout, stderr = commands.execute!
      
      if stderr.empty?
        say(stdout) unless stdout.empty?
      else
        say "! An error occurred whilst running the workflow:"
        say stderr
      end
    end
    
    def list(options={})
      say "Projects:", *Project.all.keys.collect { |name| "- #{name}" }
      say "", "Workflows:", *Workflow.all.keys.collect { |name| "- #{name}" }
    end
    
    private
    def parse_options!(args)
      opts = Trollop::options do
        version Version::STRING
        banner File.open(ROOT + "/USAGE") { |f| f.read }
        
        opt :verbose, "Log output of a workflow", :short => "-v", :default => false
        opt :config, "Path to an alternative configuration file", :short => "-c", :default => CONFIG
      end
      
      opts.merge!(:command => args[0])
      opts.merge!(:key => args[1])
      opts.merge!(:sub_command => args[2])
    end
    
    def load_config!(path)
      loader = Loader.new(path)
      loader.load!
    end
    
    def say(*things)
      $stdout.puts(*things)
    end
    
    def exit_with(message)
      Trollop::die message
    end
  end
end
