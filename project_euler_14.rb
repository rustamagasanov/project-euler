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
