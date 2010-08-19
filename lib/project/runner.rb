module Project
  class Runner
    attr_accessor :key, :project, :workflow

    def initialize(key)
      raise MissingProjectKeyError, "No project key given" if key.nil?
      self.key = key.chomp.to_sym
      
      Loader.new.load!
      
      
      # TODO: Load YAML config here (including catch parse errors).
      
      self.project = Project.find(self.key)
      raise MissingProjectError, "No project error" if self.project.nil?
      
      self.workflow = Workflow.find(project.workflow)
      raise MissingWorkflowError, "No workflow error" if self.workflow.nil?
    end
    
    def run!
      $stdout.puts "* Opening project '#{self.key}' using workflow '#{self.project.workflow}'"
      
      self.workflow.each do |command|
        command = Template.new(command, self.project).parse
        
        # TODO: execute command here
        $stdout.puts "- #{command}"
      end
    end
  end
end
