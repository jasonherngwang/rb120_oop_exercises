=begin
A fixed-length array is an array that always has a fixed number of elements. 
Write a class that implements a fixed-length array, and provides the necessary 
methods to support the following code:

The above code should output true 16 times.
=end

class FixedArray
  def initialize(n)
    @array = [nil] * n
  end

  def [](index)
    array.fetch(index)
  end

  def []=(index, new_element)
    self[index]                 # Uses [](index) to raise IndexError
    array[index] = new_element
  end

  def to_a
    array.clone                 # Don't let the outside mutate the array.
  end

  def to_s
    to_a.to_s                   # Use Array#to_s
  end

  private

  attr_accessor :array
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end