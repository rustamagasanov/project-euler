require 'benchmark'

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

class EulersTotientMax
  attr_reader :limit

  def initialize(limit)
    @limit = limit
  end

  def n_divided_phi
    phis = Array.new(limit)
    primes = nil
    Benchmark.bm do |x|
      x.report do
        puts "Getting primes"
        primes = EratosthenesSieve.new(limit).get_primes
      end


      x.report do
        puts "Setting p - 1"
        # if p is prime, phi(p) = p - 1
        primes.each { |p| phis[p] = p - 1 }
      end

      x.report do
        puts "Setting p ^"
        # if p is prime, phi(p^a) = p^a * (1 - 1/p)
        primes.each do |p|
          loop.with_index(2) do |_, power|
            if p**power < limit
              phis[p**power] = p**power * (1 - 1 / p)
            else
              break
            end
          end
        end
      end

      x.report do
        puts "Setting p1 - 1 * p2 - 1"
        # if n=p1*p2 phi(n) = phi(p1) * phi(p2) = (p1 - 1) * (p2 - 1)
        (0..primes.size - 1).each do |p1|
          ((p1 + 1)..primes.size - 1).each do |p2|
            n = primes[p1] * primes[p2]
            next if n > limit
            phis[n] = (primes[p1] - 1) * (primes[p2] - 1)
          end
        end
      end

      x.report do
        puts "Setting even"
        # if n is even, phi(2n) = 2 * phi(n)
        (2..limit).each do |n|
          if n.even? && !phis[n].nil?
            if 2 * n <= limit && phis[2 * n].nil?
              phis[2 * n] = 2 * phis[n]
            end
          end
        end
      end

      puts phis.select { |p| p.nil? }.count

      x.report do
        puts "Other"
        (2..limit).each do |n|
          if phis[n].nil?
            phis[n] = (1..n).inject(0) { |p, i| p += 1 if n.gcd(i) == 1; p }
          end
        end
      end
    end
    res = (2..limit).map { |n| n / phis[n].to_f }
    res.index(res.max) + 2
  end
end


# p EratosthenesSieve.new(100).get_primes
p EulersTotientMax.new(1_0000).n_divided_phi
