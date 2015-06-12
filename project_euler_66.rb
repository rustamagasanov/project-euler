largest_x, largest_d = 0, 0
(2..1_000).each do |d|
  next if Math.sqrt(d) % 1 == 0.0
  loop.with_index(2) do |_, x|
    y = Math.sqrt( (x**2 - 1) / d.to_f )
    if y % 1 == 0.0
      puts "#{x}^2 - #{d}*#{y.to_i}^2 = 1"
      if x > largest_x
        largest_x, largest_d = x, d
      end
      break
    end
  end
end

puts "largest x = #{largest_x}, largest d = #{largest_d}"
