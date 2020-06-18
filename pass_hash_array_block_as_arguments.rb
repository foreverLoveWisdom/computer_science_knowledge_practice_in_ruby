# Playing, experimenting around with Rails passing pattern

# Playing with the splat operators.

# Passing hash as the last argument.

# Passing block back and forth to different methods.

# Using send method

class Array
  def extract_options!
    if last.is_a?(Hash) && last.extractable_options?
      pop
    else
      {}
    end
  end
end

class Hash
  def extractable_options?
    instance_of?(Hash)
  end
end

def hash_playing(*resources, &block)
  hash = resources.extract_options!
  # options = resources.extract_options!.dup
  puts hash

  pass_block_to_another_method(&block) if block_given?
end

def pass_block_to_another_method(&block)
  yield if block_given?
end

def double_splat_hash_arguments(*a, **options)
  puts a
  print "Option is: #{options}"
end

def without_double_splash(*a, options)
  puts a
  print "Option is: #{options}"
end

def pass_double_splats_to_another_method(**options)
  puts options
end

# hash_playing("abcdef", "ghijklmnop", "qrstuvwxyz", "domanhtien@gmail.com") do
#   puts "this is block"
# end

double_splat_hash_arguments('stringalksjdflks', 123, a: 5, b: 99)
puts "\n\n\n"
without_double_splash('stringalksjdflks', 123, a: 5, b: 99)















