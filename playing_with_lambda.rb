# frozen_string_literal: true

# A lambda is a way to define a block & its parameters with some special syntax.

# You can save this lambda into a variable for later use.
# Defining a lambda won’t run the code inside it, just like defining a method won’t run the method, you need to use the call method for that.

say_something = -> { puts 'this is a lambda' }
lambda_with_arg = ->(x) { x * 2 }
puts lambda_with_arg.call(100)

# Procs are a very similar concept…

# There is no dedicated Lambda class. A lambda is just a special Proc object. If you take a look at the instance methods from Proc, you will notice there is a lambda? method.

my_proc = proc { |x| puts x }

# A proc behaves differently than a lambda, specially when it comes to arguments

t = proc { |_x, _y| puts "I don't care about arguments!" }
t.call

A lambda will return normally, like a regular method.

# But a proc will try to return from the current context.

