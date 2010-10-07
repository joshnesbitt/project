module RunnerHelper
  
  def format_args(string)
    string.split(" ")
  end
  
  def run(args)
    args = format_args(args)
    args.push("--config=#{File.expand_path(File.dirname(__FILE__) + "/../fixtures/config.yml")}")
    runner = Project::Runner.new(args)
    runner.run!
  end
end
