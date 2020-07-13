# frozen_string_literal: true

# Should master this module
# Enumerable is a collection of iteration methods, a Ruby module, and a big part of what makes Ruby a great programming language.

# Most important methods:
# 1. map
# 2. select, used to filter
# 3. inject

# Enumerable methods work by giving them a block.

# In that block you tell them what you want to do with every element.

arr = [1, 2, 3]

arr.map { |x| x * 2 }

h = arr.each_with_object({}) do |element, hash|
  hash[element.to_s] = 'value'
end
# puts h

class MyHash < Hash
end

my_hash = MyHash.new
my_hash[:a] = 1
my_hash[:b] = 2
my_hash[:c] = 3

my_hash.each_with_object(my_hash) do |memo, key, value|
  puts "This is the key: #{key}"
  puts "This is the value: #{value}"
end
