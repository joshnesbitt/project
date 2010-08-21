module Project
  class Lookup
    class << self

      def store
        @store = {} unless @store
        @store
      end

      def set(key, data)
        store[key.to_sym] = data
      end
      alias :register :set

      def get(key)
        store[key.to_sym] ? return_object(store[key.to_sym]) : nil
      end
      alias :find :get
      
      def load_from_hash(hash)
        hash.each_pair do |key, data|
          store[key] = data
        end
      end
      
      def clear_all
        @store = {}
      end
      
      protected
      def return_object(data)
        raise AbstractClassError, "this is an abstract class method and should not be called directly."
      end
    end
  end
end
