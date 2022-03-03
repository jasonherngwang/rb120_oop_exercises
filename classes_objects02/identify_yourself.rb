=begin
Part 1
Using the following code, add a method named #identify that returns its calling 
object.
=end

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify
p kitty


=begin
Part 2
Update the following code so that it prints I'm Sophie! when it invokes 
puts kitty.
=end

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty