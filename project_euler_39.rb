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
