i = 0
catch(:done) do
  loop do
    i += 1
    20.downto(11) do |digit|
      break if i % digit != 0
      throw(:done) if digit == 11
    end
  end
end

puts i
