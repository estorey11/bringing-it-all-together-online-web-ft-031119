class Dog 
  attr_accessor :name, :breed, :id
  
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end
end