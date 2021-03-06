# Reciprocal cycles
# Problem 26
# A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
#
# 1/2 =   0.5
# 1/3 =   0.(3)
# 1/4 =   0.25
# 1/5 =   0.2
# 1/6 =   0.1(6)
# 1/7 =   0.(142857)
# 1/8 =   0.125
# 1/9 =   0.(1)
# 1/10  =   0.1
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
#
# Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

# Solution description:
# http://mathworld.wolfram.com/MultiplicativeOrder.html
# The multiplicative order of 10 mod an integer n relatively prime to 10 gives the period of the decimal expansion of the reciprocal of n (Glaisher 1878, Lehmer 1941). For example, the haupt-exponent of 10 (mod 13) is 6, and
# 1/13 = 0.(076923)

def prime?(n)
  return false if n < 2
  (2..Math.sqrt(n).to_i).each { |i| return false if n % i == 0 }
  true
end

max_i, max_n = 0, 0
(1...1_000).each do |n|
  next unless prime?(n)
  loop.with_index(1) do |_, i|
    if (10**i) % n == 1
      max_i, max_n = i, n if i > max_i
      break
    end
    break if i > n
  end
end
puts "max cycle length=#{max_i} for n=#{max_n}"
