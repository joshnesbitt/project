module Project
  describe Loader do
    
    before do
      @config_path = File.join(ROOT, 'spec', 'fixtures', 'config.yml')
      @loader = Loader.new(@config_path)
    end
    
    it "should create a configuration file on #load! if one does not exist" do
      FileUtils.rm(@config_path) if File.exists?(@config_path)
      File.exists?(@config_path).should == false
      
      lambda { @loader.load! }.should raise_error(SystemExit)
      
      File.exists?(@config_path).should == true
    end
    
    it "should load Project and Workflow configurations if a configuration exists" do
      unless File.exists?(@config_path)
        lambda { @loader.load! }.should raise_error(SystemExit)
        File.exists?(@config_path).should == true
      end
      
      @loader.load!
      @loader.raw_config.class.should == Hash
      @loader.raw_config[:projects].include?(:example).should == true
      @loader.raw_config[:workflows].include?(:default).should == true
    end
  end
end
