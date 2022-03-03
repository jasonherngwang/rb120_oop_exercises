=begin
Using the following code, determine the lookup path used when invoking 
cat1.color. Only list the classes and modules that Ruby will check when 
searching for the #color method.
=end

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color               # => NoMethodError
p cat1.class.ancestors
# Method lookup path: Cat, Animal, Object, Kernel, BasicObject