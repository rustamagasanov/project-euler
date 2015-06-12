largest_x, largest_d = 0, 0
(2..1000).each do |d|
  next if Math.sqrt(d) % 1 == 0.0
  catch(:solution_found) do
    loop.with_index(1) do |_, x|
      loop.with_index(1) do |_, y|
        res = x**2 - d * y**2

        if res == 1
          puts "#{x}^2 - #{d}*#{y}^2 = 1"
          if x > largest_x
            largest_x, largest_d = x, d
          end
          throw(:solution_found)
        end

        break if res < 1
      end
    end
  end
end

puts "largest x = #{largest_x}, largest d = #{largest_d}"
