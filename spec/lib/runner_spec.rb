module Project
  describe Runner do
    
    it "should report the correct version on --version" do
      should_output_and_exit Version::STRING do
        run("--version")
      end
    end
  end
end
