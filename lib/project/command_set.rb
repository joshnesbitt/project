require 'open3'
module Project
  class CommandSet
    attr_accessor :project, :workflow
    
    def initialize(project, workflow)
      self.project, self.workflow = project, workflow
    end
    
    def execute!
      stdin, stdout, stderr = Open3::popen3 SHELL_BINARY
      
      self.workflow.each do |command|
        command = Template.new(command, self.project).parse!
        stdin.puts command
      end
      
      stdin.close
      return stdout.read, stderr.read
    end
  end
end
