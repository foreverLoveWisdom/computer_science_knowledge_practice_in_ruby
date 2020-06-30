# RSpec.describe block creates an example group.
#   An example group defines what you are testing, and keep related specs together
#   it 'delicious' is an example of the sandwich's use (test case)
#     each example focuses on 1 particular slice of behaviour

# A test: validates that a bit of code is working properly
# A spec describes the desired behaviour of a bit of code
# An example shows how a particular API is intended to be used


# Inside example, follow Arrange/Act/Assert pattern:
#   1. Set up an object
#   2. do sth with it
#   3. check that it behaved the way you wanted
#     expect is like assert in other framework
#  Patter: describe -> it -> expect
#   Pattern to write test: Red -> Green -> Refactor

# Usually I will put this logic code in a separate file, typically in the "lib" directory
Sandwich = Struct.new(:taste, :toppings)


# 3 ways to set up common code:
#   1. RSpec hooks
#   2. Ruby helper methods
#   3. RSpec's let construct initializes data on demand


RSpec.describe 'An ideal sandwich' do
  # Serves as a documentation what sandwich should do
  # Check what it is supposed to do

  # This is helper method. Just plain ruby code.
  # def sandwich
  #   puts "Inside of sandwich helper..."
  #   @sandwich ||= Sandwich.new('delicious', [])
  # end

  # The above method can be replaced by
  let(:sandwich) { Sandwich.new('delicious', []) }

  # RSpec Hooks
  #   Each time RSpec is about to start running one of my the examples,
  #     it will run any before hooks that apply.
  #   The setup code is shared across specs, but the individual Sandwich instance is not
  #   1. Great for running common setup code that has real-world side effects.
  #       If I need to clear out a test database before each example
  #           hook is a great place to do so.
  #   2. Work fine for stashing your test objects in instance variables
  #   Drawbacks:
  #     1. Misspell instance variable -> return nil -> do not fail test
  #     2. Need to go through entire file and replace with instance variables
  #     3. Not all examples use instance variables, and if we initialize heavy objects
  #         it is gonna affect performance.

  # before { @sandwich = Sandwich.new('delicious', []) }

  it 'is delicious' do
    # taste = @sandwich.taste
    taste = sandwich.taste

    # In other framework: assert_equal('delicious', taste, 'Sandwich is not delicious')
    # Which one is more readable?
    expect(taste).to eq('delicious')
  end

  it 'lets me add toppings' do
    # toppings = @sandwich.toppings << 'cheese'

    sandwich.toppings << 'cheese'
    toppings = sandwich.toppings
    expect(toppings).not_to be_empty
  end
end