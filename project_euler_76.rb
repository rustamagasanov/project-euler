# Counting summations
# Problem 76
# It is possible to write five as a sum in exactly six different ways:
#
# 4 + 1
# 3 + 2
# 3 + 1 + 1
# 2 + 2 + 1
# 2 + 1 + 1 + 1
# 1 + 1 + 1 + 1 + 1
#
# How many different ways can one hundred be written as a sum of at least two positive integers?

target = 100
ways = [1] + [0] * target

(1...target).each do |n|
  (n...target + 1).each do |i|
    ways[i] += ways[i - n]
  end
end
# 1..4 -> n
#

puts ways[target]
