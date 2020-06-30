# Class variables are visible,a nd shared by, the class methods and the instance methods of
# a class, and also by the class definition itself

# Class instance variable's advantage
#   The confusing behavior of class variables when subclassing an existing class

# Because class instance variables are just instance variables of class objects, we can use
# attr, attr_reader, and attr_accessor to create accessor methods for them

class Human
  @@no_of_humans = 0
  @no_of_humans  = 0

  class << self
    attr_accessor :no_of_humans
  end

  def initialize(iq, eq)
    @iq            = iq
    @eq            = eq
    @@no_of_humans += 1
  end

  def self.new(iq, eq)
    @no_of_humans += 1
    super
  end

  def love
    "I am in love, and my iq is #{@iq}"
  end

  def breakup
    "I am depressed, and my eq is #{@eq}"
  end

  def report_human
    @@no_of_humans
  end

  def self.report_human
    @no_of_humans
  end
end

me         = Human.new(127, 300)
# my_brother = Human.new(130, 400)
# puts my_brother.report_human
# Human.new(200, 500)
# Human.new(200, 500)
# Human.new(200, 500)
# puts my_brother.report_human
# puts Human.no_of_humans
