# Summation of primes
# Problem 10
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

def prime?(num)
  return false if num < 2
  (2..Math.sqrt(num).to_i).each do |i|
    return false if num % i == 0
  end
  true
end

puts (0..2_000_000).inject { |sum, n| prime?(n) ? sum + n : sum }
