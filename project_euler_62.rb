# Cubic permutations
# Problem 62
# The cube, 41063625 (345^3), can be permuted to produce two other cubes: 56623104 (384^3) and 66430125 (405^3). In fact, 41063625 is the smallest cube which has exactly three permutations of its digits which are also cube.
#
# Find the smallest cube for which exactly five permutations of its digits are cube.

loop.with_index(10).with_object(Hash.new{[]}) do |(_, i), p|
  cube = (i * i * i)
  sorted_cube = cube.to_s.chars.sort.join
  p[sorted_cube] <<= cube
  if p[sorted_cube].size == 5
    puts p[sorted_cube].min
    break
  end
end
