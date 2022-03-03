=begin
Complete this program so that it produces the expected output:
The author of "Snow Crash" is Neil Stephenson.
book = "Snow Crash", by Neil Stephenson.

attr_accessor supplies both getter and setter.

attr_reader supplies getters only. It is equivalent to:
def title
  @title
end

attr_writer supplies setters only. It is equivalent to:
def author
  @author
end

We could write explicitly-defined getter and setter methods if we plan to 
customize their behavior.
=end

class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)