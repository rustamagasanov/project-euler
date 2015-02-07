def factorial(n, product = 1)
  return 0 if n < 1
  (n != 1) ? factorial(n - 1, product * n) : product
end

puts factorial(100).to_s.chars.map(&:to_i).reduce(:+)
