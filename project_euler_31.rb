ways = [1] + [0]*200

coins = [1, 2, 5, 10, 20, 50, 100, 200]

coins.each do |coin|
  (coin..200).each do |i|
    ways[i] += ways[i - coin]
  end
end

puts ways[200]
