# Square digit chains
# Problem 92
# A number chain is created by continuously adding the square of the digits in a number to form a new number until it has been seen before.
#
# For example,
#
# 44 → 32 → 13 → 10 → 1 → 1
# 85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89
#
# Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop. What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.
#
# How many starting numbers below ten million will arrive at 89?

known_chains = []
puts (2...10_000_000).inject(0) { |memo, i|
  next_num, curr_chain_elems = i, [i]
  loop do
    digits = next_num.to_s.chars.map(&:to_i)
    next_num = digits.map { |d| d**2 }.reduce(:+)

    curr_chain_elems << next_num

    if next_num == 1 || next_num == 89 || known_chains[next_num] != nil
      if next_num == 89 || known_chains[next_num] == 89
        memo += 1
        curr_chain_elems.each { |elem| known_chains[elem] = 89 }
      else
        curr_chain_elems.each { |elem| known_chains[elem] = 1 }
      end
      break
    end
  end
  memo
}
