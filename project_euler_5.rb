n = 19
answer_not_found = true

while answer_not_found
  n += 1
  20.downto(1) do |digit|
    unless n % digit == 0
      break
    end
    if digit == 1
      answer_not_found = false
    end
  end
end

p n