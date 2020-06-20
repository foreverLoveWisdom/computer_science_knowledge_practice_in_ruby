def test_yield(*args)
  puts "inside method..."
  yield(*args)
  puts "Arguments are: #{args}"
  yield(*args)
  puts "exiting method..."
end

puts test_yield(2, 3, 4, a: 2, b: 4) { |x| puts "x is: #{x}" }
