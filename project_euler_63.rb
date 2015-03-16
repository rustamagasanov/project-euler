# Powerful digit counts
# Problem 63
# The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit number, 134217728=8^9, is a ninth power.
#
# How many n-digit positive integers exist which are also an nth power?

# 10^n will never have n digits so 1..9
count = 0
1.upto(9) do |i|
  1.upto(50) do |j|
    count += 1 if (i**j).to_s.chars.count == j
  end
end
puts count
