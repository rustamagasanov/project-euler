# Counting fractions in a range
# Problem 73
# Published on Friday, 2nd July 2004, 08:00 pm; Solved by 15745; Difficulty rating: 15%
# Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1, it is called a reduced proper fraction.
#
# If we list the set of reduced proper fractions for d ≤ 8 in ascending order of size, we get:
#
# 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
#
# It can be seen that there are 3 fractions between 1/3 and 1/2.
#
# How many fractions lie between 1/3 and 1/2 in the sorted set of reduced proper fractions for d ≤ 12,000?

# 7295372
def gcd(a, b)
  a, b = b, a if b > a
  c = a % b
  if c == 0
    b
  else
    gcd(b, c)
  end
end

one_two = 1 / 2.0 #Rational(1, 2)
one_three = 1 / 3.0 #Rational(1, 3)
n = 0

(1..12_000).each do |den|
  p den
  (1..den - 1).each do |num|
    # f = Rational(num, den)
    next if gcd(den, num) != 1 #f.numerator != num
    f = num / den.to_f
    break if f >= one_two
    if f > one_three
      n += 1
    end
  end
end

puts n
