# Truncatable primes
# Problem 37
# The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
#
# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
#
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

def prime?(num)
  return false if num < 2
  (2..(Math.sqrt(num).to_i)).each do |n|
    return false if num % n == 0
  end
  true
end

def truncatable_prime?(n)
  return false if n < 10
  if prime?(n)
    n = n.to_s
    (n.length - 1).times do |i|
      if !prime?(n[0..i].to_i) || !prime?(n[i + 1..-1].to_i)
        return false
      end
    end
    true
  else
    false
  end
end

truncatable_primes = []

loop.each_with_index do |_, i|
  truncatable_primes << i if truncatable_prime?(i)
  break if truncatable_primes.size == 11
end

puts truncatable_primes.inject(:+)

