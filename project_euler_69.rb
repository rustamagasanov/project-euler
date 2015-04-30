class TotientFunc
  def coprimes(n)
    coprimes = []

    n_divs = [1]
    (2..n / 2).each do |i|
      n_divs << i if n % i == 0
    end
    n_divs = n_divs + [n]
    known_divisors[n] = n_divs

    (1..n - 1).each do |i|
      if known_divisors[i] == nil
        divs = [1]
        (2..i / 2).each do |j|
          divs << j if i % j == 0
        end
        divs = divs + [i]
        known_divisors[i] = divs
      else
        divs = known_divisors[i]
      end

      coprimes << i if n_divs & divs == [1]
    end

    coprimes
  end

  def known_divisors
    @known_divisors ||= []
  end
end

t = TotientFunc.new
puts (2..1_000_000).inject(0) { |memo, i|
  # p "#{ i }: #{ i / coprimes(i).count.to_f }"
  p i
  res = i / t.coprimes(i).count.to_f
  res > memo ? res : memo
}
