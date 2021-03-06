module Project
  class Runner
    attr_accessor :key, :project, :workflow
    
    def initialize(key)
      exit_with "No project key given" if key.nil?
      self.key = key.chomp.to_sym
      
      Loader.new.load!
      
      self.project = Project.find(self.key)
      exit_with "No project found using key '#{self.key}'" if self.project.nil?
      
      self.workflow = Workflow.find(project.workflow)
      exit_with "No workflow found using key '#{self.project.workflow}'" if self.project.nil?
    end
    
    def run!
      say "* Opening project '#{self.key}' using workflow '#{self.project.workflow}'"
      
      commands = CommandSet.new(self.project, self.workflow)
      stdout, stderr = commands.execute!
      
      if stderr.empty?
        puts stdout unless stdout.empty?
      else
        say "! An error occurred whilst running the workflow:"
        say stderr
      end
    end
    
    private
    def say(*things)
      $stdout.puts *things
    end
    
    def exit_with(message, code=1)
      say message
      Kernel.exit(code)
    end
  end
end
