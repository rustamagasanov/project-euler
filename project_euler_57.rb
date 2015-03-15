def expand(i)
  i > 2 ? 2 + Rational(1, expand(i - 1)) : 2 + Rational(1, 2)
end

puts (2..1000).inject(0) { |memo, i|
  e = 1 + Rational(1, expand(i))
  e.numerator.to_s.size > e.denominator.to_s.size ? memo + 1: memo
}

