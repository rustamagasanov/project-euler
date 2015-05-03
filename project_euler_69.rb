require 'benchmark'

class EulersTotient
  def phi(n)
    # if p is prime, phi(p) = p - 1 (for p < 10^20)
    phi = if phis[n].nil?
      if prime?(n)
        n - 1
      else
        (1..n).inject(0) { |p, i| p += 1 if n.gcd(i) == 1; p }
      end
    else
      phis[n]
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

  def prime?(n)
    return false if n < 2
    (2..Math.sqrt(n).to_i).each do |i|
      return false if n % i == 0
    end
    true
  end
end

t = EulersTotient.new

Benchmark.bm do |x|
  x.report do
    puts (2..10_000).inject(0) { |memo, n|
      p n
      res = n / t.phi(n)
      res > memo ? res : memo
    }
  end

  x.report do
  end
end
