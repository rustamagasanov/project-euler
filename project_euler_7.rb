# 10001st prime
# Problem 7
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#
# What is the 10 001st prime number?

def prime?(num)
  return false if num < 2
  (2..Math.sqrt(num).to_i).each do |i|
    return false if num % i == 0
  end
  true
end

prime_count = 0

loop.each_with_index do |_, i|
  prime_count += 1 if prime?(i)
  if prime_count == 10_001
    puts i
    break
  end
end
