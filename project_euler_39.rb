# Integer right triangles
# Problem 39
# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.
#
# {20,48,52}, {24,45,51}, {30,40,50}
#
# For which value of p ≤ 1000, is the number of solutions maximised?

solutions = Hash.new(0)
catch(:done) do
  loop.with_index do |_, c|
    c.downto(1).each do |a|
      a.downto(1).each do |b|
        if c * c == a * a + b * b
          perimeter = a + b + c
          if perimeter <= 1000
            solutions[perimeter] += 1
          else
            throw(:done)
          end
        end
      end
    end
  end
end
puts solutions.key(solutions.values.max)
