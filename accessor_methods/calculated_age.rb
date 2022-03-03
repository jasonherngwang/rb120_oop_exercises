=begin
Using the following code, multiply @age by 2 upon assignment, then multiply 
@age by 2 again when @age is returned by the getter method.
=end

class Person
  # def age
  #   @age * 2
  # end

  def age
    double(@age)
  end

  # def age=(new_age)
  #   @age = new_age * 2
  # end

  def age=(new_age)
    @age = double(new_age)
  end

  private

  def double(value)
    value * 2
  end
end

person1 = Person.new
person1.age = 20
puts person1.age