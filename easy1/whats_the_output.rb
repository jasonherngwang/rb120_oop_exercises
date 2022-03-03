=begin
What output does this code print? Fix this class so that there are no surprises 
waiting in store for the unsuspecting developer.

Output
Fluffy
My name is FLUFFY.
FLUFFY
FLUFFY
=end

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s          # String#to_s returns self
  end

  def to_s
    # @name.upcase!
    # "My name is #{@name}."
    "My name is #{name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

=begin
Further Exploration
String#to_s returns self. Integer#to_s returns a new String object.
=end

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name