# Array exploits cache locality => accessing items in memory because they are
# right to each other vs linked-list
# However, linked-list is more dynamic when adding new elements.
# Array may need to double its space to add new elements. What is my priority?

class Node
  attr_accessor :next

  def initialize(value)
    @value = value
    @next  = nil
  end
end

# class Stack
#   attr_accessor :top, :bottom, :length
#
#   def initialize
#     @top    = nil
#     @bottom = nil
#     @length = 0
#   end
#
#   def peek
#     top
#   end
#
#   def push(node)
#     if length.zero?
#       @bottom = @top = node
#     else
#       @top.next = self.top = node
#     end
#
#     self.length += 1
#     self
#   end
#
#   def pop
#     node_next_to_top = top
#     self.length      -= 1
#   end
# end

class StackBasedOnArray < Array
  def initialize
    super
  end

  def peek
    last
  end
end

# node  = Node.new(8)
stack = StackBasedOnArray.new
stack.push(8)
stack.push(99)
print stack.push(111)
puts "\n"
print stack.peek.inspect
