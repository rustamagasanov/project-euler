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

primes = EratosthenesSieve.new(99_999).get_primes
p primes.select { |p| p >= 10 && p <= 99 }

p = '1234567'
positions = []

loop.with_index(1) do |_, i|
  pattern = i.to_s(2).rjust(3, '0')
  break if pattern.size > p.size
  new_position = (0..pattern.size - 1).select { |j| pattern[j] == '1' }
  positions << new_position unless positions.include?(new_position) || new_position.size == p.size
end

positions.each do |pos|
  q = p.dup
  pos.each { |i| q[i] = '*' }
  p q
end
p positions
