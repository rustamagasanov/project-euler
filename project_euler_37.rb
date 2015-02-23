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

i = 0
truncatable_primes = []

loop do
  i += 1
  truncatable_primes << i if truncatable_prime?(i)
  break if truncatable_primes.size == 11
end

puts truncatable_primes.inject(:+)

