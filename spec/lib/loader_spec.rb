module Project
  describe Loader do
    
    before do
      @config_path = File.join(ROOT, 'spec', 'fixtures', 'config.yml')
      Loader.config_path(@config_path)
    end
    
    it "should allow a config path to be set" do
      path = "/my/path/.project"
      Loader.config_path(path)
      Loader.config_path.should == path
    end
    
    it "should create a configuration file on #load! if one does not exist" do
      FileUtils.rm(@config_path) if File.exists?(@config_path)
      File.exists?(@config_path).should == false
      
      loader = Loader.new
      lambda { loader.load! }.should raise_error(SystemExit)
      
      File.exists?(@config_path).should == true
    end
    
    it "should load Project and Workflow configurations if a configuration exists" do
      loader = Loader.new
      
      unless File.exists?(@config_path)
        lambda { loader.load! }.should raise_error(SystemExit)
        File.exists?(@config_path).should == true
      end
      
      loader.load!
      loader.raw_config.should_not be_nil
    end
  end
end
