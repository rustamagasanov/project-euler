# Consecutive prime sum
# Problem 50
# The prime 41, can be written as the sum of six consecutive primes:
#
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
#
# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
#
# Which prime, below one-million, can be written as the sum of the most consecutive primes?

class EratosthenesSieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def get_primes
    res = (0..limit).to_a
    (2..Math.sqrt(limit)).each do |i|
      next if res[i].nil?
      (res[i] * 2..limit).step(res[i]) do |j|
        res[j] = nil
      end
    end
    res[2..-1].compact
  end
end

limit = 1_000_000

max_primes_count = 0
max_sum = 0

primes = EratosthenesSieve.new(limit).get_primes

(0..Math.sqrt(primes.size)).each do |primes_from|
  primes_count = 0
  sum = primes[primes_from]
  loop.with_index(primes_from + 1) do |_, primes_to|
    if sum + primes[primes_to] >= limit
      if primes.include?(sum) && primes_count > max_primes_count
        max_sum = sum
        max_primes_count = primes_count
      end
      break
    else
      sum += primes[primes_to]
      primes_count += 1
    end
  end
end

puts max_sum
