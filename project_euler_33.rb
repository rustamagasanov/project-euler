# Digit cancelling fractions
# Problem 33
# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
#
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
# There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
#
# If the product of these four fractions is given in its lowest common terms, find the value of the denominator.

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
