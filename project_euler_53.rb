def factorial(n)
  n == 0 ? 1 : (1..n).reduce(:*)
end

def c(n, r)
  factorial(n) / (factorial(r) * factorial(n - r))
end

results = []
(1..100).each do |n|
  (1..n).each do |r|
    result = c(n, r)
    results << result if result > 1_000_000
  end
end

puts results.count
