=begin
What is wrong with the following code? What fix(es) would you make?
=end

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    # self.expand(3)
    expand(3)
  end

  private

  def expand(n)
    @string * n
    # @string.chars.map { |char| char * 3 }.join
  end
end

expander = Expander.new('xyz')
puts expander