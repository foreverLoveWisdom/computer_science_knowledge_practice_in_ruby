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


RSpec.describe 'An ideal sandwich' do
  # Serves as a documentation what sandwich should do
  # Check what it is supposed to do
  it 'is delicious' do
    sandwich = Sandwich.new('delicious', [])
    taste    = sandwich.taste

    # In other framework: assert_equal('delicious', taste, 'Sandwich is not delicious')
    # Which one is more readable?
    expect(taste).to eq('delicious')
  end
end