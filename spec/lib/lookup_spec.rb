module Project
  describe Lookup do
    
    before do
      @data = { :age => 20 }
    end
    
    it "should use a hash as a lookup object" do
      Lookup.store.class.should == Hash
    end
    
    it "should set a lookup key correctly" do
      
      Lookup.set(:bob, @data)
      Lookup.store[:bob].should == @data
    end
    
    it "raise an abstract class error on trying to get a key" do
      Lookup.set(:bob, @data)
      lambda { Lookup.get(:bob) }.should raise_error(AbstractClassError)
    end
  end
end
