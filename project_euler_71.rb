# Ordered fractions
# Problem 71
# Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1, it is called a reduced proper fraction.
#
# If we list the set of reduced proper fractions for d ≤ 8 in ascending order of size, we get:
#
# 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
#
# It can be seen that 2/5 is the fraction immediately to the left of 3/7.
#
# By listing the set of reduced proper fractions for d ≤ 1,000,000 in ascending order of size, find the numerator of the fraction immediately to the left of 3/7.

three_seven = 3 / 7.0
current_left = 0
lower_num, lower_den = 1, nil

(1..1_000_000).each do |den|
  # don't check numbers lower than current left
  (lower_num..den - 1).each do |num|
    f = num / den.to_f
    # don't check numbers higher than 3/7
    break if f >= three_seven

    if current_left < f
      current_left = f
      lower_num, lower_den = num, den
      puts "#{lower_num}/#{lower_den}"
    end
  end
end
