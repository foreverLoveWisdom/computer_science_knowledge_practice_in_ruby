# Implement my own Array data structure based on built-in Array class in ruby
class MyArray
  attr_accessor :length, :data

  def initialize(length = 0, data = [])
    @length = length
    @data   = data
  end

  def index(value)
    data.index(value) || 'Element does not exist'
  end

  def push_to_end(value)
    data[length] = value
    self.length  += 1
    data
  end

  def pop_the_last
    data.delete(data[length - 1])
    self.length -= 1
    data
  end

  def delete_at_index(index)
    deleted_item = data[index]
    shift_items(index)
    deleted_item
  end

  def shift_items(index)
    index.upto(length - 1) do |idx|
      data[idx] = data[idx + 1]
    end

    data.delete(data[length - 1])
    self.length -= 1
  end

end

arr = MyArray.new(5, [1, 2, 3, 4, 5])
puts arr.index(6)
arr.push_to_end(12)
arr.pop_the_last
# print "Deleted item at index 1 is: #{arr.delete_at_index(1)} "
# print arr.data
puts arr.delete_at_index(3)
print arr.data
# print arr.length

# Most used often methods:
# each, each_with_index
# collect, map
# uniq
# Set data structure for uniq elements
# reverse
# compact
# delete
# sort, passing a block if sort_by doesn't work
# sort_by
