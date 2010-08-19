module Project
  require 'ostruct'
  
  class Project < Lookup
    class << self

      protected
      def return_object(data)
        OpenStruct.new(data)
      end
    end
  end
end
