module Project
  class Template
    attr_accessor :subject, :replacements
    REGEX = /%([a-z|A-Z]*)?/
    
    def initialize(subject, replacements)
      self.subject      = subject
      self.replacements = replacements
    end
    
    def parse!
      matches = self.subject.scan(REGEX)
      matches.flatten!
      
      matches.each do |match|
        replacement = replacements[match.to_sym]
        raise MissingTemplateVariable, "No variable named %#{match} was found on the specified project." if replacement.nil?
        self.subject.gsub!("%#{match}", replacement)
      end
      
      self.subject
    end
  end
end
