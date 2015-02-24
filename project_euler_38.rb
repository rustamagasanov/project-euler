def pandigital?(n)
  n.size == 9 && n.chars.uniq.map(&:to_i).size == 9 && !n.to_s.include?('0')
end

largest_pandigital = 0
loop.each_with_index do |_, i|
  products = []
  multiplier = 1

  while products.join.length < 9
    products << i * multiplier
    multiplier += 1
  end

  if pandigital?(products.join) && products.join.to_i > largest_pandigital
    largest_pandigital = products.join.to_i
    puts largest_pandigital
  end

  break if i.to_s.size >= 5
end
