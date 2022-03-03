=begin
Create a module named Transportation that contains three classes: 
Vehicle, Truck, and Car. Truck and Car should both inherit from Vehicle.
=end

module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end

my_car = Transportation::Car.new
p my_car

my_truck = Transportation::Truck.new
p my_truck

my_truck = Truck.new    # => NameError