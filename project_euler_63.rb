# 10^n will never have n digits so 1..9
count = 0
1.upto(9) do |i|
  1.upto(50) do |j|
    count += 1 if (i**j).to_s.chars.count == j
  end
end
puts count
