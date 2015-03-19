# Goldbach's other conjecture
# Problem 46
# It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
#
# 9 = 7 + 2×1^2
# 15 = 7 + 2×2^2
# 21 = 3 + 2×3^2
# 25 = 7 + 2×3^2
# 27 = 19 + 2×2^2
# 33 = 31 + 2×1^2
#
# It turns out that the conjecture was false.
#
# What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

def prime?(n)
  return false if n < 2
  (2..Math.sqrt(n).round).each { |i| return false if n % i == 0 }
  true
end

catch(:done) do
  loop.with_index(2) do |_, i|
    next if i.even? || prime?(i)
    loop.with_index(1) do |_, y|
      if 2 * y > i
        puts i
        throw(:done)
      end
      break if prime?(i - 2 * y**2)
    end
  end
end
