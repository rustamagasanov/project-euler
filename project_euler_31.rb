p_1   = 1
p_2   = 2
p_5   = 5
p_10  = 10
p_20  = 20
p_50  = 50
p_100 = 100
p_200 = 200

coin_sums = []
sum = []
loop do
  if sum.reduce(:+).to_i < 200
    sum << p_1
  else
    coin_sums << sum
    sum = []
    break
  end
end
p coin_sums
