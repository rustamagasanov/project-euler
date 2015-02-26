# Champernowne's constant
# Problem 40
# An irrational decimal fraction is created by concatenating the positive integers:
#
# 0.123456789101112131415161718192021...
#
# It can be seen that the 12th digit of the fractional part is 1.
#
# If dn represents the nth digit of the fractional part, find the value of the following expression.
#
# d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

c = '0'
loop.each_with_index do |_, i|
  c << (i + 1).to_s
  break if c.size >= 1_000_001
end

puts [c[1], c[10], c[100], c[1_000], c[10_000], c[100_000], c[1_000_000]].map(&:to_i).reduce(:*)
