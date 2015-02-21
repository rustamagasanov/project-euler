# Even Fibonacci numbers
# Problem 2
# Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
# By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

n1, n2, sum = 1, 1, 0

loop do
  break if n2 > 4_000_000
  sum += n2 if n2.even?
  n1, n2 = n2, n1 + n2
end

puts sum
