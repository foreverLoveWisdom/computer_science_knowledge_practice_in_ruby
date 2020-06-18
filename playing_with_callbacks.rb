# A proc is the object form of a block, behaves like a block.
# A lambda has slighly modified behavior and behaves more like a method than a block.

# Calling a proc is like yielding to a block.
# Calling a lambda is like invoking a method.

# Check if a Proc object is a lambda or proc with `lambda?` method.

def test_block_return
  puts "entering outside method..."
  #   1.times { puts "entering block..."; return }
  #   block_def do
  #     puts "entering block..."
  #     return "Exiting the block and also exiting the outside method..."
  #   end
  block_def
  return "exiting outside method" # This line is never executed
end

def block_def
  puts "Entering inside method..."

  1.times do
    puts "entering block..."
    return
  end

  #   yield if block_given?
  "Exiting inside method"
end

# A proc is like a block, so if I call a proc that executes a return statement, it attemps
# to return from the method that encloses the block that was converted to the proc.
def test_proc_return
  puts "Entering outside method..."
  #   p = Proc.new { puts "entering proc"; return }
  #   p.call

  # By converting a block into an object, we are able to pass that object around and use it
  # and use it "out of context". If we do this, we run the risk of returning from a method
  # that has already returne, as was the case here.
  # When this happens, Ruby raises a LocalJumpError

  # The fix for this example is to REMOVE the unnecessary RETURN statement.
  # However, a RETURN statement is not always unnecessary, and another fix is to
  # use a lambda instead of a proc.
  p = proc_def
  p.call
  return puts "Exiting outside method..." # This line is never executed
end

def proc_def
  puts "Entering inside method..."
  p = Proc.new do
    puts "Entering proc..."
    puts "Exiting proc..."
  end
end

# Lambda works like a method. Its RETURN statement will return from the Lambda itself,
# not from the method that surrounds the creation site of the lambda.
def test_lambda_return
  puts "Entering outside method..."
  i_am_lambda = lambda_def("Entering lambda")
  i_am_lambda.call
  puts "Exiting outside method..."
end

def lambda_def(message)
  lambda do
    puts message
    return
  end
end

# puts test_block_return
# puts test_proc_return
# puts test_lambda_return

# The Proc object creates a new binding when it is instantiated
#   When calling the proc, we can ask for the value of the variable.

# However, if we define the Proc object before instantiating the var value
#   It will raise an error.

# Thus, any variables accessed in a proc should be defined before
#   the proc is created or passed as an argument.

# We can, however, change the variable after it has been defined in the main context since
#   the proc’s binding holds a reference to it instead of copying it.
foo = 2

def return_proc(n)
  n *= 10
  p = Proc.new do |data|
    data.collect do |ele|
      puts ele * n
    end
  end
end

a = 3
b = a
test_proc = return_proc(b)
test_proc.call([1, 2, 3])
# puts "Foo now is: #{foo}"

# To keep track of the current scope, Ruby uses bindings, which
#   encapsulate the execution context at each position in the code.

# The binding method returns a Binding object which describes the bindings at
#   the current position.

# The binding object has a method named #local_variables which
#   returns the names of all local variables available in the current scope.

# print binding.local_variables
# puts "\n"

def multiply(data, n)
  #   puts "Current local vars are: #{binding.local_variables}"
  data.collect do |x|
    n += 1
    print("#{x * n} ")
  end
  #   puts "Current value of n is: #{n}"
end

# puts multiply([1, 2, 3], 2)

def multiplier(n)
  #   puts "Current local vars are: #{binding.local_variables}"
  #   puts "Current value of n is: #{n}"
  lambda { |data| data.collect { |x| x * n } }
end

a = 2
print binding.local_variables
puts "\n"
doubler = multiplier(a)
puts doubler.call([1, 2, 3])

# Blocks are basically nameless functions.
# You may be familiar with the lambda from other languages like Lisp or Python.
# Basically, you can pass a nameless function to another function, and then that
#   function can invoke the passed-in nameless function.
#       For example, a function could perform iteration by passing one item at a time to
#           the nameless function. This is a common style, called higher order function style,
#           among languages that can handle functions as first class objects.
#           Lisp does it. Python does it .Even C does it with function pointers.
#           Many other languages do this style of programming.
#           In Ruby, the difference is mainly a different kind of syntax for
#           higher order functions. In other languages, you have to specify explicitly
#           that a function can accept another function as an argument.
#           But in Ruby, any method can be called with a block as an implicit argument.
#           Inside the method, you can call the block using the yield keyword with a value.

# Basically, blocks are designed for loop abstraction.
# The most basic usage of blocks is to let you define your own way for iterating over
#    the items.

# By using blocks, we can hide the loop logic inside the method or function.
# So for example by calling list.reverse_each , you can do a reverse iteration over
#   the list without knowing how the list is implemented on the inside.

# Yes, and that also means you can define many ways to iterate. You could provide
#   a forward way to iterate, a backward way, and so on.
#   It's up to you. C# has an iterator, but it has just one iterator per class.
#       In Ruby you can have an arbitrary number of iterators if you want.
#   If you have a tree class, for example, which you think people will want to
#   traverse depth first and breadth first, you can provide both kinds of traversal by
#       providing two different methods.

# The details of how to iterate should belong to the service provider class.
#   The client should know as little as possible. That was the original purpose of blocks.
#   In fact, in early versions of Ruby, the methods called with blocks were
#       referred to as iterators, because they were designed to iterate.
#       But in the history of Ruby, the role of blocks was
#           later enhanced from loop abstraction to anything.
# For example, we can create a closure out of a block. A closure is
#   a nameless function the way it is done in Lisp.
#   You can pass around a nameless function object, the closure, to
#       another method to customize the behavior of the method.
#       As another example, if you have a sort method to sort an array or list,
#           you can pass a block to define how to compare the elements.
#       This is not iteration. This is not a loop. But it is using blocks.

# Refer here https://www.artima.com/intv/closures.html#part2
# and here: https://skorks.com/2010/05/closures-a-simple-explanation-using-ruby/

# A closure is basically a function/method that has the following two properties:
#   You can pass it around like an object (to be called later)
#   It remembers the values of all the variables that were
#       in scope when the function was created.
#       It is then able to access those variables
#           when it is called even though they may no longer be in scope.

# In order for the language to be able to support closures, it must support
#   first-class functions.
#   A first class function is a function that can be treated like an object in that you can
#       store it in collections and pass it as a parameter to other functions.
#   As I said, the ability to be passed around is the first property of a closure.

# A normal function is defined in a particular scope (i.e. in a class) and can only be called
#   within that scope.
#   This function has access to all the variables in the scope that it is defined,
#       like the parameters that are passed into it as well as class variables.

# A closure on the other hand may be defined in one scope and be called
#   in a completely different scope (since we can pass it around before calling it).
#       Because of this, when a closure is created, it retains the values of
#          all the variables that were in scope when the closure was defined.
#       Even if the variables are generally no longer in scope when the closure is called,
#           within the closure they still are.
#       In other words, the closure retains knowledge of its lexical environment
#           at the time it was defined.

# In that sense, I gotta change the scope to test if I can access the lexical env from closures
# as its property.

def tes_a_proc_return
  puts "inside of method..."
  lambda_1 = lambda do
    # Lambda only returns from itself.
    return
  end
  proc = Proc.new do
    # But a proc will try to return from the current context.

    # If the proc was inside a method, then calling return would be equivalent to
    #   returning from that method.
    puts "inside of a proc.."
  end
  lambda_1.call
  proc.call
  puts "Exiting the method... "
end

tes_a_proc_return
