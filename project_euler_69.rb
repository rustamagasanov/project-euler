def coprimes(n)
  coprimes = [1]
  (2..n).each do |i|
    if n.gcd(i) > 1
      coprimes << i
    end
  end
  coprimes
  # return false if n < 2
  # (2..Math.sqrt(n).to_i).each do |i|
  #   return false if n % i == 0
  # end
  # true
end

(2..10).each do |i|
  p "#{ i }: #{ coprimes(i) }"
  # (1...i).each do |j|

  # end
end
