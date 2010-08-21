module Project
  describe Template do
    
    it "should successfully replace a strings variables with the replacements given" do
      subject = "cd %path && echo '%text' && echo '%other_var'"
      replacements = {
        :path => "/some/path",
        :text => "hello there",
        :other_var => "something"
      }
      
      template = Template.new(subject, replacements)
      result = template.parse!
      result.should == "cd /some/path && echo 'hello there' && echo 'something'"
    end
    
    it "should raise an error on replacing a value that doesnt exist" do
      subject = "cd %path"
      replacements = {}
      
      template = Template.new(subject, replacements)
      lambda { template.parse! }.should raise_error(MissingTemplateVariable, "No variable named %path was found on the specified project.")
    end
  end
end
