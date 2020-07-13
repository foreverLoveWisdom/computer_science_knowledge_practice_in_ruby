# frozen_string_literal: true

# Block
# Why use it?
# A Ruby block is useful because it allows you to save a bit of logic (code) & use it later.

# This could be something like writing data to a file, comparing if one element is equal to another,or even printing an error message.

[1, 2, 3].each { |num| puts num }

# Yield is a Ruby keyword that calls a block when you use it.
# It’s how methods USE blocks!
# When you use the yield keyword, the code inside the block will run & do its work.

def test_yield(_arg = nil)
  yield 10
end

test_yield do |block_arg|
  puts 'I love programming'
  puts "This is the value of block argument: #{block_arg}"
end

# What does &block (ampersand parameter) mean?

# Here’s what &object does:

# if the object is a block, it converts it to a Proc.
# if the object is a Proc, it converts it to a block.
# if the object is something else, it calls to_proc on it, and then converts it to a block.

a_proc = :foobar.to_proc
# Executing a_proc.call("some string")

# => NoMethodError: undefined method `foobar' for "some string":String

# So let’s look again at what that does.

# Calling to_proc on the symbol :foobar returns a new Proc (i.e. a_proc).
# a_proc will call the foobar method on any object you send it.

# Here’s what to_proc would look like if you were to redefine it in Ruby.

class Symbol
  def to_proc
    proc { |obj, *args| obj.send(self, *args) }
  end
end
