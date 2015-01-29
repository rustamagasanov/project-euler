# Longest Collatz sequence
# The following iterative sequence is defined for the set of positive integers:
#
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.

def collatz_sequence(n, chain = [n])
  if n != 1
    next_n = n.even? ? (n / 2) : (3 * n + 1)
    collatz_sequence(next_n, chain << next_n)
  else
    chain
  end
end

longest_chain_length = 0
longest_chain = []
longest_chain_starting_number = 0
(1..1_000_000).each do |n|
  puts "current number = #{ n }; current longest chain starting number = #{ longest_chain_starting_number }; current longest chain length = #{ longest_chain_length }"
  chain = collatz_sequence(n)
  chain_length = chain.length
  if chain_length > longest_chain_length
    longest_chain_starting_number = n
    longest_chain = chain
    longest_chain_length = chain_length
  end
end

puts "longest chain staring number = #{ longest_chain_starting_number }"
puts "longest chain length = #{ longest_chain_length }"
puts "longest chain = #{ longest_chain }"
