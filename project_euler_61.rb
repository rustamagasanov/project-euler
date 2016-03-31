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

def polygonal_numbers(func)
  numbers = []
  loop.with_index do |_, i|
    number = PolygonalNumbers.send(func, i)
    if number.to_s.length > 4
      break
    elsif number.to_s.length == 4
      numbers << number
    end
  end
  numbers
end

numbers = {}
numbers[:triangles]   = polygonal_numbers('triangle')
numbers[:squares]     = polygonal_numbers('square')
numbers[:pentagonals] = polygonal_numbers('pentagonal')
numbers[:hexagonals]  = polygonal_numbers('hexagonal')
numbers[:heptagonals] = polygonal_numbers('heptagonal')
numbers[:octagonals]  = polygonal_numbers('octagonal')

def calculate(groups, remaining_groups, numbers, result = [])
  p result
  return false if remaining_groups.size < 2
  numbers[remaining_groups[0]].each do |n0|
    numbers[remaining_groups[1]].each do |n1|
      if remaining_groups.size == 2 && n0.to_s[2..3] == n1.to_s[0..1] && n1.to_s[2..3] == result[0]
        result + [n1]
      elsif n0.to_s[2..3] == n1.to_s[0..1]
        res = remaining_groups == groups ? [n0, n1] : result + [n1]
        calculate(groups, remaining_groups[1..-1], numbers, res)
      else
        false
      end
    end
  end
end

[:triangles, :squares, :pentagonals, :hexagonals, :heptagonals, :octagonals].permutation.each do |permutation|
  p calculate(permutation, permutation, numbers)
end

catch(:done) do
  [:triangles, :squares, :pentagonals, :hexagonals, :heptagonals, :octagonals].permutation.each do |permutation|
    numbers[permutation[0]].each do |n0|
      numbers[permutation[1]].each do |n1|
        if n0.to_s[2..3] == n1.to_s[0..1]
          numbers[permutation[2]].each do |n2|
            if n1.to_s[2..3] == n2.to_s[0..1]
              numbers[permutation[3]].each do |n3|
                if n2.to_s[2..3] == n3.to_s[0..1]
                  numbers[permutation[4]].each do |n4|
                    if n3.to_s[2..3] == n4.to_s[0..1]
                      numbers[permutation[5]].each do |n5|
                        if n4.to_s[2..3] == n5.to_s[0..1]
                          if n5.to_s[2..3] == n0.to_s[0..1]
                            p permutation
                            puts "#{n0} #{n1} #{n2} #{n3} #{n4} #{n5}"
                            puts [n0, n1, n2, n3, n4, n5].reduce(:+)
                            throw(:done)
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

