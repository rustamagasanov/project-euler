res = []
(10..99).each do | numerator|
  (numerator..99).each do |denominator|
    next if numerator % 10 == 0 || denominator % 10 == 0 || numerator == denominator
    common_digit =  (numerator.to_s.chars & denominator.to_s.chars).first
    unless common_digit.nil?
      n = numerator.to_s.gsub(common_digit, '').to_i
      d = denominator.to_s.gsub(common_digit, '').to_i
      if denominator != 0 && d != 0 && Rational(numerator, denominator) == Rational(n, d)
        res << Rational(numerator, denominator)
      end
    end
  end
end
puts res.inject(:*).denominator
