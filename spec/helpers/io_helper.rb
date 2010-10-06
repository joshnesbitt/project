module IOHelper
  # Silence all output
  $stdout = StringIO.new  
  
  def format_newline(str)
    str + "\n"
  end
  
  def capture_stdout(&block)
    begin
      original_stream, $stdout = $stdout, StringIO.new
      block.call($stdout)
    ensure
      s, $stdout = $stdout.string, original_stream
      s
    end
  end
  
  def should_output(expected, &block)
    capture_stdout do |stdout|
      block.call
      
      if expected.is_a?(Regexp)
        expected.should =~ stdout.string
      else
        stdout.string.should == format_newline(expected.to_s)
      end
    end
  end
  
  def should_output_and_exit(expected, &block)
    should_output expected do
      lambda { block.call }.should raise_error(SystemExit)
    end
  end
end
