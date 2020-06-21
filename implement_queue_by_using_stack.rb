class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next  = nil
  end
end

class Stack
  attr_accessor :bottom, :top, :length

  def initialize
    @bottom = nil
    @top    = nil
    @length = 0
  end

  def push(node)
    if length.zero?
      self.top = self.bottom = node
    else
      node.next = top
      top.next  = node
      self.top  = node
    end

    self.length += 1
    self
  end

  def pop
    return 'Current stack is empty!' if length.zero?

    if length == 1
      self.top = self.bottom = nil
    elsif length == 2
      bottom.next = nil
      self.top    = bottom
    else
      node_next_to_top = top.next.next
      self.top         = top.next
      self.top.next    = node_next_to_top
    end

    self.length -= 1
    self
  end

  def peek
    top
  end
end


class Queue < Stack
  attr_accessor :first, :last, :length

  def initialize
    super
    # @first  = nil
    # @last   = nil
    # @length = 0
  end

  def enqueue(node)
    push(node)
  end

  def dequeue

  end

  def peek

  end
end

stack = Stack.new
queue = Queue.new
queue.enqueue(12)