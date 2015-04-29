def coprimes(n)
  coprimes = []

  n_divs = [1]
  (2..n / 2).each do |i|
    n_divs << i if n % i == 0
  end
  n_divs = n_divs + [n]

  (1..n - 1).each do |i|
    divs = [1]
    (2..i / 2).each do |j|
      divs << j if i % j == 0
    end
    divs = divs + [i]

    coprimes << i if n_divs & divs == [1]
  end

  coprimes
end

(2..10).each do |i|
  p "#{ i }: #{ coprimes(i) }"
  # (1...i).each do |j|

  # end
end
