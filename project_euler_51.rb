# Prime digit replacements
# Problem 51
# By replacing the 1st digit of the 2-digit number *3, it turns out that six of the nine possible values: 13, 23, 43, 53, 73, and 83, are all prime.
#
# By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first example having seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and 56993. Consequently 56003, being the first member of this family, is the smallest prime with this property.
#
# Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same digit, is part of an eight prime value family.

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
    # p p

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
        break if replacement > 1 && family.size < replacement - 1
      end

      if family.size > 7
        puts "prime is: #{p}, family: #{family}"
        # I mean wtf? Problem description is missleading
        if family.map(&:to_i).all? { |i| i.to_s.size == 6 }
          throw(:done)
        end
      end
    end
  end
end
