# Largest palindrome product
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

largest_palindrome = 0
100.upto(999) do |i|
  i.upto(999) do |j|
    product = i * j
    if product.to_s == product.to_s.reverse && product > largest_palindrome
      largest_palindrome = product
    end
  end
end

puts largest_palindrome
