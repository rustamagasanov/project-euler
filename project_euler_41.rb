# Pandigital prime
# Problem 41
# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
#
# What is the largest n-digit pandigital prime that exists?

def prime?(num)
  return false if num < 2
  (2..Math.sqrt(num).to_i).each do |i|
    return false if num % i == 0
  end
  true
end

catch(:done) do
  (1..9).to_a.reverse.each do |n|
    (1..n).to_a.reverse.permutation(n).map(&:join).map(&:to_i).each do |permutation|
      if prime?(permutation)
        puts permutation
        throw(:done)
      end
    end
  end
end
