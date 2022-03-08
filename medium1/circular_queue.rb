# First attempt - Works but not fixed size.
# class CircularQueue
#   def initialize(buffer_size)
#     @buffer_size = buffer_size
#     @queue = []
#   end

#   def enqueue(value)
#     @queue.shift if @queue.size == @buffer_size
#     @queue.push(value)
#   end

#   def dequeue
#     @queue.shift
#   end
# end

# Second attempt - Fixed size
class CircularQueue
  def initialize(buffer_size)
    @queue = Array.new(buffer_size)         # Full of nils
  end

  # Keep adding to the back. All nils are in the front.
  def enqueue(value)
    @queue.shift
    @queue.push(value)
  end

  # Extract first non-nil, and replace with nil.
  def dequeue
    return nil if @queue.all?(nil)
    non_empty = @queue.compact.size
    oldest = @queue[-non_empty]
    @queue[-non_empty] = nil
    oldest
  end
end


queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil