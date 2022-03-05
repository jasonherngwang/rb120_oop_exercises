=begin
Now that we have a Walkable module, we are given a new challenge. 
Apparently some of our users are nobility, and the regular way of walking 
simply isn't good enough. Nobility need to strut.
=end

module Walkable
  def walk
    "#{full_name} #{gait} forward"
  end
end

class Animal
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  def full_name
    name
  end
end

class Cat < Animal
  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat
  private

  def gait
    "runs"
  end
end

class Person < Animal
  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def full_name
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end

mike = Person.new("Mike")
p mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk
# => "Flash runs forward"


# We need a new class Noble that shows the title and name when walk is called:
byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"

# We must have access to both name and title because they are needed for other 
# purposes that we aren't showing here.
p byron.name
# => "Byron"
p byron.title
# => "Lord"