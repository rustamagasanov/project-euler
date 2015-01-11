# Smallest multiple
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
i = 0
catch(:done) do
  loop do
    i += 1
    20.downto(11) do |digit|
      break if i % digit != 0
      throw(:done) if digit == 11
    end
  end
end

puts i
