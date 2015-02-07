# Factorial digit sum
# Problem 20
# n! means n × (n − 1) × ... × 3 × 2 × 1
#
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!

def factorial(n, product = 1)
  return 0 if n < 1
  (n != 1) ? factorial(n - 1, product * n) : product
end

puts factorial(100).to_s.chars.map(&:to_i).reduce(:+)
