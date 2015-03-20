# Quadratic primes
# Problem 27
# Euler discovered the remarkable quadratic formula:
#
# n² + n + 41
#
# It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 40² + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.
#
# The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.
#
# Considering quadratics of the form:
#
# n² + an + b, where |a| < 1000 and |b| < 1000
#
# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |−4| = 4
# Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.

def prime?(n)
  return false if n < 2
  (2..Math.sqrt(n).round).each { |i| return false if n % i == 0 }
  true
end

puts (-999..999).each_with_object({top_primes: 0, top_product: 0}) { |a, o|
  (-999..999).each do |b|
    primes_count = 0
    loop.with_index do |_, n|
      if prime?(n * n + a * n + b)
        primes_count += 1
      else
        o[:top_primes], o[:top_product] = primes_count, a * b if primes_count > o[:top_primes]
        break
      end
    end
  end
}[:top_product]
