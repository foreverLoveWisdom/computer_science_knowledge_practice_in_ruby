# The visibility of the class variable and instance is always private.
# Access controls are only applicable to methods.
# We can’t apply any access control to the instance and the class variables.
# The private methods in Ruby can also be inherited just like public and protected methods.

# In brief, 3 access controls that are applicable to methods in Ruby:
#   Public
#   Protected
#   Private

# Important notes:
#   By having LESS public methods you INCREASE the freedom of change inside your class.

class Accessor
  # By default, this is public
  def initialize
  end

  # When to use, and why?
  # “A protected method is slow because it can’t use inline cache.”
  # Only if you have a very specific case, like the equals (==) method.
  # The Ruby documentation recommends using private instead of protected whenever possible.
  # That’s the difference, the fact that protected keeps the method private,
  #     but it also allows you to call that method on an object.

  def play_around_protected(arg)
    arg.protected_1
    private_inline
  end

  protected

  def protected_1
    puts "Protected method"
  end

  def protected_2
  end

  def protected_3
  end

  # When to use, and why?

  # self.puts(123) => error
  # puts(123) => works => the self always exist for private methods
  #     Private methods are always called within the context of self.

  # In other words…
  # You can only use private methods with:
  #     Other methods from the same class
  #     Methods inherited from the parent class
  #     Methods included from a module

  # =>  This means you can’t call private methods from outside the class that defines them
  #     Unless… You use a method like send to bypass this rule.
  #         send(:puts, "apple")

  def private_inline
    puts "Private method"
  end

  private :private_inline

  private

  def private_1
  end

  def private_2
  end

  def private_3
  end
end

access_1 = Accessor.new
access_2 = Accessor.new
access_1.play_around_protected(access_2)
