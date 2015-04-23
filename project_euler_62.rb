# Cubic permutations
# Problem 62
# The cube, 41063625 (345^3), can be permuted to produce two other cubes: 56623104 (384^3) and 66430125 (405^3). In fact, 41063625 is the smallest cube which has exactly three permutations of its digits which are also cube.
#
# Find the smallest cube for which exactly five permutations of its digits are cube.

permutations = []
loop.with_index(10) do |_, i|
  cube = (i * i * i).to_s
  permutations.each { |set| permutations.delete(set) if set[0].size < cube.size }
  existing_set = permutations.detect { |set| cube.chars.sort == set[0].chars.sort }
  existing_set.nil? ? permutations << [cube] : existing_set << cube
  break if permutations.any? { |set| set.size == 5 }
end
puts permutations.detect { |set| set.size == 5 }.map(&:to_i).min
