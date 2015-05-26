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

primes = EratosthenesSieve.new(Math.sqrt(limit)).get_primes

loop.with_index(0) do |_, i|
  max * primes[i] > limit ?  break : max *= primes[i]
end

puts max
