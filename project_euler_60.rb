# Prime pair sets
# Problem 60
# The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and concatenating them in any order the result will always be prime. For example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these four primes, 792, represents the lowest sum for a set of four primes with this property.
#
# Find the lowest sum for a set of five primes for which any two primes concatenate to produce another prime.

class EratosthenesSieve
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def get_primes
    res = (0..limit).to_a
    (2..Math.sqrt(limit)).each do |i|
      if res[i].nil?
        next
      else
        (res[i] * 2..limit).step(res[i]) { |j| res[j] = nil }
      end
    end
    res[2..-1].compact
  end
end

class PrimeChecker
  def self.prime?(n)
    return false if n < 2
    (2..Math.sqrt(n)).each do |i|
      return false if n % i == 0
    end
    true
  end
end

primes = EratosthenesSieve.new(1000).get_primes
prime_sets = []

primes.each.with_index do |checking, i|
  prime_sets[i] = [checking]
  (i + 1..primes.size - 1).each do |j|
    if PrimeChecker.prime?("#{checking}#{primes[j]}".to_i) && PrimeChecker.prime?("#{primes[j]}#{checking}".to_i)
      # if !prime_sets[i].empty?
      #   prime_sets[i].each do |k|
      #     if PrimeChecker.prime?("#")
      #   end
        prime_sets[i] << primes[j]
      # end
    end
    break if prime_sets[i].size == 4
  end
end

p prime_sets
