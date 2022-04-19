=begin
Expected output:
Home 1 is cheaper
Home 2 is more expensive

How else might we compare houses?
- Location
- School district
- Condition
- Size
- Proximity to amenities

What problems might we run into?
- How to weight all the factors?
- It may be better to have a specific function to compare price only.

For what classes is including Comparable a good idea?
- Classes where a number is the most important attribute.
  - Inventory
  - Score
=end

class House
  include Comparable

  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other_house)
    price <=> other_house.price
  end

end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1