# Totient maximum
# Problem 69
# Euler's Totient function, φ(n) [sometimes called the phi function], is used to determine the number of numbers less than n which are relatively prime to n. For example, as 1, 2, 4, 5, 7, and 8, are all less than nine and relatively prime to nine, φ(9)=6.
# n Relatively Prime  φ(n)  n/φ(n)
# 2 1 1 2
# 3 1,2 2 1.5
# 4 1,3 2 2
# 5 1,2,3,4 4 1.25
# 6 1,5 2 3
# 7 1,2,3,4,5,6 6 1.1666...
# 8 1,3,5,7 4 2
# 9 1,2,4,5,7,8 6 1.5
# 10  1,3,7,9 4 2.5
# It can be seen that n=6 produces a maximum n/φ(n) for n ≤ 10.
#
# Find the value of n ≤ 1,000,000 for which n/φ(n) is a maximum.

class EratosthenesSieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def get_primes
    primes = (0..limit).to_a
    (0..1).each { |i| primes[i] = nil }
    (2..Math.sqrt(limit)).each do |prime|
      (prime * 2..limit).step(prime) do |multiple|
        primes[multiple] = nil
      end
    end
    primes.compact
  end
end

limit = 1_000_000
max = 1

primes = EratosthenesSieve.new(limit / 2).get_primes

# n / phi(n) becomes bigger on higher n and lower phi(n)
# lowest phi(n) for n consists of only prime factors
loop.with_index(0) do |_, i|
  max * primes[i] > limit ?  break : max *= primes[i]
end

puts max
