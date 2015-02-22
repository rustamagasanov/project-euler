puts (1..999_999).select { |num|
  num.to_s == num.to_s.reverse && num.to_s(2) == num.to_s(2).reverse
}.reduce(:+)
