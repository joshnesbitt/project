module Project
  describe Lookup do
    
    before do
      Lookup.clear_all
      
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
    
    it "should use a hash as a lookup object" do
      Lookup.store.class.should == Hash
    end
    
    it "should set a lookup key correctly" do
      Lookup.set(:one, @data[:one])
      Lookup.store[:one].should == @data[:one]
    end
    
    it "raise an abstract class error on trying to get a key directly from the Lookup class" do
      Lookup.set(:one, @data[:one])
      lambda { Lookup.get(:one) }.should raise_error(AbstractClassError)
    end
    
    it "should load a configuration from a hash" do
      Lookup.load_from_hash(@data)
      Lookup.store[:one].should == @data[:one]
      
      @data[:one].each_pair do |k, v|
        Lookup.store[:one][k].should == v
      end
    end
    
    it "should support wiping the entire lookups' content" do
      Lookup.store.should == {}
      Lookup.load_from_hash(@data)
      Lookup.store.should_not be_empty
      Lookup.clear_all
      Lookup.store.should be_empty
    end
  end
end
