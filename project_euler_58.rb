# Spiral primes
# Problem 58
# Starting with 1 and spiralling anticlockwise in the following way, a square spiral with side length 7 is formed.
#
# 37 36 35 34 33 32 31
# 38 17 16 15 14 13 30
# 39 18  5  4  3 12 29
# 40 19  6  1  2 11 28
# 41 20  7  8  9 10 27
# 42 21 22 23 24 25 26
# 43 44 45 46 47 48 49
#
# It is interesting to note that the odd squares lie along the bottom right diagonal, but what is more interesting is that 8 out of the 13 numbers lying along both diagonals are prime; that is, a ratio of 8/13 ≈ 62%.
#
# If one complete new layer is wrapped around the spiral above, a square spiral with side length 9 will be formed. If this process is continued, what is the side length of the square spiral for which the ratio of primes along both diagonals first falls below 10%?

# class SpiralMatrix
#   attr_reader :size
#   attr_accessor :matrix
#
#   def initialize(size)
#     @size = size
#   end
#
#   def create
#     matrix = Array.new(size) { Array.new(size) }
#
#     i, j = matrix.size / 2, matrix.size / 2
#     current_digit = 1
#
#     matrix[i][j] = current_digit
#     current_digit += 1
#
#     direction = :right
#     step_size = 1
#
#     catch(:done) do
#       loop do
#         if direction == :right
#           step_size.times do
#             j += 1
#             throw(:done) if j >= matrix.size
#             matrix[i][j] = current_digit
#             current_digit += 1
#           end
#           direction = :top
#         end
#
#         if direction == :top
#           step_size.times do
#             i -= 1
#             matrix[i][j] = current_digit
#             current_digit += 1
#           end
#           direction = :left
#           step_size += 1
#         end
#
#         if direction == :left
#           step_size.times do
#             j -= 1
#             matrix[i][j] = current_digit
#             current_digit += 1
#           end
#           direction = :bottom
#         end
#
#         if direction == :bottom
#           step_size.times do
#             i += 1
#             matrix[i][j] = current_digit
#             current_digit += 1
#           end
#           direction = :right
#           step_size += 1
#         end
#       end
#     end
#
#     matrix
#   end
# end
#

class PrimeChecker
  def self.check(n)
    return false if n <= 2
    (2..Math.sqrt(n).to_i).each do |i|
      return false if n % i == 0
    end
    true
  end
end

# size = 7
#
# loop do
#   matrix = SpiralMatrix.new(size).create
#   digits = (0..size - 1).map { |i| matrix[i][i] } +
#            (0..size - 1).map { |i| matrix[i][size - 1 - i] }
#   primes_count = digits.select { |i| PrimeChecker.check(i) }.count
#   if (primes_count/(digits.count - 1).to_f).round(2) < 0.1
#     puts size
#     break
#   end
#
#   p size
#   p (primes_count/(digits.count - 1).to_f).round(2)
#   size += 2
# end


step_size = 2
digits_count = 0
primes_count = 0
current_digit = 1
loop do
  digits = []
  4.times do
    current_digit += step_size
    digits << current_digit
  end
  digits_count += 4
  primes_count += digits.select { |i| PrimeChecker.check(i) }.count

  if (primes_count/(digits_count + 1).to_f) < 0.1
    puts step_size + 1
    break
  end

  step_size += 2
end
