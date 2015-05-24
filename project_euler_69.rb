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
    primes = EratosthenesSieve.new(limit).get_primes
    phis = Array.new(limit)

    # if p is prime, phi(p) = p - 1
    primes.each { |p| phis[p] = p - 1 }

    # if n=p1*p2 phi(n) = phi(p1) * phi(p2) = (p1 - 1) * (p2 - 1)
    (0..primes.size - 1).each do |p1|
      ((p1 + 1)..primes.size - 1).each do |p2|
        n = primes[p1] * primes[p2]
        next if n > limit
        phis[n] = (primes[p1] - 1) * (primes[p2] - 1)
      end
    end

    # if n is even, phi(2n) = 2 * phi(n)
    (2..limit).each do |n|
      if n.even? && !phis[n].nil?
        if 2 * n <= limit && phis[2 * n].nil?
          phis[2 * n] = 2 * phis[n]
        end
      end
    end

    p phis

    (2..limit).each do |n|
    end

    # puts (2..10).inject(0) { |memo, n|
    #   res = n / t.phi(n)
    #   p n if n % 1000 == 0
    #   # p "#{n} -> #{res}"
    #   # p "#{n} -> f(n)=#{t.phi(n)}, #{res}"
    #   # res > memo ? res : memo
    #   if res > memo
    #     # p "#{n} -> f(n)=#{t.phi(n)}, #{res}"
    #     n
    #   else
    #     memo
    #   end
    # }

  end

  def phi(n)
    if phis[n].nil?
      # if p is prime, phi(p) = p - 1 (for p < 10^20)
      if prime?(n)
        phi = n - 1
        add_prime(n)
      else
        phi = (1..n).inject(0) { |p, i| p += 1 if n.gcd(i) == 1; p }
      end
    else
      phi = phis[n]
    end

    phis[n] = phi
    # if n is even, phi(2n) = 2 phi(n)
    if n.even?
      phis[2 * n] = 2 * phi
    end

    phi
  end

  def phis
    @phis ||= []
  end

  def primes
    @primes ||= []
  end

  # if n=p1*p2 phi(n) = phi(p1) * phi(p2) = (p1 - 1) * (p2 - 1)
  def add_prime(p2)
    primes.each do |p1|
      phis[p1 * p2] = (p1 - 1) * (p2 - 1)
    end
    primes << p2
  end

  def prime?(n)
    return false if n < 2
    (2..Math.sqrt(n).to_i).each do |i|
      return false if n % i == 0
    end
    true
  end
end


Benchmark.bm do |x|
  x.report do
    # p EratosthenesSieve.new(100).get_primes
    EulersTotientMax.new(10).n_divided_phi
  end
end
