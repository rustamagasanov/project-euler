c = '0'
loop.each_with_index do |_, i|
  c << (i + 1).to_s
  break if c.size >= 1_000_001
end

puts [c[1], c[10], c[100], c[1_000], c[10_000], c[100_000], c[1_000_000]].map(&:to_i).reduce(:*)
