module Project
  describe Workflow do
    
    before do
      Workflow.clear_all
      
      @data = {
        :one => ['one', 'two', 'three'],
        :two => ['one', 'two', 'three', 'four']
      }
    end
    
    it "should set a workflow" do
      Workflow.set(:one, @data[:one])
      Workflow.store[:one].should == @data[:one]
    end
    
    it "should get a workflows data" do
      Workflow.set(:one, @data[:one])
      Workflow.get(:one).should == @data[:one]
    end
    
    it "should load a configuration from a hash" do
      Workflow.load_from_hash(@data)
      Workflow.get(:one).should == @data[:one]
    end
    
    it "should return an Array object as a keys data" do
      Workflow.set(:one, @data[:one])
      
      Workflow.get(:one).class.should == Array
      Workflow.get(:one).should == @data[:one]
    end
  end
end
