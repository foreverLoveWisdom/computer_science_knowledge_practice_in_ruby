class Square
  # This is the interface that the user has access to
  # When I create an interface for the alogirthm and if my algorithm changes
  # I don't need to change my interface. That is the reason why we need to
  # use interface.
  # So, what is the question that I need to ask myself when designing a class?
  # What doesn't the user need to know?
  # Or I should ask, what is most likely to change later?
  # If the user depends on the things that are easy to change, is it a good design?
  def get_square(value)
    calculate_square(value)
  end

  # If I expost this behaviour to the outside, and this behaviour changes
  # I also need to change its interface, and what if they are scattered
  # everywhere in the source code???
  def expose_internal_algo(value)
    value * value
  end

  private

  def calculate_square(value)
    value * value
  end
end

square = Square.new
puts square.expose_internal_algo(10).inspect
puts square.get_square(10).inspect
