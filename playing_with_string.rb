# Build string from parts
# Use << is the most efficient way. I can try to test it
hash = {key1: "val1", key2: "val2"}
str = ""

hash.each{|k, v| str << "#{k} is #{v}\n"}
puts str
        
# Substituting variables into strings
number = 5
puts "I am the number #{number}"

# Reverse a string by words or character
s = "abc is a normal string"
s.reverse 
s.split(/(\s+)/)
