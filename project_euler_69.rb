class EulersTotient
  def phi(n)
    phi = (1..n).inject(0) { |p, i| p += 1 if n.gcd(i) == 1; p }
    phis[n] = phi
  end

  def phis
    @phis ||= []
  end
end

t = EulersTotient.new
puts (2..1_000_000).inject(0) { |memo, n|
  p n
  res = n / t.phi(n)
  res > memo ? res : memo
}
