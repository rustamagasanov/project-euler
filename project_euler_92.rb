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
