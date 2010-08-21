class OpenStruct
  
  def [](key)
    self.send key
  end
end
