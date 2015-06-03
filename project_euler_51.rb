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

primes = EratosthenesSieve.new(999_999).get_primes
primes.reject! { |p| p < 57000 }

positions = []

catch(:done) do
  primes.each do |p|
    p = p.to_s
    p p

    loop.with_index(1) do |_, i|
      pattern = i.to_s(2).rjust(p.size, '0')
      break if pattern.size > p.size
      new_position = (0..pattern.size - 1).select { |j| pattern[j] == '1' }
      positions << new_position unless positions.include?(new_position) || new_position.size == p.size
    end

    positions.each do |position|
      family = []

      (0..9).each do |replacement|
        prime_dup = p.dup
        position.each { |i| prime_dup[i] = replacement.to_s }
        family << prime_dup if PrimeChecker.prime?(prime_dup.to_i)
        break if replacement > 1 && family.size < replacement - 1 # - 2 for 56**3
      end

      if family.size > 7 # 6 for 56**3
        puts "prime is: #{p}, family: #{family}"
        throw(:done)
      end
    end
  end
end
