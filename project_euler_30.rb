# Digit fifth powers
# Problem 30
# Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
#
# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# As 1 = 1^4 is not a sum it is not included.
#
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#
# Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

# 7 * 9**5 = 413343 - it's impossible that 7 digit number will be equal to sum of powers which is 413_343
# 6 * 9**5 = 354294 - this is the maximum 6 digit number that we can obtain summing up all nines in power 5
puts (10..354_294).inject(0) { |sum, number|
  if number == number.to_s.chars.map(&:to_i).inject(0) { |memo, n| memo += n**5 }
    sum + number
  else
    sum
  end
}
