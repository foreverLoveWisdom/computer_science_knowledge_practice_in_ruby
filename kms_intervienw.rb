# frozen_string_literal: true

def get_divisors(n, divisors)
  2.upto(Math.sqrt(n)) do |number|
    next unless n % number == 0

    quotient = n / number
    divisors.push(number, quotient)
  end
end

def is_perfect?(n)
  divisors = []
  get_divisors(n, divisors)

  n == divisors.inject(1, &:+) ? 'YES' : 'NO'
end


# Time complexity: O(n), n is the number of inputs

def get_group_power
  test_cases = gets.chomp.to_i
  inputs = []
  0.upto(test_cases - 1) do |_index|
    input = gets.chomp.to_i
    inputs << input
  end

  inputs_size = inputs.size
  return(puts 'Input size is too small') if inputs_size < 3

  group = inputs.sort
  sum_constraint = group[-2] + group[-3]
  max_skill = group.last
  group.pop if max_skill > sum_constraint
  group.inject(&:+)
end

