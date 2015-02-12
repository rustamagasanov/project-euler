f1, f2, i = 1, 1, 2

loop do
  f1, f2, i = f2, f1 + f2, i + 1
  break if f2.to_s.size >= 1000
end

puts i
