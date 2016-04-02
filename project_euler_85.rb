# Counting rectangles
# Problem 85
# By counting carefully it can be seen that a rectangular grid measuring 3 by 2 contains eighteen rectangles:
#
# Although there exists no rectangular grid that contains exactly two million rectangles, find the area of the grid with the nearest solution.

a = 3
b = 2

res = []

# 1x1
res << a / 1 * b

# 2x1
res << a / 2 * b

# 3x1
res << a / 3 * b

# horizontal piece widening (1x1, 2x1, 3x1 etc)
# (1..a).each do |i|
#   count << a / i * b
# end

