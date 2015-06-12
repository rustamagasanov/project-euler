largest_x, largest_d = 0, 0
(2..1_000).each do |d|
  next if Math.sqrt(d) % 1 == 0.0
  catch(:solution_found) do
    loop.with_index(2) do |_, x|
      y = Math.sqrt( (x**2 - 1) / d.to_f )
      if y % 1 == 0.0
        puts "#{x}^2 - #{d}*#{y.to_i}^2 = 1"
        if x > largest_x
          largest_x, largest_d = x, d
        end
        throw(:solution_found)
      end

      # loop.with_index(1) do |_, y|
      #   res = x**2 - d * y**2
      #
      #   if res == 1
      #     puts "#{x}^2 - #{d}*#{y}^2 = 1"
      #     if x > largest_x
      #       largest_x, largest_d = x, d
      #     end
      #     throw(:solution_found)
      #   end
      #
      #   break if res < 1
      # end
    end
  end
end

puts "largest x = #{largest_x}, largest d = #{largest_d}"
