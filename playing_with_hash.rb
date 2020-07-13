# frozen_string_literal: true

coordinates = [10, 5]
treasure_map = { coordinates => 'jewels' }
# puts treasure_map[coordinates]

coordinates << 10

puts treasure_map[coordinates]
puts coordinates
