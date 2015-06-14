# Diophantine equation
# Problem 66
# Consider quadratic Diophantine equations of the form:
#
# x^2 – D*y^2 = 1
#
# For example, when D=13, the minimal solution in x is 649^2 – 13×180^2 = 1.
#
# It can be assumed that there are no solutions in positive integers when D is square.
#
# By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain the following:
#
# 3^2 – 2×2^2 = 1
# 2^2 – 3×1^2 = 1
# 9^2 – 5×4^2 = 1
# 5^2 – 6×2^2 = 1
# 8^2 – 7×3^2 = 1
#
# Hence, by considering minimal solutions in x for D ≤ 7, the largest x is obtained when D=5.
#
# Find the value of D ≤ 1000 in minimal solutions of x for which the largest value of x is obtained.

# https://en.wikipedia.org/wiki/Pell%27s_equation
# https://en.wikipedia.org/wiki/Chakravala_method
# http://cs.annauniv.edu/insight/Reading/algebra/indet/chakra.htm
# http://cs.annauniv.edu/insight/Reading/algebra/indet/chakraex.htm

# largest_x, largest_d = 0, 0
# (2..1_000).each do |d|
#   next if Math.sqrt(d) % 1 == 0.0
#   loop.with_index(2) do |_, x|
#     y = Math.sqrt( (x**2 - 1) / d.to_f )
#     if y % 1 == 0.0
#       puts "#{x}^2 - #{d}*#{y.to_i}^2 = 1"
#       largest_x, largest_d = x, d if x > largest_x
#       break
#     end
#   end
# end
#
# puts "largest x = #{largest_x}, largest d = #{largest_d}"

r = 0
p = 1
k = 1
x = 1
y = 0

d = 61

loop do
  r += 1

  new_p = nil

  loop.with_index(1) do |_, i|
    if (p + i) % k == 0
      if new_p == nil || (i ** 2 - d) < new_p
        new_p = i
      else
        break
      end
    else
      next
    end
  end


  # p = new_p
  new_k = (new_p ** 2 - d) / k
  # k = (new_p ** 2 - d) / k
  new_x = (new_p * x + d * y) / k.abs
  # x = (new_p * x + d * y) / k.abs
  new_y = (new_p * y + x) / k.abs
  # y = (new_p * y + x) / k.abs

  p "#{new_p} #{new_k} #{new_x} #{new_y}"
  p = new_p
  k = new_k
  x = new_x
  y = new_y
  # p "#{p} #{k} #{x} #{y}"
  # break if r == 5
  break if k == 1
end
