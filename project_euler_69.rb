require 'benchmark'

class EulersTotient
  def phi(n)

    phi = nil

    if phis[n].nil?
      prime = true

      (2..Math.sqrt(n).to_i).each do |i|
        if n % i == 0
          prime = false
          # if gcd(m, n) = 1, then phi(m*n) = phi(m) * phi(n)
          if (n / i).gcd(i) == 1
            if !phis[n / i].nil? && !phis[i].nil?
              phi = phis[n / i] * phis[i]
            end
            break
          end
        end
      end

      # if p is prime, phi(p) = p - 1 (for p < 10^20)
      if phi.nil? && prime
        phi = n - 1
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
    # puts (2..1_000_000).inject(0) { |memo, n|
    #   p n
    #   res = n / t.phi(n)
    #   res > memo ? res : memo
    # }

    puts (2..10_000).inject(0) { |memo, n|
      res = n / t.phi(n)
      # p "#{n} -> #{res}"
      # res > memo ? res : memo
      if res > memo
        p "#{n} -> f(n)=#{t.phi(n)}, #{res}"
        res
      else
        memo
      end
    }
  end

  x.report do
  end
end
