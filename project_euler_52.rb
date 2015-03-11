# Permuted multiples
# Problem 52
# It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits, but in a different order.
#
# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.

loop.with_index do |_, i|
  next if i < 10

  i_chars = i.to_s.chars.sort

  if (6 * i).to_s.chars.sort == i_chars &&
     (5 * i).to_s.chars.sort == i_chars &&
     (4 * i).to_s.chars.sort == i_chars &&
     (3 * i).to_s.chars.sort == i_chars &&
     (2 * i).to_s.chars.sort == i_chars
    puts i
    break
  end
end
