# Availability to instance methods:
#   Class instance variables are available only to class methods and not to instance methods.
#       The above is common sense. How can an instance method get accessed to class instance variable?
#           Unless it access it through a class method.
#   Class variables are available to both instance methods and class methods.

#Inheritability:
#   Class instance variables are lost in the inheritance chain.
#   Class variables are not.

class Parent
  @things = []
  @@klass_var = []

  def self.things
    @things
  end

  def self.get_klass_var
    @@klass_var
  end

  def things
    # Can't access to CLASS INSTANCE VARIABLE @things unless
    #   through a class method which is shown below.

    # However, we access the CLASS VARIALBES inside of this intance method
    #   puts @@klas_var
    self.class.things
  end

  def get_klass_var
    @@klass_var
  end
end

class Child < Parent
end

puts "Original class instance variable: #{Parent.things}"
puts "Original class variable: #{Parent.get_klass_var}"

puts "Class instance varialbe is lost through the inheritance chain: #{Child.things}"

Parent.things << "R15 V3"
Parent.get_klass_var << "GSXR-150"

puts "After class instance variable modified: #{Parent.things}"
puts "After class variable modified: #{Parent.get_klass_var}"

# mom = Parent.new

# puts "Mom's things: #{mom.things}"

# Parent.things << "Exciter 155"
# puts "Mom's things: #{mom.things}"

# puts "Get class var through class object: #{mom.get_klass_var}"
puts "Get class var through child class: #{Child.get_klass_var}"

puts "#{Parent.klass_var}"
