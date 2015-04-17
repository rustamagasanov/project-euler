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

ways = [1] + [0] * 100
variations = (1...100).to_a

variations.each do |i|
  (i..100).each do |j|
    ways[j] += ways[j - i]
  end
end

puts ways[100]
