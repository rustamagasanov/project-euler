# Prime permutations
# Problem 49
# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
#
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
#
# What 12-digit number do you form by concatenating the three terms in this sequence?

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

permutations = Hash.new { |h, k| h[k] = [] }

primes = EratosthenesSieve.new(9999).get_primes.reject { |p| p < 1000 }
primes.each { |p| permutations[p.to_s.chars.map(&:to_i).sort.join] << p }

permutations.reject! { |k, v| v.size < 3 }

permutations.each do |k, permutation|
  diffs = []
  (0..permutation.size - 1).each { |i| diffs[i] = []; (i + 1..permutation.size - 1).each { |j| diffs[i] << permutation[j] - permutation[i] } }
  diffs.each { |d| d.each { |v| p "#{d} #{permutation}" if d.include?(v * 2) } }
end
