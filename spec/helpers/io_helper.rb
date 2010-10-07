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
  
  def should_output(*parts, &block)
    capture_stdout do |stdout|
      block.call
      expected = parts.size == 1 ? parts.first : parts.join
      
      if expected.is_a?(Regexp)
        expected.should =~ stdout.string
      else
        stdout.string.should == format_newline(expected.to_s)
      end
    end
  end
  
  def should_output_and_exit(*parts, &block)
    should_output *parts do
      lambda { block.call }.should raise_error(SystemExit)
    end
  end
end
