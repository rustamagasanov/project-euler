# Highly divisible triangular number
# Problem 12
# The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:
#
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#
# Let us list the factors of the first seven triangle numbers:
#
#   1: 1
#   3: 1,3
#   6: 1,2,3,6
#  10: 1,2,5,10
#  15: 1,3,5,15
#  21: 1,3,7,21
#  28: 1,2,4,7,14,28
#  We can see that 28 is the first triangle number to have over five divisors.
#
#  What is the value of the first triangle number to have over five hundred divisors?

# euristic
def foo(number)
  [2, 3, 4, 5, 7].each do |i|
    return true if number % i != 0
  end
  false
end

def get_factors(number)
  factors = [1, number]
  num_to_check = 2
  complete_flag = number == 1 || foo(number)

  while !complete_flag
    if number % num_to_check == 0
      factors << num_to_check
      factors << number / num_to_check
    end
    num_to_check += 1
    complete_flag = factors.include?(num_to_check)
  end
  factors.sort
end

triangle_number = 0
next_digit = 1

loop do
  triangle_number += next_digit
  next_digit += 1
  factors = get_factors(triangle_number)
  break if factors.count >= 500
end
puts triangle_number
