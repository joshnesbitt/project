module Project
  
  class ProjectError < StandardError
    attr_accessor :data
    
    def initialize(data)
      self.data = data
      super
    end
  end
  
  class AbstractClassError < ProjectError; end
  class MissingTemplateVariable < ProjectError; end
  
end
