require 'socket'
s = TCPServer.new(3939)
while (conn = s.accept)
  Thread.new(conn) do |c|
    c.print "Hi. What is your name bro?"
    name = c.gets.chomp
    c.puts "Hi, #{name}. Here is the date"
    c.puts `date`
    c.close
  end
end
