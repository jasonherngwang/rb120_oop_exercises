=begin
Update this code so that when you run it, you see the following output:

My cat Pudding is 7 years old and has black and white fur.
My cat Butterscotch is 10 years old and has tan and white fur.

Further Exploration
If the constructor is the same for both Pet and Cat, Cat inherits it and 
would not need to define its own constructor.

It would be acceptable to add the colors attribute to Pet if it was important 
to keep track of the colors of every Pet. If a type of animal is always the 
same color, then it may not be meaningful to have a color attribute. 

A default value for colors may need to be specified.
=end

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, colors)
    super(name, age)
    @colors = colors
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@colors} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch