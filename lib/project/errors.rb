module Project
  
  class ProjectError < StandardError
    attr_accessor :data
    
    def initialize(data)
      self.data = data
      super
    end
  end
  
  class AbstractClassError < ProjectError; end
  class MissingProjectKeyError < ProjectError; end
  class MissingProjectError < ProjectError; end
  class MissingWorkflowError < ProjectError; end
  class MissingTemplateVariable < ProjectError; end
  
end
