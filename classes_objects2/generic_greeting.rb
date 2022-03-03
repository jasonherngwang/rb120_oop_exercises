=begin
Part 1
Modify the following code so that Hello! I'm a cat! is printed when 
Cat.generic_greeting is invoked.
=end

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

kitty = Cat.new
p kitty.class
p kitty.class == Cat
kitty.class.generic_greeting

=begin
Part 2
Using the following code, add two methods: ::generic_greeting and 
#personal_greeting. The first method should be a class method and print a 
greeting that's generic to the class. The second method should be an instance 
method and print a greeting that's custom to the object.
=end

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def personal_greeting
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting