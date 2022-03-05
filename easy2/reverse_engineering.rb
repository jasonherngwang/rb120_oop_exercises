=begin
Write a class that will display:
ABC
xyz
=end

class Transform

  def initialize(str)
    @string = str
  end

  def self.lowercase(str)
    str.downcase
  end

  def uppercase
    @string.upcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')