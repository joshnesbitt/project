# Quick task to build and deploy gem.
require 'lib/project'

GEM_NAME = "project-#{Project::Version::STRING}.gem"
GEM_PATH = "pkg/#{GEM_NAME}"

def execute_commands(commands)
  commands.each do |command|
    output = `#{command}`
    puts "* executed #{command}"
    puts output unless output.empty?
  end
end

task :build do
  execute_commands ['gem build project.gemspec',
                    "mv #{GEM_NAME} pkg/"]
end

task :deploy => [ :build ] do
  execute_commands ["gem push #{GEM_PATH}"]
end
