# Cyclical figurate numbers
# Problem 61
# Triangle, square, pentagonal, hexagonal, heptagonal, and octagonal numbers are all figurate (polygonal) numbers and are generated by the following formulae:
#
# Triangle    P3,n=n(n+1)/2   1, 3, 6, 10, 15, ...
# Square      P4,n=n^2         1, 4, 9, 16, 25, ...
# Pentagonal  P5,n=n(3n−1)/2  1, 5, 12, 22, 35, ...
# Hexagonal   P6,n=n(2n−1)    1, 6, 15, 28, 45, ...
# Heptagonal  P7,n=n(5n−3)/2  1, 7, 18, 34, 55, ...
# Octagonal   P8,n=n(3n−2)    1, 8, 21, 40, 65, ...
# The ordered set of three 4-digit numbers: 8128, 2882, 8281, has three interesting properties.
#
# The set is cyclic, in that the last two digits of each number is the first two digits of the next number (including the last number with the first).
# Each polygonal type: triangle (P3,127=8128), square (P4,91=8281), and pentagonal (P5,44=2882), is represented by a different number in the set.
# This is the only set of 4-digit numbers with this property.
# Find the sum of the only ordered set of six cyclic 4-digit numbers for which each polygonal type: triangle, square, pentagonal, hexagonal, heptagonal, and octagonal, is represented by a different number in the set.

module PolygonalNumbers
  extend self

  def triangle(n)
    n * (n + 1) / 2
  end

  def square(n)
    n**2
  end

  def pentagonal(n)
    n * (3 * n - 1) / 2
  end

  def hexagonal(n)
    n * (2 * n - 1)
  end

  def heptagonal(n)
    n * (5 * n - 3) / 2
  end

  def octagonal(n)
    n * (3 * n - 2)
  end
end

triangles   = []
squares     = []
pentagonals = []

(1000..9999).each do |n|
  triangles   << PolygonalNumbers.triangle(n)
  squares     << PolygonalNumbers.square(n)
  pentagonals << PolygonalNumbers.pentagonal(n)
end

def cycle?(a, b)
  (a / 100).to_s == b.to_s[2..3]
end

tri_sq_cycles = []

require 'benchmark'

Benchmark.bm do |x|
  x.report do
    triangles[0..2000].each do |triangle|
      squares[0..2000].each do |square|
        if cycle?(triangle, square)
          tri_sq_cycles << [triangle, square]
        end
      end
    end
  end
end

# p tri_sq_cycles
