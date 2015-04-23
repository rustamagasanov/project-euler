permutations = []
loop.with_index(10) do |_, i|
  cube = (i * i * i).to_s
  permutations.each { |set| permutations.delete(set) if set[0].size < cube.size }
  existing_set = permutations.detect { |set| cube.chars.sort == set[0].chars.sort }
  existing_set.nil? ? permutations << [cube] : existing_set << cube
  break if permutations.any? { |set| set.size == 5 }
end
puts permutations.detect { |set| set.size == 5 }.map(&:to_i).min
