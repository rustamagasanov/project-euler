# Distinct primes factors
# Problem 47
# Published on Friday, 4th July 2003, 08:00 pm; Solved by 32875
# The first two consecutive numbers to have two distinct prime factors are:
#
# 14 = 2 × 7
# 15 = 3 × 5
#
# The first three consecutive numbers to have three distinct prime factors are:
#
# 644 = 2² × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.
#
# Find the first four consecutive integers to have four distinct prime factors. What is the first of these numbers?

class DistinctPrimeFactors
  attr_reader :known_primes

  def initialize
    @known_primes = []
  end

  def update_known_primes(n)
    @known_primes << (@known_primes[-1].to_i + 1..n / 2).select { |i| prime?(i) }
    @known_primes.flatten!
  end

  def prime_factors_count(n)
    update_known_primes(n)
    known_primes.select { |i| n % i == 0 }.count
  end

  def prime?(n)
    return false if n < 2
    (2..Math.sqrt(n).to_i).each do |i|
      return false if n % i == 0
    end
    true
  end
end

counter = 0
klass = DistinctPrimeFactors.new
loop.with_index do |_, i|
  if klass.prime_factors_count(i) == 4
    counter += 1
    if counter == 4
      puts i - 3
      break
    end
  else
    counter = 0
  end
end
