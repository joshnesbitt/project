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
        raise MissingTemplateVariable, "No variable named %#{match} was specified in the project #{self.key}" if replacements[match].nil?
        self.subject.gsub!("%#{match}", replacements[match])
      end

      self.subject
    end
  end
end
