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
#
# size = 9003
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
