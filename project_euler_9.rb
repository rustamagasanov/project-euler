# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

combinations = (1..500).to_a.repeated_combination(3).to_a
combinations_index = 1

loop do
  correct_triplet = false

  while !correct_triplet
    a, b, c = combinations[combinations_index]
    combinations_index += 1
    correct_triplet = true if a < b && b < c
  end

  if a + b + c == 1000 && a*a + b*b == c*c
    puts "Triplet found: #{ a }^2(#{ a**2 }) + #{ b }^2(#{ b**2 }) = #{ c }^2(#{ c**2 }); a + b + c = #{ a + b + c }; a * b * c = #{ a * b * c }"
    break
  end
end
