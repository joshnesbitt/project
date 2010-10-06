module RunnerHelper
  
  def format_args(string)
    string.split(" ")
  end
  
  def run(args)
    args = format_args(args)
    runner = Project::Runner.new(args)
    runner.run!
  end
end
