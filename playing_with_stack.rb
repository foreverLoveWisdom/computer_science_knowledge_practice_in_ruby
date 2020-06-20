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

class Stack
  attr_accessor :top, :bottom, :length

  def initialize
    @top    = nil
    @bottom = nil
    @length = 0
  end

  def peek
    top
  end

  def push(node)
    if length.zero?
      @bottom = @top = node
    else
      current_top = top
      self.top    = node
      top.next    = current_top
    end

    self.length += 1
    self
  end

  def pop
    if length.zero?
      'Nothing to pop because the stack is empty'
    elsif length == 1
      self.bottom = self.top = nil
      self.length = 0
    else
      removed_top = top
      self.top    = top.next
      self.length -= 1
      removed_top
    end
  end
end

# class StackBasedOnArray < Array
#   def initialize
#     super
#   end
#
#   def peek
#     last
#   end
# end

node  = Node.new(8)
stack = Stack.new
stack.push(node)
stack.push(Node.new(99))
print stack.push(Node.new(111)).inspect
puts "\n"
print stack.pop
print "\nCurrent top node is: #{stack.top.inspect}"
print "\nCurrent length is: #{stack.length}"
stack.pop
print "\nCurrent length is: #{stack.length}"
print "\n"
print stack.inspect
stack.pop
print "\nCurrent length is: #{stack.length}"
puts "\n"
print stack.inspect
puts "\n"
puts stack.pop
puts "\n"
print stack.pop
print "\nCurrent top node is: #{stack.top.inspect}"
print "\nCurrent length is: #{stack.length}"
stack.pop
print "\nCurrent length is: #{stack.length}"
print "\n"
print stack.inspect
stack.pop
print "\nCurrent length is: #{stack.length}"
puts "\n"
print stack.inspect
puts "\n"
puts stack.pop
