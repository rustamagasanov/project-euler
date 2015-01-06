n1, n2, sum = 1, 1, 0

loop do
  break if n2 > 4_000_000
  sum += n2 if n2.even?
  n1, n2 = n2, n1 + n2
end

puts sum
