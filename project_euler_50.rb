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
primes = EratosthenesSieve.new(limit).get_primes#[3..23].reduce(:+)

(0..primes.size / 2).each do |primes_from|
  primes_count = 0
  sum = primes[primes_from]
  loop.with_index(primes_from + 1) do |_, primes_to|
    break if sum >= limit
    sum += primes_to
  end
end
