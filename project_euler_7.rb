i = 13
prime = 6

while prime != 10_001
  i += 1
  not_prime = false
  (2..(i - 1)).each do |d|
    if i % d == 0
      not_prime = true
      break
    end
  end

  if !not_prime
    prime += 1
    #puts "Found prime: #{ i }"
  end
end

puts i