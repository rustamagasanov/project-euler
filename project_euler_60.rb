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

# data = {
#   [prime, prime, prime] => [candidate, candidate, candidate]
#   ...
# }
def search_prime_groups(data)
  res = {}
  data.each do |primes, candidates|
    candidates.each do |candidate|
      res[primes + [candidate]] = []
      if data.first[0].size > 1
        key = data.select { |k, v| k == primes[1..-1] + [candidate] }.first
        if key.nil?
          next
        else
          d = key[1]
        end
      else
        d = data[[candidate]]
      end
      d.each do |checking|
        if PrimeChecker.prime?("#{checking}#{primes[0]}".to_i) && PrimeChecker.prime?("#{primes[0]}#{checking}".to_i)
          res[primes + [candidate]] << checking
        end
      end
    end
  end
  res
end

primes = EratosthenesSieve.new(10_000).get_primes

initial_data = {}
# finding relation of fitting primes for 1 prime { [prime] => [primes] }
primes.each.with_index do |checking, i|
  initial_data[[checking]] = []
  (i + 1..primes.size - 1).each do |j|
    if PrimeChecker.prime?("#{checking}#{primes[j]}".to_i) && PrimeChecker.prime?("#{primes[j]}#{checking}".to_i)
      initial_data[[checking]] << primes[j]
    end
  end
end

primes_depth_2 = search_prime_groups(initial_data)
primes_depth_3 = search_prime_groups(primes_depth_2)
p search_prime_groups(primes_depth_3).reject { |k,v| v == [] }

