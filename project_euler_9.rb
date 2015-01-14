# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#
# a^2 + b^2 = c^2
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

(1..500).to_a.repeated_combination(3) { |c| puts c[0]*c[1]*c[2] if c[0] + c[1] + c[2] == 1000 && c[0] < c[1] && c[1] < c[2] && c[0]*c[0] + c[1]*c[1] == c[2]*c[2] }
