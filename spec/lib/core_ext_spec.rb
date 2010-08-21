module Project
  describe OpenStruct do
    
    before do
      @struct = OpenStruct.new(:one => "one", :two => "two", :three => "three")
    end
    
    it "should provide [] as an interface to the OpenStructs' attributes" do
      @struct[:one].should  == @struct.one # one
      @struct[:four].should == @struct.four # nil
    end
  end
end
