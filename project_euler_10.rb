# Summation of primes
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

def prime?(num)
  return false if num == 0 || num == 1
  (2..Math.sqrt(num).to_i).each do |i|
    return false if num % i == 0
  end
  true
end

result = (0..2_000_000).inject do |memo, num|
  if prime?(num)
    puts "memo: #{ memo }; num: #{ num }"
    memo += num
  else
    memo
  end
end

puts "result = #{ result }"
