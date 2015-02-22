# Circular primes
# Problem 35
# The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
#
# There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
#
# How many circular primes are there below one million?

def prime?(num)
  return false if num < 2
  (2..Math.sqrt(num).to_i).each do |i|
    return false if num % i == 0
  end
  true
end

puts (0..999_999).inject([]) { |memo, num|
  next memo if memo.include?(num)
  digits = num.to_s.chars

  rotations = (1..digits.size).inject([]) do |r, i|
    r << digits.rotate(i).join('').to_i
  end

  if rotations.all? { |i| prime?(i) }
    memo += rotations.uniq
  end
  memo
}.size
