# What is CPU scheduling?
# What is a thread?
# What is a process?
# How 1 CPU with 1 core executes threads?
# How 1 CPU with multiple core executes threads?
# What is concurrency?
# What is parallel? Difference with concurrency?
# What is CPU scheduling? How does it connect to thread, and process?




# t = Thread.new do
#   puts "[Starting thread]"
#   Thread.stop
#   puts "[Resuming thread]"
# end

# puts "Status of thread: #{t.status}"
# puts "Is thread stopped? #{t.stop?}"
# puts "Is thread alive? #{t.alive?}"
# puts
# puts "Waking up thread and joining it..."
# t.wakeup
# t.join
# puts
# puts "Is thread alive? #{t.alive?}"
# puts "Inspect string for thread: #{t.inspect}"

# f = Fiber.new do
#   puts "Hi"
#   Fiber.yield
#   puts "Nice day"
#   Fiber.yield
#   puts "Bye!"
# end

# f.resume
# puts "Back to the fiber:"
# f.resume
# puts "One last message from the fiber."
# f.resume
# puts "That's all"

factorial1000 = Thread.new do
  begin
    prod = 1
    1.upto(1000) { |n| prod *= n }
    puts "1000! = #{prod}"
  rescue
    # Do nothing...
  end
end

sleep 0.0001

if factorial1000.alive?
  factorial1000.raise("Stop!!!")
  puts "Calculation was interrupted"
else
  puts "Calculation was successful!"
end

a1 = 2
b1 = 3

a = Thread.new do
  puts 'Inside thread a ...'
  print "a"
  print "\n"
  # puts "Thread a is sleeping now..."
  # sleep(3)
  print "b"
  puts "\n"
  print "c"
  print "\n"
end

x = Thread.new do
  puts 'Inside thread x...'
  a1 = 999
  b1 = 444
  puts "a1: #{a1} "
  puts "b1: #{b1} "
  puts "z"
end

a.join
# puts "a1: #{a1}"
# puts "b1: #{b1}"
# x.join # Let thread x finish, thread a will be killed on exit.
