module Project
  describe Project do
    
    before do
      Project.clear_all
      
      @data = {
        :one => {
          :workflow => :default,
          :path => "/one/two/three"
        },
        :two => {
          :workflow => :other,
          :path => "/one/two/three/four"
        }
      }
    end
    
    it "should set a project" do
      Project.set(:one, @data[:one])
      Project.store[:one].should == @data[:one]
    end
    
    it "should get a projects data" do
      Project.set(:one, @data[:one])
      Project.get(:one).should == OpenStruct.new(@data[:one])
    end
    
    it "should load a configuration from a hash" do
      Project.load_from_hash(@data)
      Project.get(:one).should == OpenStruct.new(@data[:one])
    end
    
    it "should return an OpenStruct object as a keys data" do
      Project.set(:one, @data[:one])
      
      Project.get(:one).class.should == OpenStruct
      Project.get(:one).should == OpenStruct.new(@data[:one])
    end
  end
end
