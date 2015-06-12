(2..7).each do |d|
  next if Math.sqrt(d) % 1 == 0.0
  catch(:solution_found) do
    loop.with_index(1) do |_, x|
      loop.with_index(1) do |_, y|
        res = x**2 - d * y**2

        if res == 1
          puts "#{x}^2 - #{d}*#{y}^2 = 1"
          throw(:solution_found)
        end

        break if res < 1
      end
    end
  end
end
