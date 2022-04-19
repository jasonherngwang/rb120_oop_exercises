=begin
Refactor these classes so they all use a common superclass, and inherit 
behavior as needed.

Should we define a wheels method in Vehicle?
- Only if we wanted to have a default value, e.g. 0 for a Boat.
- If we did, it ensures that all subclasses of Vehicle respond to the wheels
  method invocation. This is an example of polymorphism.

def wheels
  self.class::WHEELS
end

In each subclass:
WHEELS = 4 or 2 or 6
=end

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end
end