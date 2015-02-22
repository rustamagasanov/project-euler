# Double-base palindromes
# Problem 36
# The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
#
# Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
#
# (Please note that the palindromic number, in either base, may not include leading zeros.)

puts (1..999_999).select { |num|
  num.to_s == num.to_s.reverse && num.to_s(2) == num.to_s(2).reverse
}.reduce(:+)
