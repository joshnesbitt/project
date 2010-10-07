module Project
  describe Runner do
    
    it "should report the correct version on --version" do
      should_output_and_exit Version::STRING do
        run("--version")
      end
    end
    
    it "should run a workflow successfully" do
      should_output "* Opening project 'example' using workflow 'default'\n",
                    "Hello World" do
        run("open example")
      end
    end
    
    it "should list workflows and projects successfully" do
      should_output /Projects:.*one/m do
        run("list")
      end
      
      should_output /Workflows:.*default/m do
        run("list")
      end
    end
  end
end
