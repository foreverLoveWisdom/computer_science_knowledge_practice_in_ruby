# Map over a Hash

# There’s a new method (since Ruby 2.4) called Hash#transform_values that you could use pretty much like you would use an Array.
#
h = { a: 1, b: 2, c: 3 }

h.transform_values {|v| v * v + 1 }
# => { a: 2, b: 5, c: 10 }

my_array = [
  [1, 2, 3, 4],
  [5, 6, 7, 8],
]

my_array.map { |row| row.map { |col| col + 1 } }
# => [[2, 3, 4, 5], [6, 7, 8, 9]]


["a", "b", "c"].each_with_index.map { |n, i| n + i.to_s } # => ["a0", "b1", "c2"]
["a", "b", "c"].map.with_index { |n, i| n + i.to_s } # => ["a0", "b1", "c2"]

# You use map to collect the result of running the block over the elements of the array. And you use each to run the block over the elements without collecting the values. You can read more about using the each method here.


class Hash
  def my_map(&block)
    result = []
    self.each do |pair|
      puts "The pair is: #{pair}"
      result << yield(pair.first, pair.last)
    end

    result
  end
end

hash = {name: 'tien', age: 31}
# puts(hash.my_map {|k, v| [k, v]}.flatten.inspect)
puts(hash.map {|k, v| [k, v]}.flatten.inspect)

