def prime?(num)
  return false if num == 0 || num == 1
  (2..Math.sqrt(num).to_i).each do |i|
    return false if num % i == 0
  end
  true
end

i = 0
prime = 0

loop do
  i += 1
  prime += 1 if prime?(i)
  break if prime == 10_001
end

puts i
