# This is stupid. Why would anyone want to implement queue with stack data structure?
# I don't get it...

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
      self.top  = node
    end

    self.length += 1
    self
  end

  def pop
    return 'Current stack is empty!' if length.zero?

    removed_top = top
    if length == 1
      self.top = self.bottom = nil
    elsif length == 2
      bottom.next = nil
      self.top    = bottom
    else
      self.top = top.next
    end

    self.length -= 1
    removed_top
  end

  def peek
    top
  end
end


class Queue
  attr_accessor :stack_1, :stack_2, :length

  def initialize
    @stack_1 = Stack.new
    @stack_2 = Stack.new
    @length  = stack_1.length
  end

  def enqueue(node)
    if length.zero?
      stack_1.push(node)
    else
      1.upto(stack_1.length) do
        top_node = stack_1.pop
        stack_2.push(top_node)
      end
      stack_2.push(node)

      1.upto(stack_2.length) do
        top_node = stack_2.pop
        stack_1.push(top_node)
      end
    end

    self.length = stack_1.length
    stack_1
  end

  def first
    stack_1.peek
  end

  def last
    stack_1.bottom
  end

  def dequeue
    return 'Queue is empty' if length.zero?

    stack_1.pop
    self.length = stack_1.length
    self
  end

  def peek
    stack_1.peek
  end
end

node  = Node.new(9)
queue = Queue.new
queue.enqueue(node)
queue.enqueue(Node.new(88))
queue.enqueue(Node.new(777))
print queue.dequeue.inspect
queue.dequeue
queue.dequeue
print queue.dequeue
