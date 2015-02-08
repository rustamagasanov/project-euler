# Amicable numbers
# Problem 21
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

class AmicableNumbers
  def find_till(n)
    (2..n).inject([]) do |memo, i|
      next memo if memo.include?(i)
      a = d(i)
      if a != i
        b = d(a)
        memo << a << b if i == b
      end
      memo
    end.uniq
  end

  private
  def d(n)
    Factors.find(n)[0..-2].reduce(:+)
  end
end

module Factors
  extend self

  def find(n)
    return [1] if n == 1
    (2..n).to_a.inject([1, n]) do |factors, i|
      break factors if factors.include?(i)
      (n % i == 0) ? (factors << i << n / i) : factors
    end.sort
  end
end

puts AmicableNumbers.new.find_till(10000).reduce(:+)
