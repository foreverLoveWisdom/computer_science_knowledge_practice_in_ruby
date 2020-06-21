class Node
  attr_accessor :next

  def initialize(value)
    @value = value
    @next  = nil
  end
end

class Queue
  attr_accessor :first, :last, :length

  def initialize
    @first  = nil
    @last   = nil
    @length = 0
  end

  def peek
    first
  end

  def enqueue(node)
    if length.zero?
      self.first = self.last = node
    else
      last.next = node
      self.last = node
    end

    self.length += 1
    self
  end

  def dequeue
    if length.zero?
      'Nothing to dequeue because queue is empty!'
    else
      # If we want to return the removed node
      # first_node      = first.dup
      # first_node.next = nil
      self.first  = if length == 1
                      self.last = nil
                    else
                      first.next
                    end
      self.length -= 1
      self
    end
  end

end

my_queue = Queue.new
my_queue.enqueue(Node.new(3)).inspect
puts "\n"
print my_queue.enqueue(Node.new(444))
puts "\n"
print my_queue.enqueue(Node.new(8888)).inspect
puts "\n"
print my_queue.dequeue.inspect
puts "\n"
print my_queue.dequeue.inspect
puts "\n"
print my_queue.dequeue.inspect
