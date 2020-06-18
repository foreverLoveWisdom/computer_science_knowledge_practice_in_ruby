# Input: [2, 5, 1, 2, 3, 5, 1, 2, 4]
# Output: 2

# Input: [2, 1, 1, 2, 3, 5, 1, 2, 4]
# Output: 1

# Input: [2, 3, 4, 5]
# Output: nil

# Time complexity: O(n) to loop through the array
# Space complexity: O(n) to create key, value for hash. Each of the char will be assigned a value
def get_first_recurring_char(arr)
  hash = {}

  arr.each do |ele|
    key = ele.is_a?(Integer) ? ele.to_s : ele.to_sym
    return ele if hash[key]

    hash[key] = 1
  end
  'The array is unique. No recurring character!!!'
end

puts get_first_recurring_char [3, 5, 1, 2, 4]
