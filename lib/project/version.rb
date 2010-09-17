module Project
  module Version
    MAJOR, MINOR, PATCH = File.open(ROOT + "/VERSION").read.split(".")
    STRING = [MAJOR, MINOR, PATCH].join(".")
  end
end
