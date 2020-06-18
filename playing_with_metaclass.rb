# Singleton methods contradict that instance objects cannot hold methods,
#   only class definitions (objects of class Class) can.
#   It happens that the truth is somewhere in-between.
#   When you declare a singleton method on an object,
#       Ruby automatically creates a class to hold just that method.
#       This class is called the 'metaclass' of the object.
#   All subsequent singleton methods of this object goes to its metaclass(eigenclass, metaclass,
#       shadow-class, singleton class, anonymous class...)
#       Whenever you send a message to the object,
#           it first looks to see whether the method exists in its metaclass.
#           If it is not there, it gets propagated to the actual class of the object and
#               if it is not found there, the message traverses the inheritance hierarchy.

# When you define a singleton method on a given object, only that object can call that method.
# But any object can have singleton methods added to it.
#   The ability to define method- driven behavior on a per-object basis is
#       one of the hallmarks of Ruby’s design.

# As you’ve seen, the most common type of singleton method is the class method—a method added
#   to a Class object on an individual basis.

#   Every object has two classes:
#       ■ The class of which it’s an instance
#       ■ Its singleton class

#   In Ruby, methods can be called by three ways:
#       1. The method is called by a class: MyClass.my_method
#       2. The method is called by an object: my_object.my_method
#       3. With an implicit caller: puts('puts is an implicit call to self.puts')

# The eigenclass is an unnamed instance of the class Class attached to an object
#   and which instance methods are used as
#       singleton methods of the defined object (a class in this case
#            because a class is also an object in Ruby)

class Klass
  # This singleton method is also an instance method since Klass is an instance of Class
  def self.first_singleton_class_method
    puts "Actually there is no class method in Ruby since a class is also a object."
    puts "It is an instance of the Class class indeed."
    puts "This is a singleton method of the class/object #{self}"
  end

  def initialize
    puts "Initializing an object..."
  end

  def self.eigenclass
    class << self
      print "List of modules & classes nested at this point: #{Module.nesting}\n"
      puts "Self in the context of this eigenclass method is: #{self}, an instance of the class Class"
      puts "This anonymous class keeps track of the class to which it is attached — Klass in this case"
    end
  end
end

class Child < Klass
end

class GrandChild < Child
end

# Klass.first_singleton_class_method
puts Klass.eigenclass


# puts Klass.eigenclass.name
# print Klass.singleton_methods
# puts "\n"
# print Klass.eigenclass.instance_methods(false)
# GrandChild.first_singleton_class_method

obj = Klass.new

# def obj.first_singleton_method
#   puts "This is a singleton method of the object #{self} at memory address: #{self.object_id}"
# end

# obj_2 = GrandChild.new
# obj_2.first_singleton_method
# obj.first_singleton_method

Module.class
Class.superclass
Array.ancestors