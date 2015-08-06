# Coin partitions
# Problem 78
# Published on 10 September 2004 at 06:00 pm [Server Time]
# Let p(n) represent the number of different ways in which n coins can be separated into piles. For example, five coins can be separated into piles in exactly seven different ways, so p(5)=7.
#
# OOOOO
# OOOO   O
# OOO   OO
# OOO   O   O
# OO   OO   O
# OO   O   O   O
# O   O   O   O   O
# Find the least value of n for which p(n) is divisible by one million.

d = [1]
max = 60_000

# loop.with_index(1) do |_, i|
(1..max).each do |i|
  (i..max).each do |j|
    d[j] = 0 if d[j].nil?
    d[j] += d[j - i]
  end
end
res = d.find_index { |val| val % 1_000_000 == 0 }
puts res if !res.nil?
