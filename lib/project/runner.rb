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
      $stdout.puts "* Opening project '#{self.key}' using workflow '#{self.project.workflow}'"
      
      self.workflow.each do |command|
        command = Template.new(command, self.project).parse
        
        %x[ #{command} ]
      end
    end
    
    private
    def exit_with(message, code=1)
      $stdout.puts message
      Kernel.exit(code)
    end
  end
end
