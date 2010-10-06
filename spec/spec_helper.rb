$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
Dir[File.dirname(__FILE__) + "/helpers/*"].each { |f| require f }
require 'project'
require 'spec'

include RunnerHelper
include IOHelper
