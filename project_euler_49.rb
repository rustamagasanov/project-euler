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
