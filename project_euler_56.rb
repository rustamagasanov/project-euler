max = 0
(1..100).each do |a|
  (1..100).each do |b|
    current = (a**b).to_s.chars.map(&:to_i).reduce(:+)
    max = current if current > max
  end
end
puts max
