# Pandigital products
# Problem 32
# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
#
# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

puts (1..100).inject([]) { |memo, a|
  (a..2_000).each do |b|
    if "#{a}#{b}#{a * b}".chars.sort.join == '123456789'
      memo <<  a * b
    end
  end
  memo
}.uniq.reduce(:+)
