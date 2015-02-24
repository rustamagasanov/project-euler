# Pandigital multiples
# Problem 38
# Published on Friday, 28th February 2003, 08:00 pm; Solved by 35678
# Take the number 192 and multiply it by each of 1, 2, and 3:
#
# 192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576
# By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
#
# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
#
# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?

def pandigital?(n)
  n.size == 9 && n.chars.uniq.map(&:to_i).size == 9 && !n.to_s.include?('0')
end

largest_pandigital = 0
loop.each_with_index do |_, i|
  products = []
  multiplier = 1

  while products.join.length < 9
    products << i * multiplier
    multiplier += 1
  end

  if pandigital?(products.join) && products.join.to_i > largest_pandigital
    largest_pandigital = products.join.to_i
    puts largest_pandigital
  end

  break if i.to_s.size >= 5
end
