module Project
  describe ProjectError do
    
    it "should have a base error class" do
      error = ProjectError.new("Error data")
      error.data.should == "Error data"
      
      ProjectError.ancestors.should include(StandardError)
    end
    
    it "should have the correct error classes available" do
      data = "Error Data"
      
      [ProjectError, AbstractClassError, MissingTemplateVariable].each do |klass|
        error = klass.new(data)
        error.data.should == data
        klass.ancestors.should include(StandardError)
      end
    end
  end
end
